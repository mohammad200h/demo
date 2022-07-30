import unittest
import gym
import kuka_handlit_multiprocess
from kuka_handlit_multiprocess.envs.kuka_handlitGymEnv import AW_process
import pybullet as p

import math

class Env_action_function(unittest.TestCase):
    def __init__(self, *args, **kwargs):
        super(Env_action_function, self).__init__(*args, **kwargs)
        self.fingerTip_link_name = ["distal_FF","distal_MF","distal_RF","thdistal"] #this are joints between final link and one before it
        self.env_name = "kuka_handlit_multiprocess-v0"
      
    def test_action_function_jointControl(self):
        # creating environment
        env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
                    action_mode = "jointControl",
                    obs_mode = "palm",
                    adaptive_action_reperate = None				
	    )


        print("env.action_space.shape:: ")
        
        action_shape = env.action_space.shape

        self.assertEqual(action_shape,(23,))

    def test_action_function_jointControl_symitric(self):
        # creating environment
        env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
                    action_mode = "jointControl",
                    obs_mode = "palm",
                    symitric_action=True,
                    adaptive_action_reperate = None		
	    )
        
        
        action_shape = env.action_space.shape

        self.assertEqual(action_shape,(23,))

        # checking all the values in action high and low are between 1 and -1
        is_symitric = True
        for i in range(action_shape[0]):
            if env.action_space.low[i] != -1:
                is_symitric = False
            if env.action_space.high[i] != 1:
                is_symitric = False
        self.assertEqual(is_symitric,True)

        symitric_actions = env.action_space.sample()

        none_symitric_actions = env.action_obj.process_action(symitric_actions)
        
        env.reset()
        _,_,_,dic = env.step(symitric_actions)

        self.assertEqual(dic["command"],none_symitric_actions)

    def test_action_function_jointControl_hand_IK_kuka(self):
        env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
                    action_mode = "jointControl_hand_IK_kuka",
                    obs_mode = "palm",
                    adaptive_action_reperate= None
                  			
	    )
        

       
        action_shape = env.action_space.shape

        self.assertEqual(action_shape,(22,))

    def test_action_function_jointControl_hand_IK_kuka_symitric(self):
        # creating environment
        env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
                    action_mode = "jointControl_hand_IK_kuka",
                    obs_mode = "palm",
                    symitric_action=True,
                    adaptive_action_reperate = None			
	    )
  
        
       
        action_shape = env.action_space.shape

        self.assertEqual(action_shape,(22,))

        # checking all the values in action high and low are between 1 and -1
        is_symitric = True
        for i in range(action_shape[0]):
            if env.action_space.low[i] != -1:
                is_symitric = False
            if env.action_space.high[i] != 1:
                is_symitric = False
        self.assertEqual(is_symitric,True)

        symitric_actions = env.action_space.sample()

        none_symitric_actions = env.action_obj.process_action(symitric_actions)
        
        env.reset()
        _,_,_,dic = env.step(symitric_actions)

        self.assertEqual(dic["command"],none_symitric_actions)


    
"""
To run this  file:
1. be in same doirectory
2.python3 -m unittest test_action
"""