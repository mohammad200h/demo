#!/usr/bin/env python
from time import sleep
import pybullet as p
import numpy as np
from pkg_resources import resource_string,resource_filename


import random
from .mamad_util import JointInfo
import sys
import io
import yaml
import math

import os, inspect
currentdir = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe())))
print ("current_dir=" + currentdir)
# sys.exit()

class AdativeActionRepeat():
    def __init__(self,use_sdf_control=False,redner=True,control_mode="MF",sim_step=1./500.,
        control_setting = {
                        "force":None,
                        "maxVelocity":None,
                        "positionGain":None,
                        "velocityGain":None
                      }
    ):
        print("AdativeActionRepeat::control_setting:: ",control_setting)


        self.RAR = RecordAdaptiveRepeat(use_sdf_control=use_sdf_control,
                                render=redner,sim_step=sim_step,
                                control_mode=control_mode,
                                control_setting=control_setting)
         
        
        self.control_mode = control_mode
        self.action_repeat_dic = self.RAR()
        self.joints = {
            "Finger":{
                    #[knuckle,proximal,middle,distal]
                    #J4      J3       J2     J1
                    "high":[0.349066,1.5708,1.5708,1.5708],
                    "low":[-0.349066,0     ,0     ,0     ]
                  },
            "Thumb":{
                    #[THj5,THj4,THj2,THj1]
                    #[thbase,thproximal,thmiddle,thdistal]
                    "high":[1.0472,1.22173,0.698132 ,1.5708],
                    "low" :[-1.0472,0     ,-0.698132,0     ],
                  },
        }
        self.joint_limit ={
            "MF": {
                "high": self.joints["Finger"]["high"], 
                "low" : self.joints["Finger"]["low"]
            },
            "TH":{
                "high":self.joints["Thumb"]["high"],
                "low" :self.joints["Thumb"]["low"]
            }
        }
        self.joint_order = {
            #The order command are issued to joints 
            "MF":["J4","J3","J2","J1"],
            "TH":["THJ5","THJ4","THJ2","THJ1"]
        }


    def get(self,joint_obs,joint_command):
        steps = []
        max_timestep = 0
        a_r_dic = self.action_repeat_dic[self.control_mode]
        j_limit = self.joint_limit[self.control_mode]
        j_order = self.joint_order[self.control_mode]
        # print("\n\n")
        # print("joint_obs::",joint_obs)
        # print("\n\n")
        for i in range(len(joint_obs)):
            diff = abs(joint_command[i]-joint_obs[i])
            diff = 0 if diff <0.001 else diff
            diff_action_limit = abs(j_limit["high"][i]-j_limit["low"][i])
            step =  math.ceil(a_r_dic[j_order[i]] * diff/diff_action_limit)
            steps.append(step)
        

            # print("i:: ",i)
            # print("diff::",diff)
            # print("diff_action_limit::",diff_action_limit)
            # print("step::",step)

        #All the joints move together so we need to set the limit to the highest step 
        max_timestep = max(steps)

        return max_timestep,steps





class RecordAdaptiveRepeat():
    def __init__(self,use_sdf_control=False,render=True,sim_step=1./500.,control_mode="MF",
        control_setting = {
                    "force":None,
                    "maxVelocity":None,
                    "positionGain":None,
                    "velocityGain":None
                  }
        ):

        print("RecordAdaptiveRepeat::init::control_setting::",control_setting)

        self.joint_contro_setting_log = {
            "use_sdf_control":None,
            "force":None,
            "maxVelocity":None,
            "positionGain":None,
            "velocityGain":None
        }
        ######This is storage for unit test code ##########
        self.test_log = {}
        
        self._renders = render
        self.use_sdf_control = use_sdf_control
        if self._renders:
          self.guiClient = p.connect(p.GUI)
        else:
          self.guiClient = p.connect(p.DIRECT)
        # self.guiClient = p.connect(p.GUI)
        
        self.control_mode = control_mode
        self.sim_step = sim_step
        self.control_setting = control_setting




        
        self.fingers = ["FF","MF","RF","TH"]
        self.fingers_joints = ["J4","J3","J2","J1"]
        self.Thumb_joints   = ["THJ5","THJ4","THJ2","THJ1"]

        self.hand_steps={
            "MF":{ 
                #knuckle proximal middle distal
                #J4      J3       J2     J1
                "J4":None,
                "J3":None,
                "J2":None,
                "J1":None
            },
            "TH":{
                # thbase thproximal thmiddle thdistal
                # THJ5   THJ4       THJ2     THJ1 
                "THJ5":None,
                "THJ4":None,
                "THJ2":None,
                "THJ1":None
            }
        }

        self.joints = {
            "Finger":{
                    #[knuckle,proximal,middle,distal]
                    #J4      J3       J2     J1
                    "high":[0.349066,1.5708,1.5708,1.5708],
                    "low":[-0.349066,0     ,0     ,0     ]
                  },
            "Thumb":{
                    #[THj5,THj4,THj2,THj1]
                    #[thbase,thproximal,thmiddle,thdistal]
                    "high":[1.0472,1.22173,0.698132 ,1.5708],
                    "low" :[-1.0472,0     ,-0.698132,0     ],
                  },
        }
        self.joint_limits ={
            "MF": {
                "high": self.joints["Finger"]["high"], 
                "low" : self.joints["Finger"]["low"]
            },
            "TH":{
                "high":self.joints["Thumb"]["high"],
                "low" :self.joints["Thumb"]["low"]
            }
            
            
        }
        self.step = 0

    
    def __call__(self):
       
        p.resetDebugVisualizerCamera(1, 180, 0., [0., 0.2, 0.3])
        control_mode =self.control_mode
        Thumb_joints   = self.Thumb_joints
        fingers_joints = self.fingers_joints
        Robot,RobotId, endEffectorId = None,None,None

        


        for i in range(4):
        
            Robot,RobotId, endEffectorId = self.setUpWorld(control_mode=control_mode)
            context = self.getObservation_joint()
            command = context
            command[i]= self.joint_limits[control_mode]["high"][i]
            # print("context:: ",context)
            maxIters = 100000

            sleep(1.)
            step =0
            p.getCameraImage(320,200, renderer=p.ER_BULLET_HARDWARE_OPENGL )
            while(1):

            
                self.setMotors(Robot,RobotId, command)
                obs = self.getObservation_joint()[i]

                if abs(command[i]-obs)<0.001:
                    self.step = step
                    if control_mode =="TH":
                      self.hand_steps[control_mode][Thumb_joints[i]] = step
                    else:
                      self.hand_steps[control_mode][fingers_joints[i]] = step
                    break
                else:
                    if step >100000:
                      if control_mode =="TH":
                        self.hand_steps[control_mode][Thumb_joints[i]] = False
                        break
                      else:
                        self.hand_steps[control_mode][fingers_joints[i]] = False
                        break
                p.stepSimulation()
                step +=1
            
        # print("self.hand_steps:: ",self.hand_steps)
        p.disconnect()
        return self.hand_steps

    def setUpWorld(self,initialSimSteps=100,control_mode="MF"):
        """
        Reset the simulation to the beginning and reload all models.

        Parameters
        ----------
        initialSimSteps : int

        Returns
        -------
        baxterId : int
        endEffectorId : int 
        """
        _timeStep = self.sim_step

        print(" self.sim_step:: ", self.sim_step)
        p.setTimeStep(_timeStep)
        p.resetSimulation()


        # sys.exit()



        sdf_path = resource_filename(__name__,"/model_"+control_mode+".sdf")

        print("sdf_path:: ",sdf_path)
        self._hand = p.loadSDF(sdf_path)
        self.handId = self._hand[0]
        euler_angle = [0,0,3.14]
        quaternion_angle = p.getQuaternionFromEuler(euler_angle)
        self.jointInfo = JointInfo()

        p.resetBasePositionAndOrientation(self.handId, [0, 0, 0],quaternion_angle)
    
        self.jointInfo.get_infoForAll_joints(self._hand)
        self.numJoints = p.getNumJoints(self.handId)
        self.num_Active_joint = self.jointInfo.getNumberOfActiveJoints()
        self.indexOf_activeJoints  = self.jointInfo.getIndexOfActiveJoints()

        # Grab relevant joint IDs
        endEffectorId = 48 # (left gripper left finger)

        # Set gravity
        p.setGravity(0., 0., -9.8)
        

        ##reset joint to lower limit
        for i in range(4):
            p.resetJointState(self.handId,self.indexOf_activeJoints[i],self.joint_limits[control_mode]["low"][i])
        # Let the world run for a bit
        for _ in range(initialSimSteps):
            p.stepSimulation()

        return self._hand,self.handId, endEffectorId


    def getObservation_joint(self,format="list"):
      
      indexOfActiveJoints = self.jointInfo.getIndexOfActiveJoints()
      jointsInfo = self.jointInfo.getActiveJointsInfo()

      jointsStates = []
      joints_state = {} #key:joint ,value = joint state 

      for i in range(len(indexOfActiveJoints)):
        jointName  = jointsInfo[i]["jointName"]
        # print("jointName ::i",jointName,i)
        jointIndex = indexOfActiveJoints[i]
        jointState = p.getJointState(self._hand[0],jointIndex)
        joints_state[jointName] = jointState[0]
        jointsStates.append(jointState[0])

      if format == "dictinary":
        return joints_state
      else:
        return jointsStates

    def setMotors(self,Robot,RobotId, jointPoses):
        """
        Parameters
        ----------
        RobotId : int
        jointPoses : [float] * numDofs
        """
        numJoints = p.getNumJoints(RobotId)

        # print("jointPoses:: ",jointPoses)
        #Getting robot info
        jointInfo = JointInfo()
        jointInfo.get_infoForAll_joints(Robot)
        #getting number of active joints
        active_joints_info  = jointInfo.getActiveJointsInfo()
        num_active_joints = jointInfo.getNumberOfActiveJoints()

        for i in range(num_active_joints):
            ####Assigning appopriate parameters for controllers########
            control_setting = {
              "force":active_joints_info[i]["jointMaxForce"],
              "maxVelocity":active_joints_info[i]["jointMaxVelocity"],
              "positionGain":None,
              "velocityGain":None
    
            }
            for key,value in self.control_setting.items():
              if value !=None:
                control_setting[key] = value
            # print("\n")
            # print("control_setting:: ",control_setting)
            # print("\n")
            p.setJointMotorControl2(bodyIndex=RobotId, jointIndex=active_joints_info[i]["jointIndex"], controlMode=p.POSITION_CONTROL,
                    targetPosition=jointPoses[i],targetVelocity=0,force=control_setting["force"], 
                    maxVelocity=control_setting["maxVelocity"],
                    positionGain=control_setting["positionGain"],
                    velocityGain=int(control_setting["velocityGain"]))

            
            joint_name = active_joints_info[i]["jointName"].decode('utf-8')
            self.test_log[joint_name]= control_setting 
                



    def save_setting(self):    
        
        #dump dic to file
        with io.open(self.config_path, 'w', encoding='utf8') as outfile:
            yaml.dump(self.hand_steps, outfile)


if __name__ == "__main__":
    AAR = AdativeActionRepeat("MF")
    


