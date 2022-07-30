import os, inspect
currentdir = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe())))
print("\n")
print ("test_AW::current_dir=" + currentdir)
print("\n")

import unittest
import gym
import kuka_handlit_multiprocess

import pybullet as p

import os
import sys

import math
from kuka_handlit_multiprocess.envs.AW import AdaptiveWorkspace


import xml.etree.ElementTree as ET

EXPIREMENT_FOLDER = "dummy_exp_folder"
EXPIREMENT_PATH ="./../Expirements/"+EXPIREMENT_FOLDER+"/PPO/"
AW_PROGRESS_PATH = EXPIREMENT_PATH +"AW_progress"
ENV_SETTING_PATH = EXPIREMENT_PATH+"gym_env_setting"



class AW_Test(unittest.TestCase):
    def __init__(self, *args, **kwargs):
        super(AW_Test, self).__init__(*args, **kwargs)
        self.fingerTip_link_name = ["distal_FF","distal_MF","distal_RF","thdistal"] #this are joints between final link and one before it
        self.env_name = "kuka_handlit_multiprocess-v0"
        self._render = False
        self._p = p
    """
    def test_grow_AW(self):
   
      AW1_setting ={
        "target_xyz"        :[0,-0.3,0.765],
        "initial_r"         :[0.2,0.2],
        "target_dim"        :[0.05,0.05,0.05],
        "hand_length"       :0.5,
        "grownth_increment" :1,
        "obs_mode"          : "kuka"
      }

      if self._render:
        cid = self._p.connect(self._p.SHARED_MEMORY)
        if (cid<0):
           id = self._p.connect(self._p.GUI)
        self._p.resetDebugVisualizerCamera(1.3,180,-41,[0.52,-0.2,-0.33])
      else:
        self._p.connect(self._p.DIRECT)
      
      
      AW = AdaptiveWorkspace(pybullet_obj=self._p,target_xyz=AW1_setting["target_xyz"],initial_r=AW1_setting["initial_r"],
                             render =self._render,
                             
                             path = currentdir,
                             target_dim=AW1_setting["target_dim"],hand_length=AW1_setting["hand_length"],
                             grownth_increment=AW1_setting["grownth_increment"],obs_mode = AW1_setting["obs_mode"])
      
      previous_r = AW.initial_r[:]
      for i in range(10):
        AW.grow_AW()
        if i==4:
          self.assertTrue(AW.AWState["success_count"]==5)

      self.assertTrue(AW.initial_r[0]== previous_r[0]+AW1_setting["grownth_increment"])
      self.assertTrue(AW.AWState["success_count"]==0)
      self._p.disconnect()

    def test_check_if_ee_outside_AW(self):
    
      AW1_setting ={
        "target_xyz"        :[0,-0.3,0.765],
        "initial_r"         :[0.2,0.2],
        "target_dim"        :[0.05,0.05,0.05],
        "hand_length"       :0.5,
        "grownth_increment" :1,
        "obs_mode"          : "kuka"
      }

      if self._render:
        cid = self._p.connect(self._p.SHARED_MEMORY)
        if (cid<0):
           id = self._p.connect(self._p.GUI)
        self._p.resetDebugVisualizerCamera(1.3,180,-41,[0.52,-0.2,-0.33])
      else:
        self._p.connect(self._p.DIRECT)
      
      
      AW = AdaptiveWorkspace(pybullet_obj=self._p,target_xyz=AW1_setting["target_xyz"],initial_r=AW1_setting["initial_r"],
                             render =self._render,
                             
                             path = currentdir,
                             target_dim=AW1_setting["target_dim"],hand_length=AW1_setting["hand_length"],
                             grownth_increment=AW1_setting["grownth_increment"],obs_mode = AW1_setting["obs_mode"])
      
      pos = AW1_setting["target_xyz"][:]
      orn = [0,0,0]
      ############checking before growth############
      intial_r = AW.initial_r[:]
      ee_xyz = (pos,orn)
      # print("ee_xyz:: ",ee_xyz)
      #ee is insde
      res  =AW.check_if_ee_outside_AW(ee_xyz)
      self.assertTrue(res ==False)
      
      #ee is on boundy there are three boundry
      ee_xyz = (pos,orn)
      ee_xyz[0][0] +=intial_r[0]
      res  =AW.check_if_ee_outside_AW(ee_xyz)
      self.assertTrue(res ==False)

      ee_xyz = (pos,orn)
      ee_xyz[0][1] +=intial_r[0]
      res  =AW.check_if_ee_outside_AW(ee_xyz)
      self.assertTrue(res ==False)

      ee_xyz = (pos,orn)
      ee_xyz[0][2] +=intial_r[1]
      res  =AW.check_if_ee_outside_AW(ee_xyz)
      self.assertTrue(res ==False)
      
      #ee is outside there are three ways to be outside
      ee_xyz = (pos,orn)
      ee_xyz[0][0] +=intial_r[0]+0.01
      res  =AW.check_if_ee_outside_AW(ee_xyz)
      self.assertTrue(res ==True)

      ee_xyz = (pos,orn)
      ee_xyz[0][1] +=intial_r[0]+0.01
      res  =AW.check_if_ee_outside_AW(ee_xyz)
      self.assertTrue(res ==True)

      ee_xyz = (pos,orn)
      ee_xyz[0][2] +=intial_r[1]+0.01
      res  =AW.check_if_ee_outside_AW(ee_xyz)
      self.assertTrue(res ==True)

      
      ###########checking after growth#############
      pos = AW1_setting["target_xyz"][:]
      orn = [0,0,0]
      ee_xyz = (pos,orn)
      #causing the growth
      for i in range(10):
        AW.grow_AW()

      new_radius = AW.initial_r[:]   
      #ee is insde
      res  =AW.check_if_ee_outside_AW(ee_xyz)
      self.assertTrue(res ==False)
      
      #ee is on boundy there are three boundry
      ee_xyz = (pos,orn)
      ee_xyz[0][0] +=new_radius[0]

      res  =AW.check_if_ee_outside_AW(ee_xyz)
      self.assertTrue(res ==False)

      ee_xyz = (pos,orn)
      ee_xyz[0][1] +=new_radius[0]
      res  =AW.check_if_ee_outside_AW(ee_xyz)
      self.assertTrue(res ==False)

      ee_xyz = (pos,orn)
      ee_xyz[0][2] +=new_radius[1]
      res  =AW.check_if_ee_outside_AW(ee_xyz)
      self.assertTrue(res ==False)
      
      #ee is outside there are three ways to be outside
      ee_xyz = (pos,orn)
      ee_xyz[0][0] +=new_radius[0]+0.01
      res  =AW.check_if_ee_outside_AW(ee_xyz)
      self.assertTrue(res ==True)

      ee_xyz = (pos,orn)
      ee_xyz[0][1] +=new_radius[0]+0.01
      res  =AW.check_if_ee_outside_AW(ee_xyz)
      self.assertTrue(res ==True)

      ee_xyz = (pos,orn)
      ee_xyz[0][2] +=new_radius[1]+0.01
      res  =AW.check_if_ee_outside_AW(ee_xyz)
      self.assertTrue(res ==True)

      self._p.disconnect()
      #ee is on boundy there are three boundry
      #ee is outside there are three ways to be outside
          
    def test_pick_random_ee_position_in_AW(self):
      
      AW1_setting ={
        "target_xyz"        :[0,-0.3,0.765],
        "initial_r"         :[0.2,0.2],
        "target_dim"        :[0.05,0.05,0.05],
        "hand_length"       :0.5,
        "grownth_increment" :1,
        "obs_mode"          : "kuka"
      }

      if self._render:
        cid = self._p.connect(self._p.SHARED_MEMORY)
        if (cid<0):
           id = self._p.connect(self._p.GUI)
        self._p.resetDebugVisualizerCamera(1.3,180,-41,[0.52,-0.2,-0.33])
      else:
        self._p.connect(self._p.DIRECT)
      
      
      AW = AdaptiveWorkspace(pybullet_obj=p,target_xyz=AW1_setting["target_xyz"],initial_r=AW1_setting["initial_r"],
                             render =self._render,
                             
                             path = currentdir,
                             target_dim=AW1_setting["target_dim"],hand_length=AW1_setting["hand_length"],
                             grownth_increment=AW1_setting["grownth_increment"],obs_mode = AW1_setting["obs_mode"])
      for i in range(100):
        ee = AW.pick_random_ee_position_in_AW()
        pos = ee["ee_xyz"]
        orn = ee["angle"]

        ee_xyz = (pos,orn)

        res = AW.check_if_ee_outside_AW(ee_xyz)
        self.assertTrue(res==False)
      self._p.disconnect()


    def test_visualization(self):     
      
      
      AW1_setting ={
        "target_xyz"        :[0,-0.3,0.765],
        "initial_r"         :[0.1,0.1],
        "target_dim"        :[0.05,0.05,0.05],
        "hand_length"       :0.5,
        "grownth_increment" :0.1,
        "obs_mode"          : "kuka"
      }
      ground_truth = AW1_setting["target_xyz"][:]
      if self._render:
        cid = self._p.connect(self._p.SHARED_MEMORY)
        if (cid<0):
           id = self._p.connect(self._p.GUI)
        self._p.resetDebugVisualizerCamera(1.3,180,-41,[0.52,-0.2,-0.33])
      else:
        self._p.connect(self._p.DIRECT)
      
    
      AW = AdaptiveWorkspace(pybullet_obj=self._p ,target_xyz=AW1_setting["target_xyz"],initial_r=AW1_setting["initial_r"],
                             render =True,
                    
                             path = currentdir,
                             target_dim=AW1_setting["target_dim"],hand_length=AW1_setting["hand_length"],
                             grownth_increment=AW1_setting["grownth_increment"],obs_mode = AW1_setting["obs_mode"])


      intial_r = AW.initial_r[:]

      
      #making sure the position is correct
      pos,orn = self.get_pos_from_xml(AW)
      pos = list(pos)
      
      ground_truth[2] +=intial_r[1]/2 
   

      self.assertTrue(ground_truth==pos)
      #making sure the dimenstions are correct
      r  = self.get_r_from_xml(AW)

      self.assertTrue(intial_r==r)
     
      ###########grow the AW #############
      for i in range(10):
        AW.grow_AW()

      intial_r = AW.initial_r[:]
      #making sure the position is correct
      pos,orn = self.get_pos_from_xml(AW)
      pos = list(pos)
    
      self.assertTrue(ground_truth==pos)
      #making sure the dimenstions are correct
      r  = self.get_r_from_xml(AW)
   
      self.assertTrue(intial_r==r)
      self._p.disconnect()
   
    def test_AW_in_kuka_handlitGymEnv(self):
     
      
      env =  gym.make("kuka_handlit_multiprocess-v0",
				        render = True,
          
                adaptive_action_reperate= False,
                AW_mode=1,
                AW_setting={
                  "obs_mode": "palm",
                  "initial_r":[0.3,0.4],
                  "visualize_flag":True
                },
                reward_function_choice = 1,
                reward_obs_mode="palm_world",
                obs_mode="palm_world",
                random_start=None,

                action_mode ="jointControl",
                max_episode_steps =5000,
                actionRepeat =1		
	    )
      initial_r=  env.AW.initial_r[:]

      #############checking env reset when ee is outside AW ################                         
      robot_pos_outside_aw = [0]*23
      done = False
      #moving the robot outside AW   
      env.reset() 
                    
      for i in range(1000):
         obs,reward,done,_= env.step(robot_pos_outside_aw)
         if done:
           env.reset()
           break
      self.assertTrue(done)


      ############Checking AW grows after agent success =10 ############
      #faking agent success 
      for i in range(10):
        env.AW.grow_AW()

      new_r = env.AW.initial_r[:]

      #making sure the dimenstions are correct
      r  = self.get_r_from_xml(env.AW)
      print("r:: ",r)
      print("new_r:: ",new_r)
      self.assertTrue(new_r==r)
      self.assertTrue(new_r==[r+env.AW.grownth_increment for r in initial_r])
      # print("new_r::",new_r)
      # print("initial_r::",initial_r)
      env.close()    
    """
    def test_check_random_pos_is_with_in_AW(self):
      AW1_setting ={
        "target_xyz"        :[0,-0.3,0.765],
        "initial_r"         :[0.2,0.2],
        "target_dim"        :[0.05,0.05,0.05],
        "hand_length"       :0.5,
        "grownth_increment" :1,
        "obs_mode"          : "kuka"
      }

      if self._render:
        cid = self._p.connect(self._p.SHARED_MEMORY)
        if (cid<0):
           id = self._p.connect(self._p.GUI)
        self._p.resetDebugVisualizerCamera(1.3,180,-41,[0.52,-0.2,-0.33])
      else:
        self._p.connect(self._p.DIRECT)
      
      
      AW = AdaptiveWorkspace(pybullet_obj=self._p,target_xyz=AW1_setting["target_xyz"],initial_r=AW1_setting["initial_r"],
                             render =self._render,
                             
                             path = currentdir,
                             target_dim=AW1_setting["target_dim"],hand_length=AW1_setting["hand_length"],
                             grownth_increment=AW1_setting["grownth_increment"],obs_mode = AW1_setting["obs_mode"])


      print("AW.initial_r:: ",AW.initial_r)
      print("AW.z_bound:: ",AW.z_bound)
      new_xyz = AW.pick_random_ee_position_in_AW()["ee_xyz"]
      pos = ((new_xyz),(0,0,0,1))

      AW_check = AW.check_if_ee_outside_AW(pos)
      self.assertTrue(not AW_check)

   
    def test_check_ee_is_inside_AW_just_after_reset(self):
      
      env =  gym.make("kuka_handlit_multiprocess-v0",
				        render = True,
          
                adaptive_action_reperate= False,
                AW_mode=1,
                AW_setting={
                  "obs_mode": "palm",
                  "initial_r":[0.4,0.4],
                  "visualize_flag":True
                },
                reward_function_choice = 1,
                reward_obs_mode="palm_world",
                obs_mode="palm_world",
                random_start=None,

                action_mode ="jointControl",
                max_episode_steps =5000,
                actionRepeat =1		
	    )

      obs = env.reset()
      if "kuka" in env.obs_mode :
        state = p.getLinkState(env.controller.get_robot_id(),env.controller.kukaEndEffectorIndex)
        actualEndEffectorPos = state[0]
      # if observation is relative to palm
      if "palm" in env.obs_mode :
        state = p.getLinkState(env.controller.get_robot_id(),env.controller.get_palm_linkIndex())
        actualEndEffectorPos = state[0]

      AW_check = False if env.AW == None else  env.AW.check_if_ee_outside_AW(state)
      self.assertTrue(not AW_check)
    
    #utility
    def get_r_from_xml(self,AW):
      visual_info  = self._p.getVisualShapeData(AW.model_id)[0]
      print("visual_info:: ",visual_info)
      _,_,_,dim,_,_,_,_  =visual_info
     
      print("dim:: ",dim)

      return [dim[1],dim[0]]

    def get_pos_from_xml(self,AW):
      model_info = self._p.getBasePositionAndOrientation(AW.model_id)
      pos,orn = model_info
      orn = p.getEulerFromQuaternion(orn)
      print("model_info:: ",pos,orn)

      return pos,orn
              


if __name__ =='__main__':
    unittest.main()

"""
To run this  file:
1. be in same doirectory
2.python3 -m unittest test_AW
"""