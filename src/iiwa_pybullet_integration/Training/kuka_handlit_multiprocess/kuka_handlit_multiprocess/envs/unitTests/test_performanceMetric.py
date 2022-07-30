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



class performmanceMetric_Test(unittest.TestCase):
    def __init__(self, *args, **kwargs):
        super(performmanceMetric_Test, self).__init__(*args, **kwargs)
        
        self.env_name = "kuka_handlit_multiprocess-v0"
        self._render = False
        self._p = p
  
    def test_calculate_ave_performance(self):
      # *************input*************
      
      episdoe_perofrmance_log_one = {
          "best_performance_during_episode":{
              "dist":{
                "palm":1,
                "ff":1,
                "mf":1,
                "rf":1,
                "th":1
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":1,
                "ff":1,
                "mf":1,
                "rf":1,
                "th":1
              },
              "touch":{
                "ff":False,
                "mf":False,
                "rf":False,
                "th":False
              },
              "collision":False
          }
      }
      
      episdoe_perofrmance_log_two = {
          "best_performance_during_episode":{
              "dist":{
                "palm":2,
                "ff":2,
                "mf":2,
                "rf":2,
                "th":2
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":2,
                "ff":2,
                "mf":2,
                "rf":2,
                "th":2
              },
              "touch":{
                "ff":True,
                "mf":True,
                "rf":True,
                "th":True
              },
              "collision":True
          }
      }

      env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
          action_mode = "jointControl",
          obs_mode = "palm",
          adaptive_action_reperate = None,
          record_performance = False			
	    )

      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_one)
      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_two)
      
      # ************eexpected output***************
      ëxpected_ave = {
        "palm":1.5,
        "ff":1.5,
        "mf":1.5,
        "rf":1.5,
        "th":1.5,
      }

      out_ave_best_performance_during_episode = env.perfromanceMeteric.calculate_ave_performance("best_performance_during_episode")
      out_ave_performance_at_end_of_episode = env.perfromanceMeteric.calculate_ave_performance("performance_at_end_of_episode")
      
      for key in ëxpected_ave.keys():
        self.assertEqual(ëxpected_ave[key],out_ave_best_performance_during_episode[key])
      for key in ëxpected_ave.keys():
        self.assertEqual(ëxpected_ave[key],out_ave_performance_at_end_of_episode[key])
     
  
    def test_calculate_percentage_of_fingers_touching(self):
      # *************input*************
      
      episdoe_perofrmance_log_one = {
          "best_performance_during_episode":{
              "dist":{
                "palm":1,
                "ff":1,
                "mf":1,
                "rf":1,
                "th":1
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":1,
                "ff":1,
                "mf":1,
                "rf":1,
                "th":1
              },
              "touch":{
                "ff":False,
                "mf":False,
                "rf":False,
                "th":False
              },
              "collision":False
          }
      }
      
      episdoe_perofrmance_log_two = {
          "best_performance_during_episode":{
              "dist":{
                "palm":2,
                "ff":2,
                "mf":2,
                "rf":2,
                "th":2
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":2,
                "ff":2,
                "mf":2,
                "rf":2,
                "th":2
              },
              "touch":{
                "ff":True,
                "mf":True,
                "rf":True,
                "th":True
              },
              "collision":True
          }
      }
      episdoe_perofrmance_log_three = {
          "best_performance_during_episode":{
              "dist":{
                "palm":3,
                "ff":3,
                "mf":3,
                "rf":3,
                "th":3
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":3,
                "ff":3,
                "mf":3,
                "rf":3,
                "th":3
              },
              "touch":{
                "ff":True,
                "mf":True,
                "rf":True,
                "th":True
              },
              "collision":True
          }
      }
      episdoe_perofrmance_log_four = {
          "best_performance_during_episode":{
              "dist":{
                "palm":3,
                "ff":3,
                "mf":3,
                "rf":3,
                "th":3
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":3,
                "ff":3,
                "mf":3,
                "rf":3,
                "th":3
              },
              "touch":{
                "ff":True,
                "mf":True,
                "rf":True,
                "th":True
              },
              "collision":True
          }
      }
      env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
          action_mode = "jointControl",
          obs_mode = "palm",
          adaptive_action_reperate = None,
          record_performance = False			
	    )

      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_one)
      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_two)
      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_three)
      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_four)
      
      # ************eexpected output***************
      ëxpected_percentage = {
  
        "ff":75.0,
        "mf":75.0,
        "rf":75.0,
        "th":75.0,
      }

      finger_touch_percentage = env.perfromanceMeteric.calculate_percentage_of_fingers_touching()

      for key in ëxpected_percentage.keys():
        self.assertEqual(ëxpected_percentage[key],finger_touch_percentage[key]) 
      
    def test_claculate_percentage_of_collision_with_table(self):
      # *************input*************
      
      episdoe_perofrmance_log_one = {
          "best_performance_during_episode":{
              "dist":{
                "palm":1,
                "ff":1,
                "mf":1,
                "rf":1,
                "th":1
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":1,
                "ff":1,
                "mf":1,
                "rf":1,
                "th":1
              },
              "touch":{
                "ff":False,
                "mf":False,
                "rf":False,
                "th":False
              },
              "collision":False
          }
      }
      
      episdoe_perofrmance_log_two = {
          "best_performance_during_episode":{
              "dist":{
                "palm":2,
                "ff":2,
                "mf":2,
                "rf":2,
                "th":2
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":2,
                "ff":2,
                "mf":2,
                "rf":2,
                "th":2
              },
              "touch":{
                "ff":True,
                "mf":True,
                "rf":True,
                "th":True
              },
              "collision":True
          }
      }
      episdoe_perofrmance_log_three = {
          "best_performance_during_episode":{
              "dist":{
                "palm":3,
                "ff":3,
                "mf":3,
                "rf":3,
                "th":3
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":3,
                "ff":3,
                "mf":3,
                "rf":3,
                "th":3
              },
              "touch":{
                "ff":True,
                "mf":True,
                "rf":True,
                "th":True
              },
              "collision":True
          }
      }
      episdoe_perofrmance_log_four = {
          "best_performance_during_episode":{
              "dist":{
                "palm":3,
                "ff":3,
                "mf":3,
                "rf":3,
                "th":3
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":3,
                "ff":3,
                "mf":3,
                "rf":3,
                "th":3
              },
              "touch":{
                "ff":True,
                "mf":True,
                "rf":True,
                "th":True
              },
              "collision":True
          }
      }
      env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
          action_mode = "jointControl",
          obs_mode = "palm",
          adaptive_action_reperate = None,
          record_performance = False			
	    )

      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_one)
      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_two)
      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_three)
      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_four)
      
      # ************eexpected output***************
      ëxpected_percentage = 75.0
  
        

      collision_percentage = env.perfromanceMeteric.claculate_percentage_of_collision_with_table()


      self.assertEqual(ëxpected_percentage,collision_percentage) 
              
    def test_Is_Perofrmance_better_than_last_step(self):
        
        env =  gym.make("kuka_handlit_multiprocess-v0",
			  		render=False,
			  		timeStep=1/1000,
            action_mode = "jointControl",
            obs_mode = "palm",
            adaptive_action_reperate = None,
            record_performance = False			
	      )


        episdoe_perofrmance_log_good = {
          "best_performance_during_episode":{
              "dist":{
                "palm":1,
                "ff":1,
                "mf":1,
                "rf":1,
                "th":1
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":1,
                "ff":1,
                "mf":1,
                "rf":1,
                "th":1
              },
              "touch":{
                "ff":False,
                "mf":False,
                "rf":False,
                "th":False
              },
              "collision":False
          }
        }
      
        episdoe_perofrmance_log_bad = {
          "best_performance_during_episode":{
              "dist":{
                "palm":2,
                "ff":2,
                "mf":2,
                "rf":2,
                "th":2
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":2,
                "ff":2,
                "mf":2,
                "rf":2,
                "th":2
              },
              "touch":{
                "ff":True,
                "mf":True,
                "rf":True,
                "th":True
              },
              "collision":True
          }
        }

        # ************False***************
        env.perfromanceMeteric.episdoe_perofrmance_log["best_performance_during_episode"]["dist"] = episdoe_perofrmance_log_good["best_performance_during_episode"]["dist"]
        state = [None]*5
        
        state[0] = episdoe_perofrmance_log_bad["best_performance_during_episode"]["dist"]["palm"]
        state[1] = episdoe_perofrmance_log_bad["best_performance_during_episode"]["dist"]["ff"]
        state[2] = episdoe_perofrmance_log_bad["best_performance_during_episode"]["dist"]["mf"]
        state[3] = episdoe_perofrmance_log_bad["best_performance_during_episode"]["dist"]["rf"]
        state[4] = episdoe_perofrmance_log_bad["best_performance_during_episode"]["dist"]["th"]

        expected_flag = False
        out_flag = env.perfromanceMeteric.Is_Perofrmance_better_than_last_step(state) 

        self.assertEqual(out_flag,expected_flag) 

        # ************True***************
        env.perfromanceMeteric.episdoe_perofrmance_log["best_performance_during_episode"]["dist"] = episdoe_perofrmance_log_bad["best_performance_during_episode"]["dist"]
        state = [None]*5
        
        state[0] = episdoe_perofrmance_log_good["best_performance_during_episode"]["dist"]["palm"]
        state[1] = episdoe_perofrmance_log_good["best_performance_during_episode"]["dist"]["ff"]
        state[2] = episdoe_perofrmance_log_good["best_performance_during_episode"]["dist"]["mf"]
        state[3] = episdoe_perofrmance_log_good["best_performance_during_episode"]["dist"]["rf"]
        state[4] = episdoe_perofrmance_log_good["best_performance_during_episode"]["dist"]["th"]

        expected_flag = True
        out_flag = env.perfromanceMeteric.Is_Perofrmance_better_than_last_step(state) 

        self.assertEqual(out_flag,expected_flag) 

    def test_find_best_performance_during_episode(self):
      
      env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
          action_mode = "jointControl",
          obs_mode = "palm",
          adaptive_action_reperate = None,
          record_performance = False			
	    )
      
      # *************input*************
      episdoe_perofrmance_log_one = {
          "best_performance_during_episode":{
              "dist":{
                "palm":1,
                "ff":1,
                "mf":1,
                "rf":1,
                "th":1
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":1,
                "ff":1,
                "mf":1,
                "rf":1,
                "th":1
              },
              "touch":{
                "ff":False,
                "mf":False,
                "rf":False,
                "th":False
              },
              "collision":False
          }
      }
      
      episdoe_perofrmance_log_two = {
          "best_performance_during_episode":{
              "dist":{
                "palm":2,
                "ff":2,
                "mf":2,
                "rf":2,
                "th":2
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":2,
                "ff":2,
                "mf":2,
                "rf":2,
                "th":2
              },
              "touch":{
                "ff":True,
                "mf":True,
                "rf":True,
                "th":True
              },
              "collision":True
          }
      }
      episdoe_perofrmance_log_three = {
          "best_performance_during_episode":{
              "dist":{
                "palm":3,
                "ff":3,
                "mf":3,
                "rf":3,
                "th":3
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":3,
                "ff":3,
                "mf":3,
                "rf":3,
                "th":3
              },
              "touch":{
                "ff":True,
                "mf":True,
                "rf":True,
                "th":True
              },
              "collision":True
          }
      }
      episdoe_perofrmance_log_four = {
          "best_performance_during_episode":{
              "dist":{
                "palm":4,
                "ff":4,
                "mf":4,
                "rf":4,
                "th":4
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":4,
                "ff":4,
                "mf":4,
                "rf":4,
                "th":4
              },
              "touch":{
                "ff":True,
                "mf":True,
                "rf":True,
                "th":True
              },
              "collision":True
          }
      }


      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_one)
      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_two)
      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_three)
      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_four)
     # ************eexpected output***************
      expected =episdoe_perofrmance_log_one["best_performance_during_episode"]["dist"]
      
      out = env.perfromanceMeteric.find_best_performance_during_episode()["dist"]

      self.assertEqual(expected,out)

    def test_find_best_performance_at_end_episode_touch_flag(self):
      
      env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
          action_mode = "jointControl",
          obs_mode = "palm",
          adaptive_action_reperate = None,
          record_performance = False			
	    )
      
      # *************input*************
      episdoe_perofrmance_log_one = {
          "best_performance_during_episode":{
              "dist":{
                "palm":1,
                "ff":1,
                "mf":1,
                "rf":1,
                "th":1
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":1,
                "ff":1,
                "mf":1,
                "rf":1,
                "th":1
              },
              "touch":{
                "ff":False,
                "mf":False,
                "rf":False,
                "th":False
              },
              "collision":False
          }
      }
      
      episdoe_perofrmance_log_two = {
          "best_performance_during_episode":{
              "dist":{
                "palm":2,
                "ff":2,
                "mf":2,
                "rf":2,
                "th":2
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":2,
                "ff":2,
                "mf":2,
                "rf":2,
                "th":2
              },
              "touch":{
                "ff":True,
                "mf":True,
                "rf":True,
                "th":True
              },
              "collision":True
          }
      }
      episdoe_perofrmance_log_three = {
          "best_performance_during_episode":{
              "dist":{
                "palm":3,
                "ff":3,
                "mf":3,
                "rf":3,
                "th":3
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":3,
                "ff":3,
                "mf":3,
                "rf":3,
                "th":3
              },
              "touch":{
                "ff":True,
                "mf":True,
                "rf":True,
                "th":True
              },
              "collision":True
          }
      }
      episdoe_perofrmance_log_four = {
          "best_performance_during_episode":{
              "dist":{
                "palm":4,
                "ff":4,
                "mf":4,
                "rf":4,
                "th":4
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":4,
                "ff":4,
                "mf":4,
                "rf":4,
                "th":4
              },
              "touch":{
                "ff":True,
                "mf":True,
                "rf":True,
                "th":True
              },
              "collision":True
          }
      }


      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_one)
      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_two)
      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_three)
      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_four)
      # ************eexpected output***************
      """
      Fingers touching is more important than reducing the distance
      """
      expected =episdoe_perofrmance_log_two["best_performance_during_episode"]["dist"]
      
      out = env.perfromanceMeteric.find_best_performance_at_end_episode()["dist"]

      self.assertEqual(expected,out)

    def test_find_best_performance_at_end_episode_distance(self):
      
      env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
          action_mode = "jointControl",
          obs_mode = "palm",
          adaptive_action_reperate = None,
          record_performance = False			
	    )
      
      # *************input*************
      episdoe_perofrmance_log_one = {
          "best_performance_during_episode":{
              "dist":{
                "palm":1,
                "ff":1,
                "mf":1,
                "rf":1,
                "th":1
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":1,
                "ff":1,
                "mf":1,
                "rf":1,
                "th":1
              },
              "touch":{
                "ff":False,
                "mf":False,
                "rf":False,
                "th":False
              },
              "collision":False
          }
      }
      
      episdoe_perofrmance_log_two = {
          "best_performance_during_episode":{
              "dist":{
                "palm":2,
                "ff":2,
                "mf":2,
                "rf":2,
                "th":2
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":2,
                "ff":2,
                "mf":2,
                "rf":2,
                "th":2
              },
              "touch":{
                "ff":False,
                "mf":False,
                "rf":False,
                "th":False
              },
              "collision":False
          }
      }
      episdoe_perofrmance_log_three = {
          "best_performance_during_episode":{
              "dist":{
                "palm":3,
                "ff":3,
                "mf":3,
                "rf":3,
                "th":3
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":3,
                "ff":3,
                "mf":3,
                "rf":3,
                "th":3
              },
              "touch":{
                "ff":False,
                "mf":False,
                "rf":False,
                "th":False
              },
              "collision":False
          }
      }
      episdoe_perofrmance_log_four = {
          "best_performance_during_episode":{
              "dist":{
                "palm":4,
                "ff":4,
                "mf":4,
                "rf":4,
                "th":4
              },
              "step":0
          },
          "performance_at_end_of_episode":{
              "dist":{
                "palm":4,
                "ff":4,
                "mf":4,
                "rf":4,
                "th":4
              },
              "touch":{
                "ff":False,
                "mf":False,
                "rf":False,
                "th":False
              },
              "collision":False
          }
      }


      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_one)
      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_two)
      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_three)
      env.perfromanceMeteric.perofrmance_log["episdoes"].append(episdoe_perofrmance_log_four)
      # ************eexpected output***************
      """
      checking distance
      """
      expected =episdoe_perofrmance_log_one["best_performance_during_episode"]["dist"]
      
      out = env.perfromanceMeteric.find_best_performance_at_end_episode()["dist"]

      self.assertEqual(expected,out)

if __name__ =='__main__':
    unittest.main()

"""
To run this  file:
1. be in same doirectory
2. python3 -m unittest test_performanceMetric
"""