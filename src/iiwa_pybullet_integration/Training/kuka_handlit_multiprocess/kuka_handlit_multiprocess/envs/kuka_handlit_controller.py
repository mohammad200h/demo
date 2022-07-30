import os,  inspect
currentdir = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe())))
parentdir = os.path.dirname(os.path.dirname(currentdir))
os.sys.path.insert(0,parentdir)
from pkg_resources import resource_string,resource_filename

import pybullet as p
import numpy as np
import copy
import math
import pybullet_data
import time
import sys

from mamad_util import JointInfo


class Kuka_Handlit:

    def __init__(self,physic_engine,kuka_pos):
      #loading the model
      self._p = physic_engine
      robot_path = resource_filename(__name__,"/kuka_handlit_model/model.sdf")
      self._robot = self._p.loadSDF(robot_path)
      self._robot_id = self._robot[0]
      self._p.resetBasePositionAndOrientation(self._robot_id,kuka_pos[0:3],kuka_pos[3:])


      #jointInfo
      self.jointInfo = JointInfo()
      self.jointInfo.get_infoForAll_joints(self._robot)
      self.numJoints = self._p.getNumJoints(self._robot_id)
      self.num_Active_joint = self.jointInfo.getNumberOfActiveJoints()
      self.indexOf_activeJoints  = self.jointInfo.getIndexOfActiveJoints()

      self.fingerTip_link_name = ["distal_FF","distal_MF","distal_RF","thdistal"] #this are joints between final link and one before it
      self.pid = {
                  "hand":{
                    "MF":[
                            {
                             "p":1,
                             "d":1   
                            },
                            {
                             "p":1,
                             "d":1   
                            },
                            {
                             "p":1,
                             "d":1   
                            },
                            {
                             "p":1,
                             "d":1   
                            },
                          ] ,
                    "TH":[
                            {
                             "p":1,
                             "d":1   
                            },
                            {
                             "p":1,
                             "d":1
                            },
                            {
                             "p":1,
                             "d":1.
                            },
                            {
                             "p":1,
                             "d":1  
                            },
                        ]
                    }
      }
      self.joints_order = {
        "kuka":[i for i in range(7)],
        "FF":[i for i in range(7,7+4)],
        "MF":[i for i in range(11,11+4)],
        "RF":[i for i in range(15,15+4)],
        "TH":[i for i in range(19,19+4)]
      }

      #ee 
      self.kukaEndEffectorIndex = 6
      
    def reset(self,joint_values=None):
        #reseting the robot
        if  joint_values:
            for i in range (23):
                p.resetJointState(self._robot_id,self.indexOf_activeJoints[i],joint_values[i])   
        else:
            for i in range (0):
                p.resetJointState(self._robot_id,self.indexOf_activeJoints[i],0) 

    def getActionDimension(self):
      numOf_activeJoints = self.jointInfo.getNumberOfActiveJoints()
      return numOf_activeJoints #position x,y,z and roll/pitch/yaw euler angles of end effector

    def getObservationDimension(self):
      return len(self.getObservation())

    def getObservation_joint(self,format="list"):

      indexOfActiveJoints = self.jointInfo.getIndexOfActiveJoints()
      jointsInfo = self.jointInfo.getActiveJointsInfo()

      jointsStates = []
      joints_state = {} #key:joint ,value = joint state 

      for i in range(len(indexOfActiveJoints)):
        jointName  = jointsInfo[i]["jointName"]
        jointIndex = indexOfActiveJoints[i]
        jointState = p.getJointState(self._robot[0],jointIndex)
        joints_state[jointName] = jointState[0]
        jointsStates.append(jointState[0])

      if format == "dictinary":
        return joints_state
      else:
        return jointsStates

    def getObservation_palm(self):
      Index = self.get_palm_linkIndex()
      state = p.getLinkState(self._robot_id,Index)
      # print("\n")
      # print("state::controller",state)
      # print("\n")
      return state[0]+state[1]
      
    def getObservation(self,UseEuler=False):
      def finger_obs(UseEuler):
        state_dict = {}
        observation = []

        fingerTipIndexs = self.get_fingerTips_linkIndex()

        counter = 0 
        #getting fingers tip position and orientation
        for index in fingerTipIndexs:
          state = p.getLinkState(self._robot_id,index)#mamad:returns endeffector info position orientation
          pos = state[0] #mamad: linkWorldPosition
          orn = state[1] #mamad: linkWorldOrientation
          state_dict[self.fingerTip_link_name[counter]] = {"pos":pos,"orn":orn}                                          
          counter +=1

        #print("Debug::state_dict",state_dict)

        for finger in self.fingerTip_link_name:
          euler = p.getEulerFromQuaternion(state_dict[finger]["orn"])
          pos   = state_dict[finger]["pos"]  
          observation.extend(list(pos))
          if UseEuler ==True:
            observation.extend(list(euler))
          else:
            observation.extend(list(state_dict[finger]["orn"]))

        return observation

      def kuka_obs(UseEuler):
        observation = []
        kuka_ee_link_Index = self.get_kuka_ee_linkIndex()

        state = p.getLinkState(self._robot_id,kuka_ee_link_Index)#mamad:returns endeffector info position orientation
        pos = state[0] #mamad: linkWorldPosition
        orn = state[1] #mamad: linkWorldOrientation
        euler = p.getEulerFromQuaternion(orn)

        observation.extend(list(pos))
        if UseEuler ==True:
          observation.extend(list(euler))
        else:
          observation.extend(list(orn))

        return observation


      #self.cameraSetup()
      observation = kuka_obs(UseEuler)+finger_obs(UseEuler)
      #print("Debug::observation",observation)
      #print("Debug::len(observation)",len(observation))
      return observation

    def getPureObservation(self):
      obs = {
        "hand":{
          "joint_values":{
            "FF":[],
            "MF":[],
            "RF":[],
            "TH":[],
          },
          "xyz_rpy":{
            "FF":[],
            "MF":[],
            "RF":[],
            "TH":[],
            "palm":[]
          }

        },
        "kuka":{
          "joint_values":[],
          "xyz_rpy":[]

        }

      }

      def hand_joint_values():
        joint_values={
            "FF":[],
            "MF":[],
            "RF":[],
            "TH":[],
        }
        FF_key = ["J"+str(i)+"_FF" for i in range(1,5)]
        MF_key = ["J"+str(i)+"_MF" for i in range(1,5)]
        RF_key = ["J"+str(i)+"_RF" for i in range(1,5)]
        TH_key = ["THJ"+str(i) for i in range(1,6) if i !=3]
        # print("FF_key::",FF_key)
        # print("MF_key::",MF_key)
        # print("RF_key::",RF_key)
        # print("TH_key::",TH_key)

        joint_info = self.getObservation_joint(format="dictinary")
        cleaned_dic ={}
        for key,value in joint_info.items():
          cleaned_dic[key.decode()]=value

        # print([key.decode() for key in info.keys()])
        for key in FF_key:
          joint_values["FF"].append(cleaned_dic[key])
        for key in MF_key:
          joint_values["MF"].append(cleaned_dic[key])
        for key in RF_key:
          joint_values["RF"].append(cleaned_dic[key])
        for key in TH_key:
          joint_values["TH"].append(cleaned_dic[key])

        # print("joint_values::",joint_values)
        return joint_values

      def hand_xyz_rpy():
        #FF MF RF TH
        xyz_rpy={
            "FF":[],
            "MF":[],
            "RF":[],
            "TH":[],
            "palm":[]
          }
        fingertip_keys = ["FF","MF","RF","TH"]
        fingerTipIndexs = self.get_fingerTips_linkIndex()

        #getting pos and orn for fingers
        for i,index in enumerate(fingerTipIndexs):
          state = p.getLinkState(self._robot_id,index)#mamad:returns endeffector info position orientation
          pos = state[0] #mamad: linkWorldPosition
          orn = state[1] #mamad: linkWorldOrientation
          # print("state::",state)
          orn =p.getEulerFromQuaternion(orn)
          xyz_rpy[fingertip_keys[i]]=list(pos)+list(orn)

        palm_state = self.getObservation_palm()
        palm_pos = palm_state[:3]
        palm_orn = palm_state[3:]
        # print("palm_pos::",palm_pos)
        # print("palm_orn::",palm_orn)
        palm_orn =p.getEulerFromQuaternion(palm_orn)
        palm_xyz_rpy = list(palm_pos)+list(palm_orn)
        xyz_rpy["palm"]= palm_xyz_rpy

        # print("xyz_rpy::",xyz_rpy)

        return xyz_rpy

        # print("fingerTipIndexs::",fingerTipIndexs)

      def kuka_joint_values():
        kuka_joint_keys = ["J"+str(i) for i in range(7)]
        joint_values =[]
        joint_info = self.getObservation_joint(format="dictinary")
        cleaned_dic ={}
        for key,value in joint_info.items():
          cleaned_dic[key.decode()]=value

        for key in kuka_joint_keys:
          joint_values.append(cleaned_dic[key])

        return joint_values

      def kuka_xyz_rpy():
        xyz_rpy = []
        kuka_ee_link_Index = self.get_kuka_ee_linkIndex()

        state = p.getLinkState(self._robot_id,kuka_ee_link_Index)#mamad:returns endeffector info position orientation
        pos = state[0] #mamad: linkWorldPosition
        orn = state[1] #mamad: linkWorldOrientation
        orn = p.getEulerFromQuaternion(orn)

        xyz_rpy = pos+orn

        return xyz_rpy

      obs["hand"]["joint_values"] = hand_joint_values()
      obs['kuka']['joint_values'] = kuka_joint_values()
      obs['hand']['xyz_rpy'] = hand_xyz_rpy()
      obs['kuka']['xyz_rpy'] = kuka_xyz_rpy()

      # print("obs[hand']['joint_values']::",obs["hand"]["joint_values"])
      # print("\n")
      # print("obs['kuka']['joint_values']::",obs['kuka']['joint_values'])
      # print("\n")
      # print("obs['hand']['xyz_rpy']::",obs['hand']['xyz_rpy'])
      # print("\n")
      # print("obs['kuka']['xyz_rpy']::",obs['kuka']['xyz_rpy'])
      # print("\n")

      # sys.exit()
      return obs
  
    def applyAction(self,motorCommands,repalent_magnet=None,isGraspPhase=None):
      #total number of actions 23
      # print("controller::applyAction_2::",motorCommands)

      num_active_joints = self.jointInfo.getNumberOfActiveJoints()
      active_joints_info = self.jointInfo.getActiveJointsInfo()

      ######################Apply action ##################
      counter =0
      for i in range(23):

          jointIndex = active_joints_info[i]["jointIndex"]

          # print("i,pid,active_joints_info[i][jointIndex]::",i,self.get_pid(i),active_joints_info[i]["jointName"])

          #Applying command for kuka

          position = p.calculateInverseKinematics(self._robot_id,7,[0.5,0.6,1.2])

          if i < 7:# change context for kuka which  has 7 joint i = [0,6]
            maxVelocity=0.001
            force = 0
            if repalent_magnet:
              maxVelocity=repalent_magnet.get_velocity()
              if isGraspPhase:
                force = 200000
              else:
                force = 200
            # print("kuka::maxVelocity::",maxVelocity)
            # sys.exit()

            p.setJointMotorControl2(self._robot_id,jointIndex,p.POSITION_CONTROL,motorCommands[i], targetVelocity=0,force=force, maxVelocity=maxVelocity,positionGain=0.3,velocityGain=1)

         #change context for hand
          elif i>=7:

            #getting pid_values
            pid = self.get_pid(i)

            if isGraspPhase: #hand has 16 actions 
                p.setJointMotorControl2(bodyIndex=self._robot_id, jointIndex=jointIndex, controlMode=p.POSITION_CONTROL,
                                        targetVelocity=0,force=active_joints_info[i]["jointMaxForce"],maxVelocity=active_joints_info[i]["jointMaxVelocity"],
                                        targetPosition=motorCommands[i],positionGain=1,velocityGain=1)
                # print("hand::GraspPhase")
            else:
            
                # print("hand::not GraspPhase")
                p.setJointMotorControl2(bodyIndex=self._robot_id, jointIndex=jointIndex, controlMode=p.POSITION_CONTROL,
                                        targetVelocity=0,force=active_joints_info[i]["jointMaxForce"],maxVelocity=active_joints_info[i]["jointMaxVelocity"],
                                        targetPosition=0,positionGain=1,velocityGain=1)



          counter = counter+1

      # print("\n\n")
  
  #utility functions

    def get_fingerTips_linkIndex(self):
      fingerTips_linkIndex = []
      fingerTips_jointInfo = []
      fingerTip_joint_name_bytes = [i.encode(encoding='UTF-8',errors='strict') for i in self.fingerTip_link_name]

      # getting joints for the final link
      for i in fingerTip_joint_name_bytes:
        fingerTips_jointInfo.append(self.jointInfo.searchBy(key="linkName",value = i)[0])

      #extracting joint index which equivalent to link index

      for i in fingerTips_jointInfo:

      
        fingerTips_linkIndex.append(i["jointIndex"])  

      return fingerTips_linkIndex

    def get_palm_linkIndex(self):
      link_name ="palm_fake"

      link_name_encoded = link_name.encode(encoding='UTF-8',errors='strict')
      palm_link_jointInfo = self.jointInfo.searchBy(key="linkName",value =link_name_encoded )[0]

      palm_link_Index  = palm_link_jointInfo["jointIndex"]

      return palm_link_Index

    def get_kuka_ee_linkIndex(self):
      link_name ="lbr_iiwa_link_7"

      link_name_encoded = link_name.encode(encoding='UTF-8',errors='strict')
      kuka_ee_link_jointInfo = self.jointInfo.searchBy(key="linkName",value =link_name_encoded )[0]

      kuka_ee_link_Index     = kuka_ee_link_jointInfo["jointIndex"]

      return kuka_ee_link_Index
    
    def get_kuka_Active_joints(self):
      link_regex = r'(lbr_iiwa_link_)+[0-7]'
      robot_active_joints = self.jointInfo.getActiveJointsInfo()
      kuka_active_joints  = self.jointInfo.searchBy_regex("jointName",link_regex,robot_active_joints)
      return kuka_active_joints

    def get_hand_active_joints_index(self):
            #getting links with active joints
          hand_links = self.modelInfo.get_hand_links()
          hand_links_info = []

          for link_name in hand_links:
            link_info = self.modelInfo.searchBy(key="link",value=link_name)
            hand_links_info.append(link_info)

          hand_links_info_with_active_joints = []
          for hand_link_info in hand_links_info:
            if hand_link_info["joint"]["j_type"] != "fixed":
              hand_links_info_with_active_joints.append(hand_link_info)
          hand_link_name_active_joint = [link["link_name"] for link in hand_links_info_with_active_joints ]
          hand_indexOf_active_joints =[]

          hand_link_name_active_joint_bytes = [i.encode(encoding='UTF-8',errors='strict') for i in hand_link_name_active_joint]


          for Link in hand_link_name_active_joint_bytes:

            link = self.jointInfo.searchBy("linkName",Link)[0]
            hand_indexOf_active_joints.append(link["jointIndex"])

          return hand_indexOf_active_joints

    def detect_control_mode(self,i):
      if i in self.joints_order["FF"]:
        return "FF","MF"
      elif i in self.joints_order["MF"]:
        return "MF","MF"
      elif i in self.joints_order["RF"]:
        return "RF","MF"
      elif i in self.joints_order["TH"]:
        return "TH","TH"
      else:
        #replace this with an error
        return None,False

    def get_pid(self,i):
      finger,control_mode = self.detect_control_mode(i)

      if control_mode =="MF":
        joint_number = self.joints_order[finger].index(i)
        pid = self.pid["hand"]["MF"][joint_number]
        return pid

      elif control_mode =="TH":
        joint_number = self.joints_order[finger].index(i)
        pid = self.pid["hand"]["TH"][joint_number]
        return pid

      else:
        #replace this with an error
        return False

    def get_robot_id(self):
      return self._robot_id