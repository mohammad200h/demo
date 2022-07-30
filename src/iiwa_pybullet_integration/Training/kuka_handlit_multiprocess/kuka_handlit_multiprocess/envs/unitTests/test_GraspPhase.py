import unittest
import gym
import kuka_handlit_multiprocess
import pybullet as p

import math



class Env_action_function(unittest.TestCase):
    def __init__(self, *args, **kwargs):
        super(Env_action_function, self).__init__(*args, **kwargs)
        self.fingerTip_link_name = ["distal_FF","distal_MF","distal_RF","thdistal"] #this are joints between final link and one before it
        self.env_name = "kuka_handlit_multiprocess-v0"

   


    def test_graspPhase_False(self):

        env = gym.make("kuka_handlit_multiprocess-v0",
		render=True,
    	AW_mode=None ,
        graspPhaseRadius =0.2,
    	reward_function_choice=8,
    	reward_obs_mode="kuka",
    	AW_setting={"obs_mode": "palm",
    	"initial_r":[0.3,0.3]},
    	obs_mode="kuka_joint_hand_joint"
    
    	
	    )
        robot_initial_pose = env.reset().tolist()

        #Move hand to grasp phase region
        grasp_pose= {
            "j_name ":["hand_iiwa_joint_1","hand_iiwa_joint_2","hand_iiwa_joint_3","hand_iiwa_joint_4","hand_iiwa_joint_5","hand_iiwa_joint_6","hand_iiwa_joint_7"],
            "j_value":[1.6860340639329023, -1.3238625101622037, -0.8128499333730838, 2.4934081946564865e-05, -2.2259698573134945, 1.9555983691568983, 2.432166316539389]
        }
        kuka_grasp_pos = grasp_pose["j_value"]
        print("robot_initial_pose:: ",robot_initial_pose)
        print("kuka_grasp_pos:: ",kuka_grasp_pos)
        grasp_pose_commad = kuka_grasp_pos +robot_initial_pose[7:23]

        print("robot_initial_pose:: ",robot_initial_pose)
        print("grasp_pose_commad::  ",grasp_pose_commad)
        print("grasp_pose_commad::len  ",len(grasp_pose_commad))
        print("robot_initial_pose[7:23]::len  ",len(robot_initial_pose[7:23]))


        env.controller.reset(grasp_pose_commad)
        for i in range(10):
            env.step(grasp_pose_commad)

        print("isGraspPhase:: ",env.isGraspPhase)
        expectation = False
        result = env.isGraspPhase

        self.assertEqual(expectation,result)
    

    def test_graspPhase_True(self):
        
  
        env = gym.make("kuka_handlit_multiprocess-v0",
		render=True,
    	AW_mode=None ,
        graspPhaseRadius =0.4,
    	reward_function_choice=8,
    	reward_obs_mode="kuka",
    	AW_setting={"obs_mode": "palm",
    	"initial_r":[0.3,0.3]},
    	obs_mode="kuka_joint_hand_joint"
    
    	
	    )
        robot_initial_pose = env.reset().tolist()

        #Move hand to grasp phase region
        grasp_pose= {
            "j_name ":["hand_iiwa_joint_1","hand_iiwa_joint_2","hand_iiwa_joint_3","hand_iiwa_joint_4","hand_iiwa_joint_5","hand_iiwa_joint_6","hand_iiwa_joint_7"],
            "j_value":[1.6860340639329023, -1.3238625101622037, -0.8128499333730838, 2.4934081946564865e-05, -2.2259698573134945, 1.9555983691568983, 2.432166316539389]
        }
        kuka_grasp_pos = grasp_pose["j_value"]
        print("robot_initial_pose:: ",robot_initial_pose)
        print("kuka_grasp_pos:: ",kuka_grasp_pos)
        grasp_pose_commad = kuka_grasp_pos +robot_initial_pose[7:23]

        print("robot_initial_pose:: ",robot_initial_pose)
        print("grasp_pose_commad::  ",grasp_pose_commad)


 
        env.controller.reset(grasp_pose_commad)
        for i in range(10):
            env.step(grasp_pose_commad)

        print("isGraspPhase:: ",env.isGraspPhase)
        expectation = True
        result = env.isGraspPhase

        self.assertEqual(expectation,result)
    
   
    def test_hand_is_moving_when_in_graspPhase(self):
 
        env = gym.make("kuka_handlit_multiprocess-v0",
		render=True,
    	AW_mode=None ,
        graspPhaseRadius =0.4,
    	reward_function_choice=8,
    	reward_obs_mode="kuka",
    	AW_setting={"obs_mode": "palm",
    	"initial_r":[0.3,0.3]},
    	obs_mode="kuka_joint_hand_joint"
    
  
	    )
        robot_initial_pose = env.reset().tolist()

        #Move hand to grasp phase region
        grasp_pose= {
            "j_name ":["hand_iiwa_joint_1","hand_iiwa_joint_2","hand_iiwa_joint_3","hand_iiwa_joint_4","hand_iiwa_joint_5","hand_iiwa_joint_6","hand_iiwa_joint_7"],
            "j_value":[1.6860340639329023, -1.3238625101622037, -0.8128499333730838, 2.4934081946564865e-05, -2.2259698573134945, 1.9555983691568983, 2.432166316539389]
        }
        hand_pos= robot_initial_pose[7:23]
       
        kuka_grasp_pos = grasp_pose["j_value"]
        print("robot_initial_pose:: ",robot_initial_pose)
        print("kuka_grasp_pos:: ",kuka_grasp_pos)
        grasp_pose_commad = kuka_grasp_pos +robot_initial_pose[7:23]
      

        print("robot_initial_pose:: ",robot_initial_pose)
        print("grasp_pose_commad::  ",grasp_pose_commad)

        obs_before= env.controller.getObservation_joint()
        env.controller.reset(grasp_pose_commad)
        hand_pos[1] = 1
        grasp_pose_commad = kuka_grasp_pos +hand_pos
        for i in range(300):
            obs,_,_,_ = env.step(grasp_pose_commad)
        obs_after= env.controller.getObservation_joint()
        print("robot_initial_pose:: ",robot_initial_pose)
        print("obs:: ",obs)
        finger_obs_before =  obs_before[8]
        finger_obs_after  =  obs_after[8]
        diff = abs(finger_obs_after-finger_obs_before)
        print("isGraspPhase:: ",env.isGraspPhase)
        print("finger_obs_before:: ",finger_obs_before)
        print("finger_obs_after:: ",finger_obs_after)
        print("diff:: ",diff)
     

        self.assertTrue(diff>0.8)


    def test_hand_is_not_moving_when_in_graspPhase(self):

        env = gym.make("kuka_handlit_multiprocess-v0",
		render=True,
    	AW_mode=None ,
        graspPhaseRadius =0.2,
    	reward_function_choice=8,
    	reward_obs_mode="kuka",
    	AW_setting={"obs_mode": "palm",
    	"initial_r":[0.3,0.3]},
    	obs_mode="kuka_joint_hand_joint"
    
	    )
        robot_initial_pose = env.reset().tolist()

        #Move hand to grasp phase region
        grasp_pose= {
            "j_name ":["hand_iiwa_joint_1","hand_iiwa_joint_2","hand_iiwa_joint_3","hand_iiwa_joint_4","hand_iiwa_joint_5","hand_iiwa_joint_6","hand_iiwa_joint_7"],
            "j_value":[1.6860340639329023, -1.3238625101622037, -0.8128499333730838, 2.4934081946564865e-05, -2.2259698573134945, 1.9555983691568983, 2.432166316539389]
        }
        hand_pos= robot_initial_pose[7:23]
        hand_pos[1] = 1
        kuka_grasp_pos = grasp_pose["j_value"]
        print("robot_initial_pose:: ",robot_initial_pose)
        print("kuka_grasp_pos:: ",kuka_grasp_pos)
        grasp_pose_commad = kuka_grasp_pos +robot_initial_pose[7:23]

        print("robot_initial_pose:: ",robot_initial_pose)
        print("grasp_pose_commad::  ",grasp_pose_commad)

        obs_before= env.controller.getObservation_joint()
        env.controller.reset(grasp_pose_commad)
        grasp_pose_commad = kuka_grasp_pos +hand_pos
        for i in range(100):
            obs,_,_,_ = env.step(grasp_pose_commad)
        obs_after= env.controller.getObservation_joint()
        print("robot_initial_pose:: ",robot_initial_pose)
        print("obs:: ",obs)
        finger_obs_before =  obs_before[8]
        finger_obs_after  =  obs_after[8]
        diff = abs(finger_obs_after-finger_obs_before)
        print("isGraspPhase:: ",env.isGraspPhase)
        print("finger_obs_before:: ",finger_obs_before)
        print("finger_obs_after:: ",finger_obs_after)
        print("diff:: ",diff)
     

        self.assertFalse(diff>0.8)
    
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
2.python3 -m unittest test_GraspPhase
"""