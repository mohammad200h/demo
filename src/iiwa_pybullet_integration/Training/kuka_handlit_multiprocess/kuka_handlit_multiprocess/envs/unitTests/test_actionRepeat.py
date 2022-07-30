import unittest
import gym
import kuka_handlit_multiprocess
import pybullet as p

import math

from kuka_handlit_multiprocess.envs.adaptiveActionRepeat.robotAdaptiveActionRepeat import RobotAdaptiveActionRepeat
from kuka_handlit_multiprocess.envs.decay import ActionRepeatDecay
import sys

class Env_action_function(unittest.TestCase):
  def __init__(self, *args, **kwargs):
        super(Env_action_function, self).__init__(*args, **kwargs)
        self.fingerTip_link_name = ["distal_FF","distal_MF","distal_RF","thdistal"] #this are joints between final link and one before it
        self.env_name = "kuka_handlit_multiprocess-v0"

   

  def test_parameters_are_passed_correctly(self):
      """
      we need to make sure the parameters that 
      are passed in Gym gets correctly to where it should 
      and is applied the right way
      First we are going to look at AAE and ingnore Decay
      """
      env = gym.make("kuka_handlit_multiprocess-v0",
		                  render=True,
    	                AW_mode=None ,
                      graspPhaseRadius =0.2,
    	                reward_function_choice=8,
    	                reward_obs_mode="kuka",
    	                AW_setting={
                        "obs_mode": "palm",
    	                  "initial_r":[0.3,0.3]
                      },
    	                obs_mode="kuka_joint_hand_joint",
                      timeStep =  1./1000.,
                      adaptive_action_reperate = {
                            "compute_AAR":True,
                            "decay":False,
                            "decay_mode":None,
                            "decay_param":{},
                            "training_steps":None,
                            "control_setting":{
                                               "kuka":{    #Theses are dummy values for testing                 
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
    	                
	                  )


      AAR = env.AAR

      self.assertTrue(AAR !=None)
      
      #################AAR KUKA###############
      #The valus tavel from a general AAR representing the hole robot
      #to kuka AAR which is specific to kuka
      ########################################
      expectation ={               
                      "force":200.0,
                      "maxVelocity":0.35,
                      "positionGain":0.3,
                      "velocityGain":1
                    }
     
      
      self.assertTrue(AAR.kuka_AAR.RAR._renders ==True)
      self.assertTrue(AAR.kuka_AAR.RAR.sim_step ==1./1000.)

      self.assertTrue(AAR.kuka_AAR.RAR.control_setting["force"] ==200)
      self.assertTrue(AAR.kuka_AAR.RAR.control_setting["maxVelocity"] ==0.35)
      self.assertTrue(AAR.kuka_AAR.RAR.control_setting["positionGain"] ==0.3)
      self.assertTrue(AAR.kuka_AAR.RAR.control_setting["velocityGain"] ==1)

      
      #checking parameters for each joint
      for key in AAR.kuka_AAR.RAR.test_log.keys():
        j =AAR.kuka_AAR.RAR.test_log[key]
        j_force = j["force"]
        j_maxVelocity = j["maxVelocity"]
        j_positionGain = j["positionGain"]
        j_velocityGain = j["velocityGain"]

        self.assertTrue(j_force==expectation["force"])
        self.assertTrue(j_maxVelocity==expectation["maxVelocity"])
        self.assertTrue(j_positionGain==expectation["positionGain"])
        self.assertTrue(j_velocityGain==expectation["velocityGain"])

      #################AAR HAND###############
      #########AAR HAND MF#######
      j_key_list= ["J4_MF","J3_MF","J2_MF","J1_MF"]
      MF_expectation ={  
                      "J4_MF":{
                          "force":6.0,
                          "maxVelocity":0.8,
                          "positionGain":1,
                          "velocityGain":1
                      },  
                      "J3_MF":{
                          "force":6.0,
                          "maxVelocity":0.8,
                          "positionGain":1,
                          "velocityGain":1
                      },  
                      "J2_MF":{
                          "force":6.0,
                          "maxVelocity":0.8,
                          "positionGain":1,
                          "velocityGain":1
                      },  
                      "J1_MF":{
                          "force":6.0,
                          "maxVelocity":0.8,
                          "positionGain":1,
                          "velocityGain":1
                      },  


      }
   
      self.assertTrue(AAR.mf_ARR.RAR._renders ==True)
      self.assertTrue(AAR.mf_ARR.RAR.sim_step ==1./1000.)


   
      for j_name in j_key_list:
        j =AAR.mf_ARR.RAR.test_log[j_name]
        j_force = j["force"]
        j_maxVelocity = j["maxVelocity"]
        j_positionGain = j["positionGain"]
        j_velocityGain = j["velocityGain"]

        self.assertTrue(j_force==MF_expectation[j_name]["force"])
        self.assertTrue(j_maxVelocity==MF_expectation[j_name]["maxVelocity"])
        self.assertTrue(j_positionGain==MF_expectation[j_name]["positionGain"])
        self.assertTrue(j_velocityGain==MF_expectation[j_name]["velocityGain"]) 

      

      #########AAR HAND TH#######
      j_key_list= ["THJ1","THJ2","THJ4","THJ5"]
      TH_expectation ={  
                      "THJ1":{
                          "force":8.0,
                          "maxVelocity":0.7,
                          "positionGain":1,
                          "velocityGain":1
                      },  
                      "THJ2":{
                          "force":8.0,
                          "maxVelocity":0.7,
                          "positionGain":1,
                          "velocityGain":1
                      },  
                      "THJ4":{
                          "force":8.0,
                          "maxVelocity":0.7,
                          "positionGain":1,
                          "velocityGain":1
                      },  
                      "THJ5":{
                          "force":8.0,
                          "maxVelocity":0.7,
                          "positionGain":1,
                          "velocityGain":1
                      },  


      }
    
      self.assertTrue(AAR.th_ARR.RAR._renders ==True)
      self.assertTrue(AAR.th_ARR.RAR.sim_step ==1./1000.)

  
      for j_name in j_key_list:
        j =AAR.th_ARR.RAR.test_log[j_name]
        j_force = j["force"]
        j_maxVelocity = j["maxVelocity"]
        j_positionGain = j["positionGain"]
        j_velocityGain = j["velocityGain"]

        self.assertTrue(j_force==TH_expectation[j_name]["force"])
        self.assertTrue(j_maxVelocity==TH_expectation[j_name]["maxVelocity"])
        self.assertTrue(j_positionGain==TH_expectation[j_name]["positionGain"])
        self.assertTrue(j_velocityGain==TH_expectation[j_name]["velocityGain"])  


  def test_AAR_get_function_graspPhase_Fasle(self):
        env = gym.make("kuka_handlit_multiprocess-v0",
		                render=True,
    	                AW_mode=None ,
                        graspPhaseRadius =0.2,
    	                reward_function_choice=8,
    	                reward_obs_mode="kuka",
    	                AW_setting={"obs_mode": "palm",
    	                "initial_r":[0.3,0.3]},
    	                obs_mode="kuka_joint_hand_joint",
                        timeStep =  1./600.,
                        adaptive_action_reperate = {
                            "compute_AAR":True,
                            "decay":False,
                            "decay_mode":None,
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
    	                
	    )
        robot_initial_pose = env.reset().tolist()
        hand_intial_pos= robot_initial_pose[7:23]
        kuka_initial_pos =robot_initial_pose[:7]
        kuka_command = kuka_initial_pos
        kuka_command[0] = 1
        command  = kuka_command+hand_intial_pos
        action_repeate,action_repeate_list = env.AAR.get(robot_initial_pose,command,is_grasp_phase=False)
        print("action_repeate:: ",action_repeate)
        print("action_repeate_list:: ",action_repeate_list)
        
        self.assertTrue(len(action_repeate_list)==7)

        for i in range(1,len(action_repeate_list)):
            self.assertTrue(action_repeate_list[i]==0)
   
  def test_AAR_get_function_graspPhase_True(self):
        env = gym.make("kuka_handlit_multiprocess-v0",
		                render=True,
    	                AW_mode=None ,
                        graspPhaseRadius =0.2,
    	                reward_function_choice=8,
    	                reward_obs_mode="kuka",
    	                AW_setting={"obs_mode": "palm",
    	                "initial_r":[0.3,0.3]},
    	                obs_mode="kuka_joint_hand_joint",
                        timeStep =  1./600.,
                        adaptive_action_reperate = {
                            "compute_AAR":True,
                            "decay":False,
                            "decay_mode":None,
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
    	                
	    )
        robot_initial_pose = env.reset().tolist()
        hand_intial_pos= robot_initial_pose[7:23]
        kuka_initial_pos =robot_initial_pose[:7]
        hand_command= hand_intial_pos
        hand_command[1] = 1
        command  = kuka_initial_pos+hand_command
        action_repeate,action_repeate_list = env.AAR.get(robot_initial_pose,command,is_grasp_phase=True)
        print("action_repeate:: ",action_repeate)
        print("action_repeate_list:: ",action_repeate_list)
        
        self.assertTrue(len(action_repeate_list)==23)

        for i in range(23):
            if i ==8:
                continue
            self.assertTrue(action_repeate_list[i]==0)


  def test_kuka_reaches_target_after_single_step(self): 
        env = gym.make("kuka_handlit_multiprocess-v0",
		                render=True,
    	                AW_mode=None ,
                      graspPhaseRadius =0.2,
    	                reward_function_choice=8,
    	                reward_obs_mode="kuka",
    	                AW_setting={"obs_mode": "palm",
    	                "initial_r":[0.3,0.3]},
    	                obs_mode="kuka_joint_hand_joint",
                        timeStep =  1./1000.,
                        adaptive_action_reperate = {
                            "compute_AAR":True,
                            "decay":False,
                            "decay_mode":None,
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
    	                
	    )
        robot_initial_pose = env.reset().tolist()
        hand_intial_pos= robot_initial_pose[7:23]
        kuka_initial_pos =robot_initial_pose[:7]
        kuka_command = kuka_initial_pos
        kuka_command[0] = 1
        command  = kuka_command+hand_intial_pos

        # action_repeate,action_repeate_list = env.AAR.get(robot_initial_pose,command,is_grasp_phase=False)
        # print("action_repeate:: ",action_repeate)
        # print("action_repeate_list:: ",action_repeate_list)

        obs,_,_,_=env.step(command)

        
        self.assertTrue(abs(obs[0]-kuka_command[0]<0.001))


  def test_kuka_reaches_target_after_single_step(self): 
        env = gym.make("kuka_handlit_multiprocess-v0",
		                render=True,
    	                AW_mode=None ,
                        graspPhaseRadius =0.4,
    	                reward_function_choice=8,
    	                reward_obs_mode="kuka",
    	                AW_setting={"obs_mode": "palm",
    	                "initial_r":[0.3,0.3]},
    	                obs_mode="kuka_joint_hand_joint",
                        timeStep =  1./1000.,
                        adaptive_action_reperate = {
                            "compute_AAR":True,
                            "decay":False,
                            "decay_mode":None,
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
                        }
    	                
	    )
        robot_initial_pose = env.reset().tolist()
        hand_intial_pos= robot_initial_pose[7:23]
        kuka_initial_pos =robot_initial_pose[:7]
 

        #####Moving the hand to grasp position####
        grasp_pose= {
            "j_name ":["hand_iiwa_joint_1","hand_iiwa_joint_2","hand_iiwa_joint_3","hand_iiwa_joint_4","hand_iiwa_joint_5","hand_iiwa_joint_6","hand_iiwa_joint_7"],
            "j_value":[1.6860340639329023, -1.3238625101622037, -0.8128499333730838, 2.4934081946564865e-05, -2.2259698573134945, 1.9555983691568983, 2.432166316539389]
        }
        kuka_grasp_pos = grasp_pose["j_value"]
        grasp_pose_commad = kuka_grasp_pos +hand_intial_pos
        print("grasp_pose_commad:: ",grasp_pose_commad)

        
        
        env.controller.reset(grasp_pose_commad)

        
        ##########Testing The hand###########
            


        # action_repeate,action_repeate_list = env.AAR.get(robot_initial_pose,command,is_grasp_phase=False)
        # print("action_repeate:: ",action_repeate)
        # print("action_repeate_list:: ",action_repeate_list)

        obs,_,_,_=env.step(grasp_pose_commad)
        self.assertTrue(env.isGraspPhase)
      
        self.assertTrue(abs(obs[8]-hand_intial_pos[1]<0.001))


  def test_update_decay_on_success_AND_get_decay_on_success(self):
        actionRepeatDecay = ActionRepeatDecay(total_training_steps =1000,
                                                   decay_mode = "stair_case",
                                                   param = {
                                                     "success_threshold":10,
                                                     "decay_portion":0.1
                                                   }
                                              )
        current_action_repeate =1000
      
        for i in range(10):
          actionRepeatDecay.update_decay_on_success()
          if i==4: #5
            self.assertTrue(actionRepeatDecay._success_record["count"]==5)

        adjusted_action_repeate = actionRepeatDecay.get_decay_on_success(current_action_repeate)

       
        self.assertTrue(actionRepeatDecay._success_record["count"]==0)
        self.assertTrue(actionRepeatDecay._success_record["current_decay"]==0.9) 
        self.assertTrue(adjusted_action_repeate==900)

        
        for i in range(9*10):
           actionRepeatDecay.update_decay_on_success()


        adjusted_action_repeate = actionRepeatDecay.get_decay_on_success(current_action_repeate)

        self.assertTrue(actionRepeatDecay._success_record["count"]==0)
        self.assertTrue(actionRepeatDecay._success_record["current_decay"]==0) 
        self.assertTrue(adjusted_action_repeate==1)

 
  ##utility functions
  def degree_to_radian(self,degree):
        raidan = degree/180*math.pi
        # print("degree::",degree)
        # print("raidan::",raidan)
        return raidan


if __name__ =='__main__':
    unittest.main()

"""
To run this  file:
1. be in same doirectory
2.python3 -m unittest test_actionRepeat
"""