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
    def __init__(self,redner=True,sim_step=1./500.,
    control_setting = {
                        "force":None,
                        "maxVelocity":None,
                        "positionGain":None,
                        "velocityGain":None
                      }
    ):

        self.RAR =RecordAdaptiveRepeat(redner,sim_step,control_setting)
        
            

        

        self.action_repeat_dic = self.RAR()

        self._action_limit = {
                "kuka":{

                  "joint":{
                    "high":[2.96706, 2.0944, 2.96706, 2.0944, 2.96706, 2.0944, 3.05433],
                    "low":[-2.96706, -2.0944, -2.96706, -2.0944, -2.96706, -2.0944, -3.05433]
                  },

                },
                "hand":{
                  "joint":{
                    "low":[ 0, 0, 0, -0.349066, 0, 0, 0, -0.349066, 0, 0, 0, -0.349066, -1.0472, 0, -0.698132, 0],
                    "high":[ 1.5708, 1.5708, 1.5708, 0.349066, 1.5708, 1.5708, 1.5708, 0.349066, 1.5708, 1.5708, 1.5708, 0.349066, 1.0472, 1.22173, 0.698132, 1.5708]
                  }

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
            "Robot":{
                "high":self._action_limit["kuka"]["joint"]["high"],
                "low" :self._action_limit["kuka"]["joint"]["low"] 
            }
        }
        self.joint_limit ={
            "high":self.joints["Robot"]["high"],
            "low" :self.joints["Robot"]["low"]  
        }
        #The order command are issued to joints kuka +hand
        self.joint_order = ["J0","J1","J2","J3","J4","J5","J6"]
                          
            

    def get(self,joint_obs,joint_command):
        steps = []
        max_timestep = 0
        a_r_dic = self.action_repeat_dic
        j_limit = self.joint_limit
        j_order = self.joint_order
        # print("\n\n")
        # print("joint_obs::",joint_obs)
        # print("a_r_dic:: ",a_r_dic)
        # print("j_limit:: ",j_limit)
        # print("j_order:: ",j_order)
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
    def __init__(self,render=True,sim_step=1./500.,control_setting={
                        "force":None,
                        "maxVelocity":None,
                        "positionGain":None,
                        "velocityGain":None
                      }):
        self._renders = render
        if self._renders:
          self.guiClient = p.connect(p.GUI)
        else:
          self.guiClient = p.connect(p.DIRECT)

        # self.guiClient = p.connect(p.GUI)
      
        self.sim_step = sim_step


          
        self.fingers = ["FF","MF","RF","TH"]
        self.Robots_joints = ["J0","J1","J2","J3","J4","J5","J6"]

        self.control_setting = control_setting            
            

        self.robot_steps={
            "J0":None,
            "J1":None,
            "J2":None,
            "J3":None,
            "J4":None,
            "J5":None,
            "J6":None,

        }
        self._action_limit = {
                "kuka":{

                  "joint":{
                    "high":[2.96706, 2.0944, 2.96706, 2.0944, 2.96706, 2.0944, 3.05433],
                    "low":[-2.96706, -2.0944, -2.96706, -2.0944, -2.96706, -2.0944, -3.05433]
                  },

                },
                "hand":{
                  "joint":{
                    "low":[ 0, 0, 0, -0.349066, 0, 0, 0, -0.349066, 0, 0, 0, -0.349066, -1.0472, 0, -0.698132, 0],
                    "high":[ 1.5708, 1.5708, 1.5708, 0.349066, 1.5708, 1.5708, 1.5708, 0.349066, 1.5708, 1.5708, 1.5708, 0.349066, 1.0472, 1.22173, 0.698132, 1.5708]
                  }

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
            "Robot":{
                "high":self._action_limit["kuka"]["joint"]["high"],
                "low" :self._action_limit["kuka"]["joint"]["low"] 
            }
        }
        self.joint_limits ={
            "high":self.joints["Robot"]["high"],
            "low" :self.joints["Robot"]["low"]  
        }
        self.step = 0

        #######This is storage for test code ##########
        self.test_log = {}

    
    def __call__(self):
       
        p.resetDebugVisualizerCamera(1, 180, 0., [0., 0.2, 0.3])
       
        Robots_joints   = self.Robots_joints
       
        Robot,RobotId, endEffectorId = None,None,None

       
        for i in range(7):
          
            Robot,RobotId, endEffectorId = self.setUpWorld()
            self.reset_joint_to_lower_limit(i)
            context = self.getObservation_joint()
            command = context
            command[i]= self.joint_limits["high"][i]
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
                  self.robot_steps[Robots_joints[i]] = step
                  break
              else:
                  if step >100000:
                  
                    self.robot_steps[Robots_joints[i]] = False
                    break
        
                
              p.stepSimulation()
              step +=1

        # print("self.robot_steps:: ",self.robot_steps)

        p.disconnect()
        return self.robot_steps


    def setUpWorld(self,initialSimSteps=100):
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
        p.setTimeStep(_timeStep)
        p.resetSimulation()




        sdf_path = resource_filename(__name__,"/model.sdf")

        # print("sdf_path:: ",sdf_path)
        # print("os.getcwd()::",os.getcwd())
        # print("resource_filename(__name__)::",resource_filename(__name__,""))
        self._robot = p.loadSDF(sdf_path)
        self.robotId = self._robot[0]
        euler_angle = [0,0,3.14]
        quaternion_angle = p.getQuaternionFromEuler(euler_angle)
        self.jointInfo = JointInfo()

        p.resetBasePositionAndOrientation(self.robotId, [0, 0, 0],quaternion_angle)
    
        self.jointInfo.get_infoForAll_joints(self._robot)
        self.numJoints = p.getNumJoints(self.robotId)
        self.num_Active_joint = self.jointInfo.getNumberOfActiveJoints()
        self.indexOf_activeJoints  = self.jointInfo.getIndexOfActiveJoints()

        # Grab relevant joint IDs
        endEffectorId = 48 # (left gripper left finger)

        # Set gravity
        p.setGravity(0., 0., -9.8)
        
        # Let the world run for a bit
        for _ in range(initialSimSteps):
            p.stepSimulation()

        return self._robot,self.robotId, endEffectorId

    def reset_joint_to_lower_limit(self,joint_index):      
        p.resetJointState(self.robotId,self.indexOf_activeJoints[joint_index],self.joint_limits["low"][joint_index])
    def getObservation_joint(self,format="list"):
      
      indexOfActiveJoints = self.jointInfo.getIndexOfActiveJoints()
      jointsInfo = self.jointInfo.getActiveJointsInfo()

      jointsStates = []
      joints_state = {} #key:joint ,value = joint state 

      for i in range(len(indexOfActiveJoints)):
        jointName  = jointsInfo[i]["jointName"]
        # print("jointName ::i",jointName,i)
        jointIndex = indexOfActiveJoints[i]
        jointState = p.getJointState(self._robot[0],jointIndex)
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
              "positionGain":1,
              "velocityGain":1
    
            }
            
            for key,value in self.control_setting.items():
              if value !=None:
                control_setting[key] = value

            p.setJointMotorControl2(bodyIndex=RobotId, jointIndex=active_joints_info[i]["jointIndex"], controlMode=p.POSITION_CONTROL,
                    targetPosition=jointPoses[i],targetVelocity=0,force=control_setting["force"], 
                    maxVelocity=control_setting["maxVelocity"],
                    positionGain=control_setting["positionGain"],
                    velocityGain=control_setting["velocityGain"])

            joint_name = active_joints_info[i]["jointName"].decode('utf-8')
            self.test_log[joint_name]= control_setting 
    


if __name__ == "__main__":
    AAR = AdativeActionRepeat()
    


