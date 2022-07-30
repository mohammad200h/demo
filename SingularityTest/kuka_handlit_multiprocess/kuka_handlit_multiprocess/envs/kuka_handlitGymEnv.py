import os, inspect
import subprocess
currentdir = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe())))
print ("current_dir=" + currentdir)
os.sys.path.insert(0,currentdir)
import sys
#workaround to make ros work with python3 
try:
  sys.path.remove('/opt/ros/kinetic/lib/python2.7/dist-packages')
except:
  print("sys.path.remove('/opt/ros/kinetic/lib/python2.7/dist-packages') continuing without it")


sys.path.append('/opt/ros/kinetic/lib/python2.7/dist-packages')
from pkg_resources import resource_string,resource_filename
import time
import random
import math
import gym
from gym import spaces
from gym.utils import seeding
import numpy as np

import pybullet as p
from kuka_handlit_controller import Kuka_Handlit
import pybullet_data
from pkg_resources import parse_version

from Grasp_phase import GraspPhase
from adaptiveActionRepeat.robotAdaptiveActionRepeat import RobotAdaptiveActionRepeat

from AW import AdaptiveWorkspace
import math

import warnings 





RENDER_HEIGHT = 720
RENDER_WIDTH = 960



class RewardChoiseNotSetCorrectly(Exception):
  def __init__(self,msg):
    self.msg = "\n\n"+msg+"\n\n"
    super().__init__(self.msg)   

class WrongRewardObs(Exception):
  def __init__(self,msg):
    self.msg = "\n\n"+msg+"\n\n"
    super().__init__(self.msg)  


class Observation():
  def __init__(self,controller,cubeId,mode):
    self._controller = controller
    self.cubeId = cubeId
    self.obs_mode = mode
    self.observation_space = None
    self._observation_frames = ["kuka_world","kuka_world_xyz","kuka","kuka_xyz",
                                "palm_world","palm_world_xyz","palm","palm_xyz",
                                "kuka_pos_orn","palm_pos_orn","palm_pose_orn_fingers_pos_orn_joint_values",
                                "palm_pose_orn_joint_values",
                                "kuka_joint_hand_joint",
                                "palm_pos_orn_and_hand_joints"]

          
  def get(self):

    observation = None
    if self.obs_mode == self._observation_frames[0]:
      #kuka_world
      observation = self.obs_distAndOrn_relativeToKukaAndFingers(worldFrame=True)
    if self.obs_mode == self._observation_frames[1]:
      #kuka_world_xyz
      observation = self.obs_distAndOrn_relativeToKukaAndFingers_xyz(worldFrame=True)
    if self.obs_mode == self._observation_frames[2]:
      #kuka
      observation = self.obs_distAndOrn_relativeToKukaAndFingers(worldFrame=False)
    if self.obs_mode == self._observation_frames[3]:
      #kuka_xyz
      observation = self.obs_distAndOrn_relativeToKukaAndFingers_xyz(worldFrame=False)
    if self.obs_mode == self._observation_frames[4]:
      #palm_world
      observation = self.obs_distAndOrn_relativeToPalmAndFingers(worldFrame=True)
    if self.obs_mode == self._observation_frames[5]:
      #palm_world_xyz
      observation = self.obs_distAndOrn_relativeToPalmAndFingers_xyz(worldFrame=True)
    if self.obs_mode == self._observation_frames[6]:
      #palm
      observation = self.obs_distAndOrn_relativeToPalmAndFingers(worldFrame=False)
    if self.obs_mode == self._observation_frames[7]:
      #palm_xyz
      observation = self.obs_distAndOrn_relativeToPalmAndFingers_xyz(worldFrame=False)
    if self.obs_mode == self._observation_frames[8]:
      #kuka_pos_orn
      observation = self.obs_pos_and_orn_relative_to_world_kuka()
    if self.obs_mode == self._observation_frames[9]:
      #palm_pos_orn
      observation = self.obs_pos_and_orn_relative_to_world_palm()
    if self.obs_mode == self._observation_frames[10]:
      #palm_pose_orn_fingers_pos_orn_joint_values
      observation = self.obs_pos_and_orn_relative_to_world_and_joint_states()
    if self.obs_mode == self._observation_frames[11]:
      #palm_pose_orn_joint_values
      observation = self.cube_palm_pos_orn_and_joint_values()
    if self.obs_mode == self._observation_frames[12]:
      #kuka_joint_hand_joint
      observation = self.obs_kuka_joint_hand_joint()
    if self.obs_mode == self._observation_frames[13]:
      #palm_pos_orn_and_hand_joints
      observation = self.obs_palm_xyz_rpy_and_hand_joints()
    return observation
  
  def pure_obs(self):
    """
    this class presents pure form of observation as simulation sees it
    finger_pose
    finger joint values
    palm pose_orn
    kuka_joint values
    "cube joint values

    returns a dictionary containing these values
    """
    
    #The first
    state = self._controller.getPureObservation()

    cube_state= p.getBasePositionAndOrientation(self.cubeId)
    cube_pos = cube_state[0]
    cube_orn = cube_state[1]
    cube_orn = p.getEulerFromQuaternion(cube_orn)
    
    state["cube"] = list(cube_pos)+list(cube_orn)

    # print("pure state::",state)
    
    return state

  def obs_palm_xyz_rpy_and_hand_joints(self):
    """
    palm_pos_orn_and_hand_joints:
    
    palm_xyz_rpy
    hand_joints
    cube_pos_orn
    """

    state = self._controller.getPureObservation()

    cube_state= p.getBasePositionAndOrientation(self.cubeId)
    cube_pos = cube_state[0]
    cube_orn = cube_state[1]
    cube_orn = p.getEulerFromQuaternion(cube_orn)
    
    state["cube"] = list(cube_pos)+list(cube_orn)
    
    hand_list = state["hand"]["joint_values"]["FF"]+state["hand"]["joint_values"]["MF"]+state["hand"]["joint_values"]["RF"]+\
                state["hand"]["joint_values"]["TH"]

    state_list = state["hand"]["xyz_rpy"]["palm"]+hand_list+state["cube"]
    
    """
    print("state_list::len::",len(state_list))
    print("\nstate[cube]::",state["cube"])

    print("\nstate[hand][xyz_rpy][palm]::",state["hand"]["xyz_rpy"]["palm"])

    print("\nstate[hand][joint_values][FF]::",state["hand"]["joint_values"]["FF"])
    print("\nstate[hand][joint_values][MF]::",state["hand"]["joint_values"]["MF"])
    print("\nstate[hand][joint_values][RF]::",state["hand"]["joint_values"]["RF"])
    print("\nstate[hand][joint_values][TH]::",state["hand"]["joint_values"]["TH"])
    """

    return state_list
  
  def obs_kuka_joint_hand_joint(self):
    """
    kuka_joint_hand_joint:

    kuka_joints
    hand_joints
    cube_pos_orn
    """

    state = self._controller.getPureObservation()

    cube_state= p.getBasePositionAndOrientation(self.cubeId)
    cube_pos = cube_state[0]
    cube_orn = cube_state[1]
    cube_orn = p.getEulerFromQuaternion(cube_orn)
    
    state["cube"] = list(cube_pos)+list(cube_orn)

    hand_list = state["hand"]["joint_values"]["FF"]+state["hand"]["joint_values"]["MF"]+state["hand"]["joint_values"]["RF"]+\
                state["hand"]["joint_values"]["TH"]
    state_list =state["kuka"]["joint_values"]+hand_list+state["cube"]
    """
    print("state_list::len::",len(state_list))

    print("\nstate[cube]::",state["cube"])

    print("\nstate[kuka][joint_values]::",state["kuka"]["joint_values"])
    
    print("\nstate[hand][joint_values][FF]::",state["hand"]["joint_values"]["FF"])
    print("\nstate[hand][joint_values][MF]::",state["hand"]["joint_values"]["MF"])
    print("\nstate[hand][joint_values][RF]::",state["hand"]["joint_values"]["RF"])
    print("\nstate[hand][joint_values][TH]::",state["hand"]["joint_values"]["TH"])
    """
    return state_list
  
  def obs_pos_and_orn_relative_to_world_and_joint_states(self):
    """
    palm_pos_orn_fingers_pos_orn_joint_values:
    FF_pos_orn
    MF_pos_orn
    RF_pos_orn
    TH_pos_orn
    palm_pos_orn
    Block_pos_orn
    FF_joints
    MF_joints
    RF_joints
    TH_joints
    kuka_joints
    
    return [palm_pos_orn,Block_pos_orn,FF_pos_orn,MF_pos_orn,RF_pos_orn,TH_pos_orn, 
    FF_joints,MF_joints,RF_joints,TH_joints,kuka_joints]
    every angle is in euler
    """
    state = self._controller.getPureObservation()

    cube_state= p.getBasePositionAndOrientation(self.cubeId)
    cube_pos = cube_state[0]
    cube_orn = cube_state[1]
    cube_orn = p.getEulerFromQuaternion(cube_orn)
    
    state["cube"] = list(cube_pos)+list(cube_orn)

  
    state_list = state["hand"]["xyz_rpy"]["palm"]+state["cube"]+state["hand"]["xyz_rpy"]["FF"]+\
                 state["hand"]["xyz_rpy"]["MF"]+state["hand"]["xyz_rpy"]["RF"]+state["hand"]["xyz_rpy"]["TH"]+\
                 state["hand"]["joint_values"]["FF"]+state["hand"]["joint_values"]["MF"]+state["hand"]["joint_values"]["RF"]+\
                 state["hand"]["joint_values"]["TH"]+state["kuka"]["joint_values"]
    
    return state_list                 

  def cube_palm_pos_orn_and_joint_values(self):
    """
    palm_pos_orn_joint_values:
    palm_pos_orn
    Block_pos_orn
    FF_joints
    MF_joints
    RF_joints
    TH_joints
    kuka_joints
    
    return [palm_pos_orn,Block_pos_orn,FF_pos_orn,MF_pos_orn,RF_pos_orn,TH_pos_orn, 
    FF_joints,MF_joints,RF_joints,TH_joints,kuka_joints]
    every angle is in euler
    """
    state = self._controller.getPureObservation()

    cube_state= p.getBasePositionAndOrientation(self.cubeId)
    # print("cube_state::",cube_state)
    cube_pos = cube_state[0]
    cube_orn = cube_state[1]
    cube_orn = p.getEulerFromQuaternion(cube_orn)
  
    state["cube"] = list(cube_pos)+list(cube_orn)

    state_list = state["hand"]["xyz_rpy"]["palm"]+state["cube"]+\
                 state["hand"]["joint_values"]["FF"]+state["hand"]["joint_values"]["MF"]+state["hand"]["joint_values"]["RF"]+\
                 state["hand"]["joint_values"]["TH"]+state["kuka"]["joint_values"]
    

    """
    print("state_list::len::",len(state_list))
    print("\nstate[hand][xyz_rpy][palm]::",state["hand"]["xyz_rpy"]["palm"])
    
    print("\nstate[cube]::",state["cube"])
    
    print("\nstate[hand][joint_values][FF]::",state["hand"]["joint_values"]["FF"])
    print("\nstate[hand][joint_values][MF]::",state["hand"]["joint_values"]["MF"])
    print("\nstate[hand][joint_values][RF]::",state["hand"]["joint_values"]["RF"])

    print("\nstate[hand][joint_values][TH]::",state["hand"]["joint_values"]["TH"])
    print("\nstate[kuka][joint_values]::",state["kuka"]["joint_values"])
    """

    return state_list
  
  def obs_pos_and_orn_relative_to_world_kuka(self):
      """
      FF_pos
      MF_pos
      RF_pos
      TH_pos
      kuka_pos
      kuka_orn
      Block_pos
      Block_orn
      return [kuka_pos,kuka_orn,Block_pos,Block_orn,FF_pos,MF_pos,RF_pos,TH_pos]
      every angle is in euler
      """
      robot_state = self._controller.getObservation(UseEuler=True)

      #block state
      blockPos,blockOrn = p.getBasePositionAndOrientation(self.cubeId)
      blockPos,blockOrn = list(blockPos),list(blockOrn)
      blockOrn =list(p.getEulerFromQuaternion(blockOrn))
      fingers_xyz_worldFrame =[]
    

      kuka_EE_State  = robot_state[:6]#xyz and euler 
      kuka_EE_Pos = kuka_EE_State[:3]
      kuka_EE_Orn = kuka_EE_State[3:]


      state_counter = 1
      for linkName in self._controller.get_fingerTips_linkIndex():
        state_counter +=1
        fingerState = robot_state[6*(state_counter-1):6*state_counter]#xyz and euler 
        finger_EE_pos = fingerState[:3]
        finger_EE_orn = fingerState[3:]

        fingers_xyz_worldFrame+=finger_EE_pos
     

      # print("type(kuka_EE_Pos):: ",type(kuka_EE_Pos))
      # print("type(kuka_EE_Orn):: ",type(kuka_EE_Orn))
      # print("type(blockPos):: ",type(blockPos))
      # print("type(blockOrn):: ",type(blockOrn))
      # print("type(fingers_xyz_worldFrame):: ",type(fingers_xyz_worldFrame))
      obs_worldFrame = kuka_EE_Pos+kuka_EE_Orn+blockPos+blockOrn+fingers_xyz_worldFrame


      return obs_worldFrame

  def obs_pos_and_orn_relative_to_world_palm(self):
      """
      palm_pos_orn:

      FF_pos dim:3 
      MF_pos dim:3
      RF_pos dim:3
      TH_pos dim:3
      palm_pos dim:3
      palm_orn dim:3
      Block_pos dim:3
      Block_orn dim:3
      return [palm_pos,palm_orn,Block_pos,Block_orn,FF_pos,MF_pos,RF_pos,TH_pos]
      every angle is in euler
      """
      robot_state = self._controller.getObservation(UseEuler=True)
      #block state
      blockPos,blockOrn = p.getBasePositionAndOrientation(self.cubeId)
      blockPos,blockOrn = list(blockPos),list(blockOrn)
      blockOrn =list(p.getEulerFromQuaternion(blockOrn))
      fingers_xyz_worldFrame =[]
    

      palm_EE_State  = self._controller.getObservation_palm()
      palm_EE_Pos = list(palm_EE_State[:3])
      palm_EE_Orn = list(palm_EE_State[3:])
      palm_EE_Orn =list(p.getEulerFromQuaternion(palm_EE_Orn))

      state_counter = 1
      for linkName in self._controller.get_fingerTips_linkIndex():
        state_counter +=1
        fingerState = robot_state[6*(state_counter-1):6*state_counter]#xyz and euler 
        finger_EE_pos = fingerState[:3]
        finger_EE_orn = fingerState[3:]

        fingers_xyz_worldFrame+=finger_EE_pos
     

      # print("type(palm_EE_Pos):: ",type(palm_EE_Pos))
      # print("type(palm_EE_Orn):: ",type(palm_EE_Orn))
      # print("type(blockPos):: ",type(blockPos))
      # print("type(blockOrn):: ",type(blockOrn))
      # print("type(fingers_xyz_worldFrame):: ",type(fingers_xyz_worldFrame))
      obs_worldFrame = palm_EE_Pos+palm_EE_Orn+blockPos+blockOrn+fingers_xyz_worldFrame


      return obs_worldFrame
     
  def obs_distAndOrn_relativeToKukaAndFingers(self,worldFrame=True):  
      """
      if worldFrame=True
        kuka_world
        all the outputs are relative to world frame
        outout:[kuka_ee_dsit,
                FF_dist,
                MF_dist,
                RF_dist,
                TH_dist,
                block_orn,
                kuka_ee_orn
                ]
      else:
        kuka
        outout:[blockPosInKukaFrame,
                FF_dist_FFFrame,
                MF_dist_MFFrame,
                RF_dist_RFFrame,
                TH_dist_THFrame,
                block_orn_kuka_eeFrame,
                ]
      """
      robot_state = self._controller.getObservation()
      # print("robot_state:: ",robot_state)
      # sys.exit()
      #block state
      blockPos,blockOrn = p.getBasePositionAndOrientation(self.cubeId)

      fingers_dist_worldFrame =[]
      fingers_dist_fingerFrame =[]

      kuka_EE_State  = robot_state[:7]#xyz and quatrenium 
      kuka_EE_Pos = kuka_EE_State[:3]
      kuka_EE_Orn = kuka_EE_State[3:]

      #Distance of kuka_ee to obj in world frame
      kuka_dist_x = blockPos[0] - kuka_EE_Pos[0]
      kuka_dist_y = blockPos[1] - kuka_EE_Pos[1]
      kuka_dist_z = blockPos[2] - kuka_EE_Pos[2]

      # size of vector for kuka_ee to obj in world frame
      kuka_dist_worldFrame = math.sqrt(kuka_dist_x**2+ kuka_dist_y**2+ kuka_dist_z**2)

      invKuka_eePos,invKuka_eeOrn = p.invertTransform(kuka_EE_Pos,kuka_EE_Orn)
      blockPosInkuka_EE,blockOrnInkuka_EE = p.multiplyTransforms(invKuka_eePos,invKuka_eeOrn,blockPos,blockOrn)
      # size of vector for kuka_ee to obj in world frame
      blockPosInKukaFrame = math.sqrt(blockPosInkuka_EE[0]**2+ blockPosInkuka_EE[1]**2+blockPosInkuka_EE[2]**2)

      state_counter = 1
      for linkName in self._controller.get_fingerTips_linkIndex():
        state_counter +=1
        fingerState = robot_state[7*(state_counter-1):7*state_counter]#xyz and quatrenium 
        finger_EE_pos = fingerState[:3]
        finger_EE_orn = fingerState[3:]

        #Distance of finger_ee to obj in world frame
        finger_dist_x = blockPos[0] - finger_EE_pos[0]
        finger_dist_y = blockPos[1] - finger_EE_pos[1]
        finger_dist_z = blockPos[2] - finger_EE_pos[2]

        # size of vector for finger_ee to obj in world frame
        finger_dist_worldFrame = math.sqrt(finger_dist_x**2+ finger_dist_y**2+ finger_dist_z**2)

        invfingertipPos, invfingertipOrn = p.invertTransform(finger_EE_pos,finger_EE_orn)
        blockPosInfingertip_EE, blockOrnInfingertip_EE = p.multiplyTransforms(invfingertipPos,invfingertipOrn,blockPos,blockOrn)

        # size of vector for finger_ee to obj in world frame
        finger_dist_fingerFrame = math.sqrt(blockPosInfingertip_EE[0]**2+ blockPosInfingertip_EE[1]**2+blockPosInfingertip_EE[2]**2)

        fingers_dist_worldFrame.append(finger_dist_worldFrame)
        fingers_dist_fingerFrame.append(finger_dist_fingerFrame)

      robot_dist_worldFrame = [kuka_dist_worldFrame]+fingers_dist_worldFrame
      robot_dist_EEsFrame   = [blockPosInKukaFrame ]+fingers_dist_fingerFrame

      #kuka_ee orn
      kuka_EE_Orn = p.getEulerFromQuaternion(kuka_EE_Orn)
 
      
      #dists cube orn and palm orn 
      block_orn = p.getEulerFromQuaternion(blockOrn)
      obs_worldFrame = robot_dist_worldFrame+list(block_orn)+list(kuka_EE_Orn)

      obs_kukaFrame = robot_dist_EEsFrame + list(p.getEulerFromQuaternion(blockOrnInkuka_EE))
      if worldFrame ==True:
        return obs_worldFrame
      else:
        return obs_kukaFrame  

  def obs_distAndOrn_relativeToKukaAndFingers_xyz(self,worldFrame=True):  
      """
      if worldFrame=True
        all the outputs are relative to world frame
        the angle is euler
        outout:[kuka_ee_dsit_x,
                kuka_ee_dsit_y,
                kuka_ee_dsit_z,
                FF_dist_x,
                FF_dist_y,
                FF_dist_z,
                MF_dist_x,
                MF_dist_y,
                MF_dist_z,
                RF_dist_x,
                RF_dist_y,
                RF_dist_z,
                TH_dist_x,
                TH_dist_y,
                TH_dist_z,
                block_orn,
                kuka_ee_orn
                ]
      else:
        the angle is euler
        outout:[kuka_ee_dsit_x_kuka_eeFrame,
                kuka_ee_dsit_y_kuka_eeFrame,
                kuka_ee_dsit_z_kuka_eeFrame,
                FF_dist_x_FFFrame,
                FF_dist_y_FFFrame,
                FF_dist_z_FFFrame,
                MF_dist_x_MFFrame,
                MF_dist_y_MFFrame,
                MF_dist_z_MFFrame,
                RF_dist_x_RFFrame,
                RF_dist_y_RFFrame,
                RF_dist_z_RFFrame,
                TH_dist_x_THFrame,
                TH_dist_y_THFrame,
                TH_dist_z_THFrame,
                block_orn_kuka_eeFrame
                ]
      """
      robot_state = self._controller.getObservation()
      #block state
      blockPos,blockOrn = p.getBasePositionAndOrientation(self.cubeId)

      fingers_dist_worldFrame =[]
      fingers_dist_fingerFrame =[]

      kuka_EE_State  = robot_state[:7]#xyz and quatrenium 
      kuka_EE_Pos = kuka_EE_State[:3]
      kuka_EE_Orn = kuka_EE_State[3:]

      #Distance of kuka_ee to obj in world frame
      kuka_dist_x = blockPos[0] - kuka_EE_Pos[0]
      kuka_dist_y = blockPos[1] - kuka_EE_Pos[1]
      kuka_dist_z = blockPos[2] - kuka_EE_Pos[2]

      # size of vector for kuka_ee to obj in world frame
      kuka_dist_worldFrame = [kuka_dist_x, kuka_dist_y, kuka_dist_z]
      kuka_dist_worldFrame = [abs(i) for i in kuka_dist_worldFrame]

      invKuka_eePos,invKuka_eeOrn = p.invertTransform(kuka_EE_Pos,kuka_EE_Orn)
      blockPosInkuka_EE,blockOrnInkuka_EE = p.multiplyTransforms(invKuka_eePos,invKuka_eeOrn,blockPos,blockOrn)
      # size of vector for kuka_ee to obj in kuka frame
      kuka_dist_kukaFrame = [blockPosInkuka_EE[0],blockPosInkuka_EE[1],blockPosInkuka_EE[2]]
      kuka_dist_kukaFrame = [abs(i) for i in kuka_dist_kukaFrame]

      state_counter = 1
      for linkName in self._controller.get_fingerTips_linkIndex():
        state_counter +=1
        fingerState = robot_state[7*(state_counter-1):7*state_counter]#xyz and quatrenium 
        finger_EE_pos = fingerState[:3]
        finger_EE_orn = fingerState[3:]

        #Distance of finger_ee to obj in world frame
        finger_dist_x = blockPos[0] - finger_EE_pos[0]
        finger_dist_y = blockPos[1] - finger_EE_pos[1]
        finger_dist_z = blockPos[2] - finger_EE_pos[2]

        # size of vector for finger_ee to obj in world frame
        finger_dist_worldFrame = [finger_dist_x, finger_dist_y, finger_dist_z]
        finger_dist_worldFrame = [abs(i) for i in finger_dist_worldFrame]

        invfingertipPos, invfingertipOrn = p.invertTransform(finger_EE_pos,finger_EE_orn)
        blockPosInfingertip_EE, blockOrnInfingertip_EE = p.multiplyTransforms(invfingertipPos,invfingertipOrn,blockPos,blockOrn)

        # size of vector for finger_ee to obj in world frame
        finger_dist_fingerFrame = [blockPosInfingertip_EE[0], blockPosInfingertip_EE[1],blockPosInfingertip_EE[2]]
        finger_dist_fingerFrame = [abs(i) for i in finger_dist_fingerFrame]

        fingers_dist_worldFrame.extend(finger_dist_worldFrame)
        fingers_dist_fingerFrame.extend(finger_dist_fingerFrame)

      robot_dist_worldFrame =kuka_dist_worldFrame+fingers_dist_worldFrame
      robot_dist_EEsFrame =kuka_dist_kukaFrame+fingers_dist_fingerFrame

      #kuka_ee orn
      kuka_EE_Orn = list(p.getEulerFromQuaternion(kuka_EE_Orn))
 
      
      #dists cube orn and palm orn 
      blockOrn = list(p.getEulerFromQuaternion(blockOrn))
      # print("\n\n")
      # print("type(robot_dist_worldFrame):: ",type(robot_dist_worldFrame))
      # print("type(blockOrn):: ",type(blockOrn))
      # print("type(kuka_EE_Orn):: ",type(kuka_EE_Orn))
      # print("\n\n")
      obs_worldFrame = robot_dist_worldFrame+blockOrn+kuka_EE_Orn
   
      blockOrnInkuka_EE = list(p.getEulerFromQuaternion(blockOrnInkuka_EE))
      # print("\n\n")
      # print("type(blockOrnInkuka_EE):: ",type(blockOrnInkuka_EE))
      # print("type(robot_dist_EEsFrame):: ",type(robot_dist_EEsFrame))
      # print("\n\n")
      obs_kukaAndFingerFrame = robot_dist_EEsFrame + blockOrnInkuka_EE

      if worldFrame ==True:
        return obs_worldFrame
      else:
        return obs_kukaAndFingerFrame  

  def obs_distAndOrn_relativeToPalmAndFingers(self,worldFrame=True):  
      """
      palm_world
      if worldFrame=True
        all the outputs are relative to world frame
        outout:[palm_dsit,
                FF_dist,
                MF_dist,
                RF_dist,
                TH_dist,
                block_orn,
                palm_orn
                ]
      else:
        palm
        outout:[palm_dsit_palmFrame,
                FF_dist_FFFrame,
                MF_dist_MFFrame,
                RF_dist_RFFrame,
                TH_dist_THFrame,
                block_orn_palmFrame,
                ]
      """

      robot_state = self._controller.getObservation()
      #block state
      blockPos,blockOrn = p.getBasePositionAndOrientation(self.cubeId)

      fingers_dist_worldFrame =[]
      fingers_dist_fingerFrame =[]

      palm_EE_State  = self._controller.getObservation_palm()#xyz and quatrenium 
      palm_EE_Pos = palm_EE_State[:3]
      palm_EE_Orn = palm_EE_State[3:]

      #Distance of palm_ee to obj in world frame
      palm_dist_x = blockPos[0] - palm_EE_Pos[0]
      palm_dist_y = blockPos[1] - palm_EE_Pos[1]
      palm_dist_z = blockPos[2] - palm_EE_Pos[2]

      # size of vector for palm_ee to obj in world frame
      palm_dist_worldFrame = math.sqrt(palm_dist_x**2+ palm_dist_y**2+ palm_dist_z**2)

      invpalm_eePos,invpalm_eeOrn = p.invertTransform(palm_EE_Pos,palm_EE_Orn)
      blockPosInpalm_EE,blockOrnInpalm_EE = p.multiplyTransforms(invpalm_eePos,invpalm_eeOrn,blockPos,blockOrn)
      # size of vector for palm_ee to obj in world frame
      palm_dist_palmFrame = math.sqrt(blockPosInpalm_EE[0]**2+ blockPosInpalm_EE[1]**2+blockPosInpalm_EE[2]**2)

      state_counter = 1
      for linkName in self._controller.get_fingerTips_linkIndex():
        state_counter +=1
        fingerState = robot_state[7*(state_counter-1):7*state_counter]#xyz and quatrenium 
       
        finger_EE_pos = fingerState[:3]
        finger_EE_orn = fingerState[3:]
   
        #Distance of finger_ee to obj in world frame
        finger_dist_x = blockPos[0] - finger_EE_pos[0]
        finger_dist_y = blockPos[1] - finger_EE_pos[1]
        finger_dist_z = blockPos[2] - finger_EE_pos[2]

        # size of vector for finger_ee to obj in world frame
        finger_dist_worldFrame = math.sqrt(finger_dist_x**2+ finger_dist_y**2+ finger_dist_z**2)

        invfingertipPos, invfingertipOrn = p.invertTransform(finger_EE_pos,finger_EE_orn)
        blockPosInfingertip_EE, blockOrnInfingertip_EE = p.multiplyTransforms(invfingertipPos,invfingertipOrn,blockPos,blockOrn)

        # size of vector for finger_ee to obj in world frame
        finger_dist_fingerFrame = math.sqrt(blockPosInfingertip_EE[0]**2+ blockPosInfingertip_EE[1]**2+blockPosInfingertip_EE[2]**2)

        fingers_dist_worldFrame.append(finger_dist_worldFrame)
        fingers_dist_fingerFrame.append(finger_dist_fingerFrame)

      robot_dist_worldFrame =[palm_dist_worldFrame]+fingers_dist_worldFrame
      robot_dist_EEsFrame =[palm_dist_palmFrame]+fingers_dist_fingerFrame

      #palm orn
     
      palm_EE_Orn = p.getEulerFromQuaternion(palm_EE_Orn)
      
      #dists cube orn and palm orn 
      blockOrn = p.getEulerFromQuaternion(blockOrn)
      obs_worldFrame = robot_dist_worldFrame+list(blockOrn)+list(palm_EE_Orn)
  
      
      blockOrnInpalm_EE = p.getEulerFromQuaternion(blockOrnInpalm_EE)
      obs_palmFrame = robot_dist_EEsFrame + list(blockOrnInpalm_EE)
      if worldFrame ==True:
        return obs_worldFrame
      else:
        return obs_palmFrame
    
  def obs_distAndOrn_relativeToPalmAndFingers_xyz(self,worldFrame=True):  
      """
      if worldFrame=True
        palm_world_xyz
        all the outputs are relative to world frame
        outout:[palm_dsit_x,
                palm_dsit_y,
                palm_dsit_z,
                FF_dist_x,
                FF_dist_y,
                FF_dist_z,
                MF_dist_x,
                MF_dist_y,
                MF_dist_z,
                RF_dist_x,
                RF_dist_y,
                RF_dist_z,
                TH_dist_x,
                TH_dist_y,
                TH_dist_z,
                block_orn,
                palm_orn
                ]
      else:
        palm_xyz
        outout:[palm_dsit_x_palmFrame,
                palm_dsit_y_palmFrame,
                palm_dsit_z_palmFrame,
                FF_dist_x_FFFrame,
                FF_dist_y_FFFrame,
                FF_dist_z_FFFrame,
                MF_dist_x_MFFrame,
                MF_dist_y_MFFrame,
                MF_dist_z_MFFrame,
                RF_dist_x_RFFrame,
                RF_dist_y_RFFrame,
                RF_dist_z_RFFrame,
                TH_dist_x_THFrame,
                TH_dist_y_THFrame,
                TH_dist_z_THFrame,
                block_orn_palmFrame
                ]
      """
      robot_state = self._controller.getObservation()
      #block state
      blockPos,blockOrn = p.getBasePositionAndOrientation(self.cubeId)

      fingers_dist_worldFrame =[]
      fingers_dist_fingerFrame =[]

      palm_EE_State  = self._controller.getObservation_palm()#xyz and quatrenium 
      palm_EE_Pos = palm_EE_State[:3]
      palm_EE_Orn = palm_EE_State[3:]

      #Distance of palm_ee to obj in world frame
      palm_dist_x = blockPos[0] - palm_EE_Pos[0]
      palm_dist_y = blockPos[1] - palm_EE_Pos[1]
      palm_dist_z = blockPos[2] - palm_EE_Pos[2]

      # size of vector for palm_ee to obj in world frame
      palm_dist_worldFrame = [palm_dist_x,palm_dist_y,palm_dist_z]
      palm_dist_worldFrame = [abs(i) for i in palm_dist_worldFrame]

      invpalm_eePos,invpalm_eeOrn = p.invertTransform(palm_EE_Pos,palm_EE_Orn)
      blockPosInpalm_EE,blockOrnInpalm_EE = p.multiplyTransforms(invpalm_eePos,invpalm_eeOrn,blockPos,blockOrn)
      # size of vector for palm_ee to obj in world frame
      palm_dist_palmFrame = [blockPosInpalm_EE[0],blockPosInpalm_EE[1],blockPosInpalm_EE[2]]
      palm_dist_palmFrame = [abs(i) for i in palm_dist_palmFrame]

      state_counter = 1
      for linkName in self._controller.get_fingerTips_linkIndex():
        state_counter +=1
        fingerState = robot_state[7*(state_counter-1):7*state_counter]#xyz and quatrenium 
       
        finger_EE_pos = fingerState[:3]
        finger_EE_orn = fingerState[3:]
   
        #Distance of finger_ee to obj in world frame
        finger_dist_x = blockPos[0] - finger_EE_pos[0]
        finger_dist_y = blockPos[1] - finger_EE_pos[1]
        finger_dist_z = blockPos[2] - finger_EE_pos[2]

        # size of vector for finger_ee to obj in world frame
        finger_dist_worldFrame = [finger_dist_x, finger_dist_y, finger_dist_z]
        finger_dist_worldFrame = [abs(i) for i in finger_dist_worldFrame]

        invfingertipPos, invfingertipOrn = p.invertTransform(finger_EE_pos,finger_EE_orn)
        blockPosInfingertip_EE, blockOrnInfingertip_EE = p.multiplyTransforms(invfingertipPos,invfingertipOrn,blockPos,blockOrn)

        # size of vector for finger_ee to obj in world frame
        finger_dist_fingerFrame = [blockPosInfingertip_EE[0],blockPosInfingertip_EE[1],blockPosInfingertip_EE[2]]
        finger_dist_fingerFrame = [abs(i) for i in finger_dist_fingerFrame]

        fingers_dist_worldFrame.extend(finger_dist_worldFrame)
        fingers_dist_fingerFrame.extend(finger_dist_fingerFrame)

      robot_dist_worldFrame =palm_dist_worldFrame+fingers_dist_worldFrame
      robot_dist_EEsFrame =palm_dist_palmFrame+fingers_dist_fingerFrame
      # print("palm_dist_worldFrame::",palm_dist_worldFrame)
      # print("fingers_dist_worldFrame::",fingers_dist_worldFrame)

      #palm orn
     
      palm_EE_Orn = p.getEulerFromQuaternion(palm_EE_Orn)
      
      #dists cube orn and palm orn 
      blockOrn = p.getEulerFromQuaternion(blockOrn)
      obs_worldFrame = robot_dist_worldFrame+list(blockOrn)+list(palm_EE_Orn)
      # print("robot_dist_worldFrame::",robot_dist_worldFrame)
      # print("list(blockOrn)::",list(blockOrn))
      # print("list(palm_EE_Orn)::",list(palm_EE_Orn))
      
      blockOrnInpalm_EE = p.getEulerFromQuaternion(blockOrnInpalm_EE)
      obs_palmFrame = robot_dist_EEsFrame + list(blockOrnInpalm_EE)
      if worldFrame ==True:
        return obs_worldFrame
      else:
        return obs_palmFrame

  def set_obs_mode(self,obs_mode):
      def reset_observation_space(size_of_obs):
        self.observation_high = np.array(size_of_obs*[5],dtype=np.float32)
        self.observation_low  = np.array(size_of_obs*[-5],dtype=np.float32)
        self.observation_space = spaces.Box(self.observation_low, self.observation_high)
        # self.observation_space.shape = (size_of_obs,)

      self.obs_mode = obs_mode
      if obs_mode in ["kuka_world","palm_world"]:
        #11
        reset_observation_space(11)
        # print("_set_obs_mode:: ",obs_mode)
        # print("self.observation_space.shape:: ",self.observation_space.shape)
        # sys.exit()
      elif obs_mode in ["kuka_world_xyz","palm_world_xyz"]:
        #21
        reset_observation_space(21)
      elif obs_mode in ["kuka","palm"]:
        #8
        reset_observation_space(8)
      elif obs_mode in ["kuka_xyz","palm_xyz"]:
        #18
        reset_observation_space(18)
      elif obs_mode in ["kuka_pos_orn","palm_pos_orn"]:
        #12
        reset_observation_space(24)
      elif obs_mode in ["palm_pose_orn_fingers_pos_orn_joint_values"]:
        #59
        finger_pos_orn_dim         = 6*4
        cube_and_palm_pos_orn_dim = 6*2
        finger_joints_dim          = 4*4
        kuka_joints_dim            = 7
        obs_dim = finger_pos_orn_dim+cube_and_palm_pos_orn_dim+finger_joints_dim+kuka_joints_dim
        reset_observation_space(obs_dim)
      elif obs_mode in ["palm_pose_orn_joint_values"]:
        #35
        cube_and_palm_pos_orn_dim = 6*2
        finger_joints_dim          = 4*4
        kuka_joints_dim            = 7
        obs_dim = cube_and_palm_pos_orn_dim+finger_joints_dim+kuka_joints_dim
        reset_observation_space(obs_dim)

      elif obs_mode in ["kuka_joint_hand_joint"]:
        kuka_dim = 7
        hand_dim = 16
        cube_dim =6
        obs_dim = kuka_dim+hand_dim+cube_dim
        reset_observation_space(obs_dim)
      elif obs_mode in ["palm_pos_orn_and_hand_joints"]:
        palm_dim = 6
        hand_dim = 16
        cube_dim = 6
        obs_dim = palm_dim+hand_dim+cube_dim
        reset_observation_space(obs_dim)
      else:
        raise Exception("observation can not be "+str()+"chooose form:: "+str(self._observation_frames ))

  def set_configuration(self):
    self.set_obs_mode(self.obs_mode)
    return self.observation_space

class Action():
  """
  All the action processing will be done here in order 
  to clean up the code and simplify the controller
  """
  def __init__(self,controller_obj,action_mode,symitric_action,ee_type):
    #This is used for action_mode "dxdydz_drdpdy","dxdydz"
    self.action_state ={
      #flags
      "delta_jointControl_hand_IK_kuka_flag":False,
      "delta_joint_control_flag":False,
      #portions
      "delta_xyz_size":1/4, #portion*abs(max-min) this is portion
      "delta_rpy_size":1/4, #portion*abs(max-min) this is portion
      #state holder
      "delta_joint_control":[0]*23,
      "delta_jointControl_hand_IK_kuka":{
        "xyz_rpy":[0]*6,
        "joints":[0]*16
      }

    }
    #action setting
    self.action_mode = action_mode
    self.symitric_action = symitric_action
    self.ee_type =ee_type
    self.controller_obj = controller_obj
    self._action_modes = ["jointControl","jointControl_hand_IK_kuka,delta_joint_control","delta_jointControl_hand_IK_kuka"]
    self._action_limit = {
      "kuka":{
        "ee":{ #This is with coordinate frame 0,0,0 
          # xyz rpy
          "low":[-0.85,-0.85,-0.33,-1.5708,-1.5708,-1.5708],
          "high":[0.85,0.85,1.18,1.5708,1.5708,1.5708]
        },
        "ee_delta":{

        },
        "joint":{
          "high":[2.96706, 2.0944, 2.96706, 2.0944, 2.96706, 2.0944, 3.05433],
          "low":[-2.96706, -2.0944, -2.96706, -2.0944, -2.96706, -2.0944, -3.05433]
        },
        "joint_delta":{

        }
      },
      "hand":{
        "joint":{
          "low":[ 0, 0, 0, -0.349066, 0, 0, 0, -0.349066, 0, 0, 0, -0.349066, -1.0472, 0, -0.698132, 0],
          "high":[ 1.5708, 1.5708, 1.5708, 0.349066, 1.5708, 1.5708, 1.5708, 0.349066, 1.5708, 1.5708, 1.5708, 0.349066, 1.0472, 1.22173, 0.698132, 1.5708]
        },
        "joint_delta":{
          #portion*(max-min) 
          "high":[self.action_state["delta_rpy_size"]]*16,
          "low" :[-1*self.action_state["delta_rpy_size"]]*16
        }
      }
    }

    #setting delta values for action limit
    self._action_limit["kuka"]["ee_delta"] = {
                #xyzrpy
                #portion*abs(max-min) 
          "high":[self.action_state["delta_xyz_size"]*abs(self._action_limit["kuka"]["ee"]["high"][i]-self._action_limit["kuka"]["ee"]["low"][i])for i in range(len(self._action_limit["kuka"]["ee"]["high"][:3]))]+
                 [self.action_state["delta_rpy_size"]*abs(self._action_limit["kuka"]["ee"]["high"][i]-self._action_limit["kuka"]["ee"]["low"][i])for i in range(len(self._action_limit["kuka"]["ee"]["high"][:3]))],
          "low" :[-1*self.action_state["delta_xyz_size"]*abs(self._action_limit["kuka"]["ee"]["high"][i]-self._action_limit["kuka"]["ee"]["low"][i])for i in range(len(self._action_limit["kuka"]["ee"]["high"][3:]))]+
                 [self.action_state["delta_rpy_size"]*abs(self._action_limit["kuka"]["ee"]["high"][i]-self._action_limit["kuka"]["ee"]["low"][i])for i in range(len(self._action_limit["kuka"]["ee"]["high"][3:]))]
        
       
    }
    self._action_limit["kuka"]["joint_delta"] = {
      #joints
      #portion*abs(max-min) 
      "high":[self.action_state["delta_rpy_size"]*abs(self._action_limit["kuka"]["joint"]["high"][i]-self._action_limit["kuka"]["joint"]["low"][i])for i in range(len(self._action_limit["kuka"]["joint"]["high"]))],
      "low" :[-1*self.action_state["delta_rpy_size"]*abs(self._action_limit["kuka"]["joint"]["high"][i]-self._action_limit["kuka"]["joint"]["low"][i])for i in range(len(self._action_limit["kuka"]["joint"]["high"]))]
    }
    self._action_limit["hand"]["joint_delta"] ={
      #joints
      #portion*abs(max-min) 
      "high":[self.action_state["delta_rpy_size"]*abs(self._action_limit["hand"]["joint"]["high"][i]-self._action_limit["hand"]["joint"]["low"][i])for i in range(len(self._action_limit["hand"]["joint"]["high"]))],
      "low" :[-1*self.action_state["delta_rpy_size"]*abs(self._action_limit["hand"]["joint"]["high"][i]-self._action_limit["hand"]["joint"]["low"][i])for i in range(len(self._action_limit["hand"]["joint"]["high"]))]
    }

    #robot start joint values
    self.robot_start_joint_values= {
      "kuka":[0]*7,
      "hand":[0]*16
    }

  
  def reset(self):

    self.action_state["delta_joint_control"] = [0]*23
    self.action_state["delta_jointControl_hand_IK_kuka"]={
        "xyz_rpy":[0]*6,
        "joints":[0]*16
      }
  
  def process_action(self,command):
      """
      will convert action to continious joint values
      The command will be processed differently according to action mode
      """
      processed_command = []
      if self.action_mode =="jointControl":
        processed_command = self.process_jointControl(command)
      elif self.action_mode =="jointControl_hand_IK_kuka":
        processed_command = self.process_jointControl_hand_IK_kuka(command)
      elif self.action_mode =="delta_joint_control":
        processed_command = self.process_delta_joint_control(command)
      elif self.action_mode =="delta_jointControl_hand_IK_kuka":
        processed_command = self.process_delta_jointControl_hand_IK_kuka(command)
      else:
        raise NotImplemented()

      return processed_command

  def set_action_mode(self):
      action_mode = self.action_mode
      if action_mode == "jointControl": #jointControl
        self.action_high_non_symitric = np.array(self._action_limit["kuka"]["joint"]["high"]+self._action_limit["hand"]["joint"]["high"])
        self.action_low_non_symitric  = np.array(self._action_limit["kuka"]["joint"]["low"] +self._action_limit["hand"]["joint"]["low"])
  
      elif action_mode == "jointControl_hand_IK_kuka":#jointControl_hand_IK_kuka
        self.action_high_non_symitric = np.array(self._action_limit["kuka"]["ee"]["high"]+self._action_limit["hand"]["joint"]["high"])
        self.action_low_non_symitric  = np.array(self._action_limit["kuka"]["ee"]["low"] +self._action_limit["hand"]["joint"]["low"])
      elif  action_mode == "delta_joint_control":
        self.action_high_non_symitric = np.array(self._action_limit["kuka"]["joint_delta"]["high"]+self._action_limit["hand"]["joint_delta"]["high"])
        self.action_low_non_symitric  = np.array(self._action_limit["kuka"]["joint_delta"]["low"] +self._action_limit["hand"]["joint_delta"]["low"])

      elif action_mode == "delta_jointControl_hand_IK_kuka":
     
        self.action_high_non_symitric = np.array(self._action_limit["kuka"]["ee_delta"]["high"]+self._action_limit["hand"]["joint_delta"]["high"])
        self.action_low_non_symitric  = np.array(self._action_limit["kuka"]["ee_delta"]["low"] +self._action_limit["hand"]["joint_delta"]["low"])
        # sys.exit()
      self.action_high = self.action_high_non_symitric
      self.action_low = self.action_low_non_symitric  
      self.action_space = spaces.Box(self.action_low, self.action_high)

  def convertTo_non_symitric_action(self,action):
      noneSymitric_action = len(self.action_high_non_symitric)*[0]
      for i in range(0, len(self.action_high)):
        noneSymitric_action[i] = ((action[i]-self.action_low[i])/(self.action_high[i]-self.action_low[i]))*(self.action_high_non_symitric[i]-self.action_low_non_symitric[i])+self.action_low_non_symitric[i]
      return noneSymitric_action

  def set_To_symitric(self):
      # print("ENV::set_To_symitric()::")

      
      if self.symitric_action == True:
        self.action_high = np.array(len(self.action_high_non_symitric) *[1])
        self.action_low = np.array(len(self.action_low_non_symitric ) *[-1])
      else:
        self.action_high = self.action_high_non_symitric
        self.action_low = self.action_low_non_symitric
      
      
      self.action_space = spaces.Box(self.action_low, self.action_high)

  def set_configuration(self):
    """
    return  different setting for action all together
    """
    self.set_action_mode()
    self.set_To_symitric()

    return self.action_space
  
    


    ##################process action for each action mode################
  
  def process_jointControl(self,command):
      """
      We only need to check if incomming action is symiteric is yes then we need to convert it to
      Non symitric since robot commands are non symitric
      """
      processed_command = []

      if self.symitric_action ==False:
        processed_command = command
      else:
        processed_command = self.convertTo_non_symitric_action(command)

      return processed_command
    
  def process_jointControl_hand_IK_kuka(self,command):
      """     
      -We need to check if incomming action is symiteric is yes then we need to convert it to
       Non symitric since robot commands are non symitric
      -We need to perform inverse kinemtatic in order to get  joint values
      """
      processed_command = []
      if self.symitric_action ==False:
        processed_command = command
      else:
        processed_command = self.convertTo_non_symitric_action(command)

      #perfroming ik for kuka
      kuka_command_unprocessed = processed_command[:6] #this is xyzrpy it should be converted to joint values
      hand_command = processed_command[6:]

      kuka_command = self.get_processed_kuka_command(kuka_command_unprocessed)

      processed_command = list(kuka_command)+list(hand_command)

      return processed_command
  
  def process_delta_joint_control(self,command):
      processed_command = []

      if self.symitric_action ==False:
        processed_command = command
      else:
        processed_command = self.convertTo_non_symitric_action(command)

      #Add the delta action to action history
      processed_command = [self.action_state["delta_joint_control"][i]+motor_command for i,motor_command in enumerate(processed_command)]

      return processed_command
    
  def process_delta_jointControl_hand_IK_kuka(self,command):
      processed_command = []

      if self.symitric_action ==False:
        processed_command = command
      else:
        processed_command = self.convertTo_non_symitric_action(command)

      kuka_command_unprocessed = processed_command[:6] #this is xyzrpy it should be converted to joint values
      hand_command = processed_command[6:]

      #Add the delta action to action history
      kuka_command_unprocessed = [self.action_state["delta_jointControl_hand_IK_kuka"]["xyz_rpy"][i]+ee_command   for i,ee_command in enumerate(kuka_command_unprocessed)]
      hand_command  = [self.action_state["delta_jointControl_hand_IK_kuka"]["joints"][i]+hand_command  for i,hand_command in enumerate(hand_command)]

      #perfroming ik for kuka
      kuka_command = self.get_processed_kuka_command(kuka_command_unprocessed)

      processed_command = kuka_command+hand_command

      return processed_command

  def get_processed_kuka_command(self,kuka_command_unprocessed):
      pos = kuka_command_unprocessed[:3]
      orn = kuka_command_unprocessed[3:]

      if self.ee_type =="kuka":
        ee_index = self.controller_obj.get_kuka_ee_linkIndex()
      elif self.ee_type =="palm":
        ee_index = self.controller_obj.get_palm_linkIndex()
      else:
        raise NotImplemented()


      joint_commands = p.calculateInverseKinematics(self.controller_obj._robot_id,ee_index,pos,p.getQuaternionFromEuler(orn))
        
      return list(joint_commands)
  
class Reward_ee():
  def __init__(self,obs_obj,reward_obs_mode ,reward_function_choice):
    self._obs = obs_obj
    self.reward_obs_mode = None
    self._reward_function_choice = None

    self._set_reward_function(reward_function_choice,reward_obs_mode)

  def reward_type_one(self,obs,isXYZ = True,weights=None,exclude_end_effector=False):   
      
      if not isXYZ:
        reward = None
        weights = weights if weights else {"kuka_OR_palm":1,"fingers":1}
        kukaEE_OR_palm_dist = obs[0]
        FF_dist = obs[1]
        MF_dist = obs[2]
        RF_dist = obs[3]
        TH_dist = obs[4]

        if exclude_end_effector:
          reward = -1*(weights["fingers"]*FF_dist+weights["fingers"]*MF_dist+weights["fingers"]*RF_dist+weights["fingers"]*TH_dist)
        else:
          reward = -1*(weights["kuka_OR_palm"]*kukaEE_OR_palm_dist+weights["fingers"]*FF_dist+weights["fingers"]*MF_dist+weights["fingers"]*RF_dist+weights["fingers"]*TH_dist)
        
        return reward
      elif isXYZ:

        weights = weights if weights else {"kuka_OR_palm_x":1,"kuka_OR_palm_y":1,"kuka_OR_palm_z":1,"fingers_x":1,"fingers_y":1,"fingers_z":1}

        kukaEE_OR_palm_dist_x,kukaEE_OR_palm_dist_y,kukaEE_OR_palm_dist_z = obs[0:3]
        FF_dist_x,FF_dist_y,FF_dist_z = obs[3:6]
        MF_dist_x,MF_dist_y,MF_dist_z = obs[6:9]
        RF_dist_x,RF_dist_y,RF_dist_z = obs[9:12]
        TH_dist_x,TH_dist_y,TH_dist_z = obs[12:15]

        kuka_reward = -1*(weights["kuka_OR_palm_x"]*kukaEE_OR_palm_dist_x+weights["kuka_OR_palm_y"]*kukaEE_OR_palm_dist_y+weights["kuka_OR_palm_z"]*kukaEE_OR_palm_dist_z)

        reward_fingers_x = -1*weights["fingers_x"]*(FF_dist_x+MF_dist_x+RF_dist_x+TH_dist_x)
        reward_fingers_y = -1*weights["fingers_y"]*(FF_dist_y+MF_dist_y+RF_dist_y+TH_dist_y)
        reward_fingers_z = -1*weights["fingers_z"]*(FF_dist_z+MF_dist_z+RF_dist_z+TH_dist_z)
        if exclude_end_effector:
          reward = reward_fingers_x+reward_fingers_y+reward_fingers_z
        else:
          reward = kuka_reward+reward_fingers_x+reward_fingers_y+reward_fingers_z
        return reward
      
      
      else:
        print("wrong input for isXYZ should be (True|False)")

  def reward_type_two(self,obs,kuka=True):
   
      ############Observation#########   
      robot_state = self._controller.getObservation()
  
      blockPos,blockOrn = p.getBasePositionAndOrientation(self.cubeId)

      fingers_dist_worldFrame =[]
      fingers_dist_fingerFrame =[]

      robot_EE_State  = robot_state[:7] if kuka else self._controller.getObservation_palm #xyz and quatrenium 
      robot_EE_Pos = robot_EE_State[:3]
      robot_EE_Orn = robot_EE_State[3:]

      #Distance of robot_ee to obj in world frame
      robot_dist_x = blockPos[0] - robot_EE_Pos[0]
      robot_dist_y = blockPos[1] - robot_EE_Pos[1]
      robot_dist_z = blockPos[2] - robot_EE_Pos[2]

      # size of vector for robot_ee to obj in world frame
      robot_dist_worldFrame = math.sqrt(robot_dist_x**2+ robot_dist_y**2+ robot_dist_z**2)

      state_counter = 1
      for linkName in self._robot_hand.get_fingerTips_linkIndex():
        state_counter +=1
        fingerState = robot_state[7*(state_counter-1):7*state_counter]#xyz and quatrenium 
        finger_EE_pos = fingerState[:3]
        finger_EE_orn = fingerState[3:]

        #Distance of finger_ee to obj in world frame
        finger_dist_x = blockPos[0] - finger_EE_pos[0]
        finger_dist_y = blockPos[1] - finger_EE_pos[1]
        finger_dist_z = blockPos[2] - finger_EE_pos[2]

        # size of vector for finger_ee to obj in world frame
        finger_dist_worldFrame = math.sqrt(finger_dist_x**2+ finger_dist_y**2+ finger_dist_z**2)
        fingers_dist_worldFrame.append(finger_dist_worldFrame)
       

      robot_dist_worldFrame = [robot_dist_worldFrame]+fingers_dist_worldFrame
      #robot_ee orn
      robot_EE_Orn = p.getEulerFromQuaternion(robot_EE_Orn)
      #dists cube orn and palm orn 
      block_orn = p.getEulerFromQuaternion(blockOrn)
      obs_worldFrame = robot_dist_worldFrame+list(block_orn)+list(robot_EE_Orn)
      ############Reward#########  
      weights = weights if weights else {"kuka_OR_palm":1,"fingers":1}
      kukaEE_OR_palm_dist = obs_worldFrame[0]
      FF_dist = obs_worldFrame[1]
      MF_dist = obs_worldFrame[2]
      RF_dist = obs_worldFrame[3]
      TH_dist = obs_worldFrame[4]

      reward = -1*(weights["kuka_OR_palm"]*kukaEE_OR_palm_dist+weights["fingers"]*FF_dist+weights["fingers"]*MF_dist+weights["fingers"]*RF_dist+weights["fingers"]*TH_dist)
      return reward
    
  def reward_type_three(self,obs,isXYZ = True,weights=None):
      """
      This reward function give const of life -1 every step and 
      when max episdoe is reached it will give reward_type_one as final
      reward for last episode
      """
      reward = -1

      if self._envStepCounter>self._max_episode_steps:
        print("Giving reward for last episode")
        reward += reward_type_one(obs,isXYZ,weights)
      return reward
    
  def reward_type_four(self,obs,kuka=True):
      """
      This reward function give const of life -1 every step and 
      when max episdoe is reached it will give reward_type_two as final
      reward for last episode
      """
      reward = -1
      if self._envStepCounter>self._max_episode_steps:
        print("Giving reward for last episode")
        reward += reward_type_two(obs,kuka)
      return reward
    
  def reward_type_five(self):
      """
      This reward function give const of life -1 every step 
      """
      reward = -1

      return reward
   
  def reward_type_six(self,obs):
      """
      This reward function is from 
      Investigating deep Reinfrocment learning for grasping objects with an Anthropomorphic hand
      """
      kukaEE_OR_palm_dist = obs[0]
      reward= -0.1*kukaEE_OR_palm_dist

      return reward
      
  def get(self):
    reward =None
    ####Reward encouraging the robot to get closer to object#####
    if   self._reward_function_choice ==1:
      """
      Compatible with follwoing observations:
      kuka_world,kuka,palm_world,palm
      """
      obs = None
      if self._reward_obs_mode == "kuka_world":
        obs = self._obs.obs_distAndOrn_relativeToKukaAndFingers(worldFrame=True)
      elif self._reward_obs_mode == "kuka":
        obs = self._obs.obs_distAndOrn_relativeToKukaAndFingers(worldFrame=False)
      elif self._reward_obs_mode == "palm_world":
        obs = self._obs.obs_distAndOrn_relativeToPalmAndFingers(worldFrame=True)
      elif self._reward_obs_mode == "palm":
        obs = self._obs.obs_distAndOrn_relativeToPalmAndFingers(worldFrame=False)

      reward = self.reward_type_one(obs,isXYZ = False)

    elif self._reward_function_choice ==2:
      """
      Compatible with follwoing observations:
      kuka_world_xyz,kuka_xyz,palm_world_xyz,palm_xyz
      """
      obs = None
      if self._reward_obs_mode == "kuka_world_xyz":
        obs = self._obs.obs_distAndOrn_relativeToKukaAndFingers_xyz(worldFrame=True)
      elif self._reward_obs_mode == "kuka_xyz":
        obs = self._obs.obs_distAndOrn_relativeToKukaAndFingers_xyz(worldFrame=False)
      elif self._reward_obs_mode == "palm_world_xyz":
        obs = self._obs.obs_distAndOrn_relativeToPalmAndFingers_xyz(worldFrame=True)
      elif self._reward_obs_mode == "palm_xyz":
        obs = self._obs.obs_distAndOrn_relativeToPalmAndFingers_xyz(worldFrame=False)

      reward = self.reward_type_one(obs,isXYZ = True)

    elif self._reward_function_choice ==3:
      """
      Compatible with follwoing observations:
      kuka_pos_orn,palm_pos_orn
      """
      obs = None
      isKuka = False
      if self._reward_obs_mode == "kuka_pos_orn":
        obs = self._obs.obs_pos_and_orn_relative_to_world_kuka()
        isKuka = True
      elif self._reward_obs_mode =="palm_pos_orn":
        obs = self._obs.obs_pos_and_orn_relative_to_world_palm()
        isKuka = False

      reward = self.reward_type_two(obs,kuka = isKuka)
    elif self._reward_function_choice ==4:
      """
      Compatible with follwoing observations:
      kuka_world,kuka,palm_world,palm
      """
      obs = None
      if self._reward_obs_mode == "kuka_world":
        obs = self._obs.obs_distAndOrn_relativeToKukaAndFingers(worldFrame=True)
      elif self._reward_obs_mode == "kuka":
        obs = self._obs.obs_distAndOrn_relativeToKukaAndFingers(worldFrame=False)
      elif self._reward_obs_mode == "palm_world":
        obs = self._obs.obs_distAndOrn_relativeToPalmAndFingers(worldFrame=True)
      elif self._reward_obs_mode == "palm":
        obs = self._obs.obs_distAndOrn_relativeToPalmAndFingers(worldFrame=False)

      reward = self.reward_type_three(obs,isXYZ = False)

    elif self._reward_function_choice ==5:
      """
      Compatible with follwoing observations:
      kuka_world_xyz,kuka_xyz,palm_world_xyz,palm_xyz
      """
      obs = None
      if self._reward_obs_mode == "kuka_world_xyz":
        obs = self._obs.obs_distAndOrn_relativeToKukaAndFingers_xyz(worldFrame=True)
      elif self._reward_obs_mode == "kuka_xyz":
        obs = self._obs.obs_distAndOrn_relativeToKukaAndFingers_xyz(worldFrame=False)
      elif self._reward_obs_mode == "palm_world_xyz":
        obs = self._obs.obs_distAndOrn_relativeToPalmAndFingers_xyz(worldFrame=True)
      elif self._reward_obs_mode == "palm_xyz":
        obs = self._obs.obs_distAndOrn_relativeToPalmAndFingers_xyz(worldFrame=False)

      reward = self.reward_type_three(obs,isXYZ = True)

    elif self._reward_function_choice ==6:
      """
      Compatible with follwoing observations:
      kuka_pos_orn,palm_pos_orn
      """
      obs = None
      isKuka = False
      if self._reward_obs_mode == "kuka_pos_orn":
        obs = self._obs.obs_pos_and_orn_relative_to_world_kuka()
        isKuka = True
      elif self._reward_obs_mode =="palm_pos_orn":
        obs = self._obs.obs_pos_and_orn_relative_to_world_palm()
        isKuka = False
     
      reward = self.reward_type_four(obs,kuka = isKuka)

    elif self._reward_function_choice ==7:
      """This is compatiable with all the observations"""
      reward =  self.reward_type_five()

    elif self._reward_function_choice ==8:
      """
      This is compatible with palm,kuka
      """
      obs = None
      isKuka = False
      if self._reward_obs_mode == "palm":
        obs = self._obs.obs_distAndOrn_relativeToPalmAndFingers(worldFrame=False)
      elif self._reward_obs_mode == "kuka":
        obs = self._obs.obs_distAndOrn_relativeToKukaAndFingers(worldFrame=False)

      reward = self.reward_type_six(obs)

    elif self._reward_function_choice ==9:
      """
      Compatible with follwoing observations:
      kuka_world,kuka,palm_world,palm
      """
      obs = None
      if self._reward_obs_mode == "kuka_world":
        obs = self._obs.obs_distAndOrn_relativeToKukaAndFingers(worldFrame=True)
      elif self._reward_obs_mode == "kuka":
        obs = self._obs.obs_distAndOrn_relativeToKukaAndFingers(worldFrame=False)
      elif self._reward_obs_mode == "palm_world":
        obs = self._obs.obs_distAndOrn_relativeToPalmAndFingers(worldFrame=True)
      elif self._reward_obs_mode == "palm":
        obs = self._obs.obs_distAndOrn_relativeToPalmAndFingers(worldFrame=False)

      reward = self.reward_type_one(obs,isXYZ = False,exclude_end_effector=True)

    return reward


  def _set_reward_function(self,choice=None,reward_obs_mode=None):
    reward_obs_mode = reward_obs_mode
    if reward_obs_mode ==None:
      warnings.warn("reward will be based on palm observation")
      self._reward_obs_mode = "palm"
      reward_obs_mode =self._reward_obs_mode

    if choice ==None:
      error = "Please set the reward function using set_reward_and_obs()"
      raise RewardChoiseNotSetCorrectly(error)
    elif choice >9: 
      error = "Please set the reward function by choosing value between 1 to 9"
      raise RewardChoiseNotSetCorrectly(error)
    elif choice ==1:
      if reward_obs_mode in ["kuka_world","kuka","palm_world","palm"]:
        self._reward_function_choice =1
        self._reward_obs_mode = reward_obs_mode
      else:
        error = "This observation frame ,"+reward_obs_mode +", is not compatible with choosen reward fnction \
                 the following observations are comnpatable: kuka_world,kuka,palm_world,palm"
        raise WrongRewardObs(error)

    elif choice ==2:
      if reward_obs_mode in ["kuka_world_xyz","kuka_xyz","palm_world_xyz","palm_xyz"]:
        self._reward_function_choice =2
        self._reward_obs_mode = reward_obs_mode
      else:
        error = "This observation frame ,"+reward_obs_mode +", is not compatible with choosen reward fnction \
                 the following observations are comnpatable: kuka_world_xyz,kuka_xyz,palm_world_xyz,palm_xyz"
        raise WrongRewardObs(error)

    elif choice ==3:
      if reward_obs_mode in ["kuka_pos_orn","palm_pos_orn"]:
        self._reward_function_choice =3
        self._reward_obs_mode = reward_obs_mode
      else:
        error = "This observation frame ,"+reward_obs_mode +", is not compatible with choosen reward fnction \
                 the following observations are comnpatable: kuka_pos_orn,palm_pos_orn"
        raise WrongRewardObs(error)

    elif choice ==4:
      if reward_obs_mode in ["kuka_world","kuka","palm_world","palm"]:
        self._reward_function_choice =4
        self._reward_obs_mode = reward_obs_mode
      else:
        error = "This observation frame ,"+reward_obs_mode +", is not compatible with choosen reward fnction \
                 the following observations are comnpatable: kuka_world,kuka,palm_world,palm"
        raise WrongRewardObs(error)

    elif choice ==5:
      if reward_obs_mode in ["kuka_world_xyz","kuka_xyz","palm_world_xyz","palm_xyz"]:
        self._reward_function_choice =5
        self._reward_obs_mode = reward_obs_mode
      else:
        error = "This observation frame ,"+reward_obs_mode +", is not compatible with choosen reward fnction \
                 the following observations are comnpatable: kuka_world_xyz,kuka_xyz,palm_world_xyz,palm_xyz"
        raise WrongRewardObs(error)

    elif choice ==6:
      if reward_obs_mode in ["kuka_pos_orn","palm_pos_orn"]:
        self._reward_function_choice =6
        self._reward_obs_mode = reward_obs_mode
      else:
        error = "This observation frame ,"+reward_obs_mode +", is not compatible with choosen reward fnction \
                 the following observations are comnpatable: kuka_pos_orn,palm_pos_orn"
        raise WrongRewardObs(error)   
    elif choice ==7:
      if reward_obs_mode in self._observation_frames:
        self._reward_function_choice =7
        self._reward_obs_mode = reward_obs_mode
      else:
        error = "The observation is not supported"
        raise WrongRewardObs(error)   

    elif  choice ==8:
      if reward_obs_mode in ["palm","kuka"]:
        self._reward_function_choice =8
        self._reward_obs_mode = reward_obs_mode
      else:
        error = "This observation frame ,"+reward_obs_mode +", is not compatible with choosen reward fnction \
                 the following observations are comnpatable:  palm,kuka"
        raise WrongRewardObs(error)
    elif choice ==9:
      if reward_obs_mode in ["kuka_world","kuka","palm_world","palm"]:
        self._reward_function_choice =9
        self._reward_obs_mode = reward_obs_mode
      else:
        error = "This observation frame ,"+reward_obs_mode +", is not compatible with choosen reward fnction \
                 the following observations are comnpatable: kuka_world,kuka,palm_world,palm"
        raise WrongRewardObs(error)

class RandomStartingPosition():
  def __init__(self,mode):
    self.mode  = mode
    self.modes = ["kuka_random_pose","close_to_object","grasp_pose"]
    self.action_state ={
      #flags
      "delta_jointControl_hand_IK_kuka_flag":False,
      "delta_joint_control_flag":False,
      #portions
      "delta_xyz_size":1/4, #portion*abs(max-min) this is portion
      "delta_rpy_size":1/4, #portion*abs(max-min) this is portion
      #state holder
      "delta_joint_control":[0]*23,
      "delta_jointControl_hand_IK_kuka":{
        "xyz_rpy":[0]*6,
        "joints":[0]*16
      }

    }
    self._action_limit = {
      "kuka":{
        "ee":{ #This is with coordinate frame 0,0,0 
          # xyz rpy
          "low":[-0.85,-0.85,-0.33,-1.5708,-1.5708,-1.5708],
          "high":[0.85,0.85,1.18,1.5708,1.5708,1.5708]
        },
        "ee_delta":{

        },
        "joint":{
          "high":[2.96706, 2.0944, 2.96706, 2.0944, 2.96706, 2.0944, 3.05433],
          "low":[-2.96706, -2.0944, -2.96706, -2.0944, -2.96706, -2.0944, -3.05433]
        },
        "joint_delta":{

        }
      },
      "hand":{
        "joint":{
          "low":[ 0, 0, 0, -0.349066, 0, 0, 0, -0.349066, 0, 0, 0, -0.349066, -1.0472, 0, -0.698132, 0],
          "high":[ 1.5708, 1.5708, 1.5708, 0.349066, 1.5708, 1.5708, 1.5708, 0.349066, 1.5708, 1.5708, 1.5708, 0.349066, 1.0472, 1.22173, 0.698132, 1.5708]
        },
        "joint_delta":{
          #portion*(max-min) 
          "high":[self.action_state["delta_rpy_size"]]*16,
          "low" :[-1*self.action_state["delta_rpy_size"]]*16
        }
      }
    }
    #robot start joint values
    self.robot_start_joint_values= {
      "kuka":[0]*7,
      "hand":[0]*16
    }

  def __call__(self):
    if self.mode =="kuka_random_pose":
      return self.get_random_start_for_kuka()
    elif self.mode == "close_to_object":
      return self.get_hand_start_close_to_object()
    elif self.mode == "grasp_pose":
      return self.get_hand_start_grasp_pos()
    else:
      #Todo : rasie an error
      print("wrong mode")

  def get_random_start_for_kuka(self):
    #keep hands start joint value
    #randomly choose joint values for kuka 
    kuka = []
    kuka_ul = self._action_limit["kuka"]["joint"]["high"]
    kuka_ll = self._action_limit["kuka"]["joint"]["low"]
    for i in range(len(kuka_ul)):
      kuka.append(random.uniform(kuka_ll[i],kuka_ul[i]))

    return kuka+self.robot_start_joint_values["hand"]

  def get_hand_start_close_to_object(self):
    #respawn the robot while keeping palm close to target object
    kuka =[-0.9434738602993324, 0.5324031678257859, 2.398029524044686, 2.0593730551295018, 1.0782129013407338, -0.3699408545244377, -2.4954276873521577]
    return kuka+self.robot_start_joint_values["hand"]

  def get_hand_start_grasp_pos(self):
    #respawn the robot while had grasping the object
    pose =  [-0.9434738602993324, 0.5324031678257859, 2.398029524044686, 2.0593730551295018, 1.0782129013407338, -0.3699408545244377, -2.4954276873521577,
           -7.038447331687935e-05, 0.5000057679788388, 1.793617019429803e-05, 0.6000816742924279, 8.855820724423702e-05, 0.4999689017540587, 9.111328939907253e-05, 0.6000272217951091, 2.753128780085531e-05, 0.49999955870060014, 2.935193858575076e-05, 0.6000058086500141, 0.4999968150273409, 1.2217223357834621, -3.248787177232584e-05, 6.314196463208646e-05]
    return pose
  
class RepalentMagnetKuka():
  """
  This slows down the robot as it gets closer to the target
  """
  def __init__(self,obs_object):
    self.velocity_region = [0.005,0.05,0.35]
    self.safty_region = 0.15
    self.velocity = self.velocity_region[-1]
    self.obs_obj = obs_object
  def update_veclocity(self):
    obs = self.obs_obj.obs_distAndOrn_relativeToPalmAndFingers(worldFrame=False)
    obs_dist = obs[0]
    # print("\n")
    # print("RepalentMagnetKuka::update_veclocity::obs_dist:: ",obs_dist)
    
    if obs_dist >self.safty_region:
      self.velocity = self.velocity_region[-1]
    elif obs_dist <= self.safty_region:
      self.velocity = self.velocity_region[1]
      if self.velocity < self.velocity_region[0]: #make sure velocity is not less than lowest velocity 0.05
        self.velocity = self.velocity_region[0]
    
    # print("RepalentMagnetKuka::update_veclocity::self.velocity:: ",self.velocity)
    # print("\n")
  def get_velocity(self):
    return self.velocity

class Kuka_HandlitGymEnv(gym.Env):
  metadata = {
      'render_modes': ['human', 'rgb_array'],
      'video.frames_per_second' : 50
  }

  def __init__(self,render=False, timeStep = 1./1000.,obs_mode = "kuka_world",
               graspPhaseRadius = 0.35,action_mode = "delta_joint_control", reward_obs_mode = None,
               AW_mode = None,AW_setting=None,
               reward_function_choice = 1,
               actionRepeat=1,
               random_start=False,
               adaptive_action_reperate = {
                 "decay":False,
                 "decay_mode":None,
                 "starting_AAR_percentage":1, # this indicate inital percentage of action repreate 
                 "decay_param":{},
                 "training_steps":None,
                 "control_setting":{
                      "kuka":{                        
                        "force":200.0,
                        "maxVelocity":0.35,
                        "positionGain":0.3,
                        "velocityGain":1
                      },
                      "hand":{
                        "force":None,
                        "maxVelocity":None,
                        "positionGain":1,
                        "velocityGain":1
                      }
                  }
               },
              max_episode_steps = 5000,
              control_delay=5,
              symitric_action = False):

    self._p = p 
    self._render = render
    self._timeStep= timeStep
    self.graspPhaseRadius=graspPhaseRadius
    self.obs_mode = obs_mode
    self.random_start=random_start
    self.assets = []


    #env 
    self._envStepCounter = 0
    self._max_episode_steps = max_episode_steps
    self._control_delay = control_delay
    self.grasp_scuesss_flag = False

    #objects that need to be set
    self.controller = None
    self._observation = None
    self.graspPhase = None
    self.isGraspPhase = None


    #initalze adaotive action repeate
    self._actionRepeat = actionRepeat
    self.adaptive_action_reperate = adaptive_action_reperate

    # print("self.adaptive_action_reperate:: ",self.adaptive_action_reperate)
    
    self.AAR = None
    if self.adaptive_action_reperate:
      self.AAR = RobotAdaptiveActionRepeat(self._render,sim_step=self._timeStep,
                                         control_setting = self.adaptive_action_reperate["control_setting"]
            )

    if self.adaptive_action_reperate :
      if self.adaptive_action_reperate["decay"]:
        self.actionRepeatDecay = ActionRepeatDecay(total_training_steps =self.adaptive_action_reperate["training_steps"],
                                               decay_mode = self.adaptive_action_reperate["decay_mode"],
                                               param = self.adaptive_action_reperate["decay_param"]
                                              )
      # adjusting max_episode_steps according to starting_AAR_percentage
      if self.adaptive_action_reperate["starting_AAR_percentage"] == 1: 
        # This essentially make the task supervised learning. the agent is given a state and has to produce an action. the lenght of episode is one.
        self._max_episode_steps = math.ceil(self._max_episode_steps /100)
      else:
        self._max_episode_steps = math.ceil(self._max_episode_steps * self.adaptive_action_reperate["starting_AAR_percentage"])
        
   

    #connecting to a physic server
    if self._render:
      cid = self._p.connect(self._p.SHARED_MEMORY)
      if (cid<0):
         id = self._p.connect(self._p.GUI)
      self._p.resetDebugVisualizerCamera(1.3,180,-41,[0.52,-0.2,-0.33])
    else:
      self._p.connect(self._p.DIRECT)

    #loading the secne
    self.tableId = None
    self.cubeId = None
    self.load_scene()

    #setting sim parameters
    self._p.setTimeStep(self._timeStep)
    self._p.setRealTimeSimulation(0)
    self._p.setGravity(0,0,-10)


    #Intalizing Action 
    self.action_mode =action_mode
    self.symitric_action =symitric_action
    self.ee_type = None
    if "kuka" in obs_mode:
      self.ee_type = "kuka"
    else:
      self.ee_type ="palm"
    self.action_obj = Action(self.controller,self.action_mode,self.symitric_action,self.ee_type)
    self.action_space = self.action_obj.set_configuration()
    self.action_obj.reset()

    #Intalizing observation
    self.obs_obj = Observation(self.controller,self.cubeId,mode=obs_mode)
    self.observation_space = self.obs_obj.set_configuration()
    #Initalize Reward 
    self.reward_obj = Reward_ee(obs_obj=self.obs_obj,reward_obs_mode=reward_obs_mode,
                                reward_function_choice=reward_function_choice)
    self.ave_reward_episode = 0

    #Intializing AW
    self.AW = None 
    if AW_mode != None:
  

      self.set_AW_mode(AW_mode,self._render,AW_setting =AW_setting)


    #Intializing repelent magnet  
    self.repalent_magnet = RepalentMagnetKuka(self.obs_obj)
    #Initalizing graspPhase
    self.graspPhase      = GraspPhase(self.obs_obj,objectDim ={"width":0.05,"height":0.05},
                                      radius=self.graspPhaseRadius,obj_initial_pos= self.target_xyz,physic_engine=self._p)
    


  def reset(self,joint_values=None):
    # print("self.target_xyz:: ",self.target_xyz)
    #reset the cube
    self._p.resetBasePositionAndOrientation(self.cubeId,self.target_xyz,(0,0,0,1))
    #reset the robot
    if self.AW !=None:
      reset_joints = self.AW.get_reset_pos()
      AW_check = True
      while reset_joints ==None or AW_check:
        reset_joints =  self.AW.get_reset_pos()
        reset_joints = list(reset_joints)+[0]*16
        #reset robot
        self.controller.reset(reset_joints)
        self._p.stepSimulation()
        obs = self.controller.getPureObservation()["hand"]["xyz_rpy"]["palm"]
        pos,orn = obs[:3],obs[3:]
        AW_check = self.AW.check_if_ee_outside_AW((pos,orn))
    
    elif joint_values:
      reset_joints= joint_values
      #reset robot
      self.controller.reset(reset_joints)
      self._p.stepSimulation()
    else:
      if self.random_start:
        reset_joints =  RandomStartingPosition(self.random_start)()
        self._p.stepSimulation()
        
      else:
        reset_joints = [0]*23
      
      #reset robot
      self.controller.reset(reset_joints)
      self._p.stepSimulation()

    #reset env variables
    self._envStepCounter = 0
    self.grasp_scuesss_flag = False
    
 

    self._observation = self.getExtendedObservation()

    return np.array(self._observation,dtype=np.float32)

  def _seed(self, seed=None):
    self.np_random, seed = seeding.np_random(seed)
    return [seed]

  def getExtendedObservation(self): # mamad : adds  {2d position and angle of object relative to gripper} to observation obtained from kuka.py file
    self._observation = self.obs_obj.get()

    return self._observation

  def step(self,action):

    self._envStepCounter += 1

    # print("step::called::action:: ",action)
    # print("step::called::self._envStepCounter:: ",self._envStepCounter)
    # print("step::called::self._max_episode_steps:: ",self._max_episode_steps)
    

    self.isGraspPhase = self.graspPhase.is_graspPhase()
    self.repalent_magnet.update_veclocity()
    command = self.action_obj.process_action(action)  
    joint_obs= self.controller.getObservation_joint()

    action_repeate =self.get_AAR(joint_obs,command,self.isGraspPhase)

    for i in range(action_repeate):
      for j in range(self._control_delay):
        self.controller.applyAction(command,self.repalent_magnet,self.isGraspPhase)
        self._p.stepSimulation()
  
    
    reward = self._reward()
    self._observation = self.getExtendedObservation()
    done =self._termination()

    return np.array(self._observation,dtype=np.float32), reward, done ,{"actions":action,"command":command}
  
  def render(self):
    pass

  def _termination(self):

    # if observation is relative to kuka
    if "kuka" in self.obs_mode :
      state = self._p.getLinkState(self.controller._robot_id,self.controller.kukaEndEffectorIndex)
      actualEndEffectorPos = state[0]
    # if observation is relative to palm
    if "palm" in self.obs_mode :
      state = p.getLinkState(self.controller._robot_id,self.controller.get_palm_linkIndex())
      actualEndEffectorPos = state[0]

    """
    print("\n\n\n")
    if self.AW: print("check_if_ee_outside_AW::",self.AW.check_if_ee_outside_AW(state))
    print("check_if_collsion_with_table_has_happend::",self.check_if_collsion_with_table_has_happend())
    print("terminated::",self.grasp_scuesss_flag)
    print(" self._envStepCounter>self._max_episode_steps::", self._envStepCounter>self._max_episode_steps)
    print("termination called")
    print("\n\n\n")
    """

    AW_check = False if self.AW == None else  self.AW.check_if_ee_outside_AW(state)
    max_episode_steps_flag = self._envStepCounter>self._max_episode_steps/self._control_delay
    collision_with_table_flag = self.check_if_collsion_with_table_has_happend()

 

    if (self.grasp_scuesss_flag or 
        max_episode_steps_flag or
        collision_with_table_flag or  
        AW_check
        ):


      return True

    maxDist = 0.005
    closestPoints = self._p.getClosestPoints(self.tableId, self.controller._robot_id,maxDist)
    return False
  
  def _reward(self):
    #############Reward encouraging the robot to get closer to object################
    reward= self.reward_obj.get()
    ##################Reward given as result of successful grasp#####################
    fingers_tip_touch = self.check_fingers_touch_with_target()
    # we will terminate if at leate thumb and one finger touch 
    atLeat_one_finger_touch = fingers_tip_touch["distal_FF"] or fingers_tip_touch["distal_MF"] or fingers_tip_touch["distal_RF"]
    
    if atLeat_one_finger_touch and fingers_tip_touch["thdistal"]:
      finger_touch_reward = 10 # reward for thumb
      for key,value in fingers_tip_touch.items():
        if fingers_tip_touch[key] != "thdistal":
          if value == True:
            finger_touch_reward +=10
      reward +=finger_touch_reward
     
      self.grasp_scuesss_flag = True

      #grow adaptive woekspace AW if we are using it
      if self.AW_mode:
        self.AW.grow_AW()

      #update actionrepeate decay
      if self.adaptive_action_reperate:
        if self.adaptive_action_reperate["decay_mode"] =="decay_on_success":
           self.actionRepeatDecay.update_decay_on_success()

           
    # print("\n")
    # print("reward:: ",reward)
    # print("\n")
    self.ave_reward_episode += reward
    
    return reward
   
  def render_sim(self):
    cid = p.connect(p.SHARED_MEMORY)
    if (cid<0):
      cid = p.connect(p.GUI)
  
  def close(self):
    for asset_id in self.assets:
      self._p.removeBody(asset_id)
  if parse_version(gym.__version__)>=parse_version('0.9.6'):
    render = render
    reset  = reset
    seed   = _seed
    step   = step


  ########utility function#########
  def load_scene(self):
    #getting an instance of robot 
    kuka_angle = self._p.getQuaternionFromEuler([0,0,3.14])
    self.controller = Kuka_Handlit(self._p,kuka_pos =[-0.015,-0.91,0.7478]+list(kuka_angle))
    self.assets.append(self.controller._robot_id)
    #loading the table
    table_path = resource_filename(__name__,"/table/model.sdf")
    self.table =  self._p.loadSDF(table_path)
    self.tableId= self.table[0]
    self.assets.append(self.tableId)

    #load cube
    cube_path = resource_filename(__name__,"/cube/model.sdf")
    cube_texture_path =  resource_filename(__name__,"/cube/aaa.png")
    texUid = self._p.loadTexture(cube_texture_path)

    cube_objects = self._p.loadSDF(cube_path)
    self.cubeId = cube_objects[0]
    self.target_xyz = [0,-0.3,0.77]
    self._p.changeVisualShape(self.cubeId, -1,rgbaColor =[1,1,1,1])
    self._p.changeVisualShape(self.cubeId, -1, textureUniqueId = texUid)
    self._p.resetBasePositionAndOrientation(self.cubeId,self.target_xyz,(0,0,0,1))
    self.assets.append(self.cubeId)

    #load 
    urdfRoot=pybullet_data.getDataPath()
    self.plane_id = self._p.loadURDF(os.path.join(urdfRoot,"plane.urdf"),[0,0,0])
    self.assets.append(self.plane_id)
    

  def get_AAR(self,joint_obs,command,isGraspPhase):
    
    # processing decay     

    if self.adaptive_action_reperate:
      self._actionRepeat,_ = self.AAR.get(joint_obs,command,isGraspPhase) 
      if self.adaptive_action_reperate["decay"]:
        if self.adaptive_action_reperate["decay_mode"] =="stair_case":
          self._actionRepeat = self.actionRepeatDecay.stair_case(self._actionRepeat,self.current_training_step)
        elif  self.adaptive_action_reperate["decay_mode"] =="decay_on_success":
          self._actionRepeat = self.actionRepeatDecay.get_decay_on_success(self._actionRepeat)

    self._actionRepeat =math.ceil(self._actionRepeat /self._control_delay)

    # Applying intitial percentage of AAR

    self._actionRepeat =math.ceil(self._actionRepeat * self.adaptive_action_reperate["starting_AAR_percentage"])


    return self._actionRepeat

  #collision checking
  def check_fingers_touch_with_target(self):
    """
    To grasp there is need for two opposing forces therefore there is need for thumb plus one to 
    four fingers
    """
    finger_tip_touch= { # linkName:jointIndex
        "thdistal" :False,
        "distal_FF":False,
        "distal_MF":False,
        "distal_RF":False
    }
    contact = self._p.getContactPoints(self.controller._robot_id,self.cubeId)

    if contact != None:
      for finger in contact:
        jointIndex = finger[3]
        jointindex_info = self.controller.jointInfo.searchBy(key ="jointIndex",value=jointIndex)[0]
        linkName = jointindex_info["linkName"]
        if linkName == "thdistal" : finger_tip_touch["thdistal"]  = True
        if linkName == "distal_FF": finger_tip_touch["distal_FF"] = True
        if linkName == "distal_MF": finger_tip_touch["distal_MF"] = True
        if linkName == "distal_RF": finger_tip_touch["distal_RF"] = True



      # sys.exit()
      return finger_tip_touch 

  def check_if_collsion_with_table_has_happend(self):
    contact = p.getContactPoints(self.controller._robot_id,self.tableId)

    if len(contact)>0:

      return True
    else:
      return False

  #AW
  def set_AW_mode(self,AW_mode,render,AW_setting = None):
    # print("\n\n")
    # print("set_AW_mode::AW_mode:: ",AW_mode)
    # print("set_AW_mode::render:: ",render)
    # print("set_AW_mode::AW_process:: ",AW_process)
    # print("set_AW_mode::AW_setting:: ",AW_setting)
    # print("\n\n")
    # sys.exit()
    #TODO need to find a way to genrate hand pose for the hand for AW2
    # default setting
    AW1_setting ={
        "target_xyz"        :self.target_xyz,
        "initial_r"         :[0.2,0.2],
        "target_dim"        :[0.05,0.05,0.05],
        "hand_length"       :0.5,
        "grownth_increment" :0.1,
        "obs_mode"          : "kuka"
    }

    AW2_setting ={
        "target_xyz"        :self.target_xyz,
        "initial_r"         :[0.2,0.2],
        "target_dim"        :[0.05,0.05,0.05],
        "hand_length"       :0.5,
        "grownth_increment" :1,
        "obs_mode"          : "kuka"
    }

    if AW_setting:
      if AW_mode ==1 :
        print("GymEnv::AW1::set_AW_mode()::changing AW1 setting")
        for key,value in AW_setting.items():
          AW1_setting[key] = value
      elif AW_mode ==2 :
        for key,value in AW_setting.items():
          AW2_setting[key] = value
      else:
        #TODO replace with proper error msg
        print("AW_mode not supported!")



    if AW_mode==1:
      self.AW = AdaptiveWorkspace(pybullet_obj =self._p ,render=render,target_xyz=AW1_setting["target_xyz"],
                                  robot_id = self.controller.get_robot_id(),
                                  robot_ee = self.controller.get_palm_linkIndex(),
                                  initial_r=AW1_setting["initial_r"],
                                  target_dim=AW1_setting["target_dim"],hand_length=AW1_setting["hand_length"],
                                  grownth_increment=AW1_setting["grownth_increment"],obs_mode = AW1_setting["obs_mode"])

    elif AW_mode ==2:
      #TODO: Implement AW2 
      raise NotImplemented()