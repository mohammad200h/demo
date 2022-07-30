import unittest
import gym
from  kuka_handlitGymEnv import Kuka_HandlitGymEnv
import pybullet as p
from mamad_util import JointInfo
import math
from decay import ActionRepeatDecay

class Decay(unittest.TestCase):
    def __init__(self, *args, **kwargs):
        super(Decay, self).__init__(*args, **kwargs)
        self.actionRepeatDecay = ActionRepeatDecay(total_training_steps=10000,
                                                   decay_mode = "stair_case",
                                                   param={"decay_portion":10}#we set decay portion to 10%
                                                    )
      
    def test_stair_case_decay(self):
        # we test the decay in three different stages of training
        training_stages_dic={
            "1":{#the training is in early stages less than 10% of full training steps
                "t_step":800,
                "action_repeat":1000,
                "expected_decayed_action_repeat":1000
                },
            "2":{# 10% of training has progressed
                "t_step":1000,
                "action_repeat":1000,
                "expected_decayed_action_repeat":900
                },

            "3":{# 50% of training has progressed
                "t_step":5000,
                "action_repeat":1000,
                "expected_decayed_action_repeat":500
                },
            "4":{# we are somewhere between 50% and 60%
                "t_step":5200,
                "action_repeat":1000,
                "expected_decayed_action_repeat":500
                }
        }

        for i in range(4):
            training_stage =str(i+1)
            # print("\n\n")
            # print("training_stage:: ",training_stage)
            ts_data =training_stages_dic[training_stage] 
            decayed_action_repeat = self.actionRepeatDecay.stair_case(ts_data["action_repeat"],ts_data["t_step"])
            
            self.assertEqual(decayed_action_repeat,training_stages_dic[training_stage]["expected_decayed_action_repeat"])

if __name__ =='__main__':
    unittest.main()

    
"""
To run this  file:
1. be in same doirectory
2.python3 -m unittest test_decay
"""