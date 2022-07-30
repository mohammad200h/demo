import unittest
import gym
import kuka_handlit_multiprocess
import pybullet as p

import math



"""
EXPIREMENT_PATH ="/tmp/gym_env_setting"
"""

class Env_reward(unittest.TestCase):
    def __init__(self, *args, **kwargs):
        super(Env_reward, self).__init__(*args, **kwargs)
        self.fingerTip_link_name = ["distal_FF","distal_MF","distal_RF","thdistal"] #this are joints between final link and one before it
        self.env_name = "kuka_handlit_multiprocess-v0"

   

      
    def test_reward_function_choice_1_error(self):
        """
        calls reward_type_one(isXYZ = False)
        """

        # creating environment

        
       
        fail_obses= ["palm_world_xyz","kuka_world_xyz","kuka_xyz","palm_world_xyz","palm_xyz","kuka_pos_orn","palm_pos_orn"]
        for fail_obs in fail_obses:
    
            self.assertRaises(kuka_handlit_multiprocess.envs.kuka_handlitGymEnv.WrongRewardObs,gym.make,
                    "kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
                    action_mode = "jointControl",
                    obs_mode = "palm_world",
                    adaptive_action_reperate = None,
                    reward_obs_mode =fail_obs ,
                    reward_function_choice=1	
            )
         

  
  
    def test_reward_function_choice_1_NOerror(self):


        # creating environment
        env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
                    action_mode = "jointControl",
                    obs_mode = "kuka_pos_orn",
                    adaptive_action_reperate = None,
                    reward_function_choice=1			
	    )
       
        success_obses= ["palm_world","kuka_world","kuka","palm_world","palm"]
        for success_obs in success_obses:
             gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
                    action_mode = "jointControl",
                    obs_mode = "palm_world",
                    adaptive_action_reperate = None,
                    reward_obs_mode =success_obs,
                    reward_function_choice=1			
	    )

  
    #utility functions
    def get_fingerTips_linkIndex(self,env):
        fingerTips_linkIndex = []
        fingerTips_jointInfo = []
        fingerTip_joint_name_bytes = [i.encode(encoding='UTF-8',errors='strict') for i in self.fingerTip_link_name]

        # getting joints for the final link
        for i in fingerTip_joint_name_bytes:
          fingerTips_jointInfo.append(env._kuka_hand.jointInfo.searchBy(key="linkName",value = i)[0])

        #extracting joint index which equivalent to link index
        for i in fingerTips_jointInfo: 
          fingerTips_linkIndex.append(i["jointIndex"])  

        return fingerTips_linkIndex

    def get_palm_linkIndex(self,env):
        link_name ="palm_fake"

        link_name_encoded = link_name.encode(encoding='UTF-8',errors='strict')
        palm_link_jointInfo = env._kuka_hand.jointInfo.searchBy(key="linkName",value =link_name_encoded )[0]

        palm_link_Index  = palm_link_jointInfo["jointIndex"]

        return palm_link_Index

    def get_kuka_ee_linkIndex(self,env):
        link_name ="lbr_iiwa_link_7"

        link_name_encoded = link_name.encode(encoding='UTF-8',errors='strict')
        kuka_ee_link_jointInfo = env._kuka_hand.jointInfo.searchBy(key="linkName",value =link_name_encoded )[0]

        kuka_ee_link_Index     = kuka_ee_link_jointInfo["jointIndex"]

        return kuka_ee_link_Index
                  
    def kuka_obs(self,env,data_type="list",angle="euler"):
        obs_euler = []
        obs_quaternum = []
        state_dic_euler = {}
        state_dic_quaternum = {}
        kuka_ee_link_Index = self.get_kuka_ee_linkIndex(env)

        state = p.getLinkState(env._kuka_hand.kuka_handId,kuka_ee_link_Index)#mamad:returns endeffector info position orientation
        pos = list(state[0]) #mamad: linkWorldPosition
        orn = list(state[1]) #mamad: linkWorldOrientation
        euler = list(p.getEulerFromQuaternion(orn))

        obs_quaternum = pos+orn
        obs_euler = pos+euler

        state_dic_quaternum = {"pos":pos,"orn":orn}
        state_dic_euler = {"pos":pos,"orn":euler}

        if data_type=="list" and angle=="euler":
            return obs_euler
        elif data_type=="dic" and angle=="euler":
            return state_dic_euler
        elif data_type=="list" and angle=="quaternum":
            return obs_quaternum
        elif data_type=="dic" and angle=="quaternum":
            return state_dic_quaternum

    def fingers_obs(self,env,obs_type = "pos_orn",data_type="list",angle="euler"):

        fingerTipIndexs = self.get_fingerTips_linkIndex(env)
        state_dict_quatrenium = {}
        state_dict_euler = {}
        observation_pos_orn_quaternum = []
        observation_pos_orn_euler = []

        observation_pos = []
        observation_orn_quaternum = []
        observation_orn_euler = []

        counter = 0 
        #getting fingers tip position and orientation
        for index in fingerTipIndexs:
          state = p.getLinkState(env._kuka_hand.kuka_handId,index)#mamad:returns endeffector info position orientation
          pos = list(state[0]) #mamad: linkWorldPosition
          orn = list(state[1]) #mamad: linkWorldOrientation
          euler = list(p.getEulerFromQuaternion(orn))
          state_dict_quatrenium[self.fingerTip_link_name[counter]] = {"pos":pos,"orn":orn}
          state_dict_euler[self.fingerTip_link_name[counter]] = {"pos":pos,"orn":euler}
          observation_pos_orn_quaternum+=pos+orn
          observation_pos_orn_euler+=pos+euler
          observation_pos+=pos
          observation_orn_quaternum+=orn
          observation_orn_euler+=euler

          counter +=1

        if obs_type   ==  "pos_orn" and data_type=="list" and angle=="euler":
            return observation_pos_orn_euler
        elif obs_type ==  "pos_orn" and data_type=="list" and angle=="quaternum":
            return observation_pos_orn_quaternum
        elif obs_type ==  "pos_orn" and data_type=="dic" and angle=="euler":
            return state_dict_euler
        elif obs_type ==  "pos_orn" and data_type=="dic" and angle=="quaternum":
            return state_dict_quatrenium
        elif obs_type ==  "orn" and data_type=="list" and angle=="euler":
            return observation_orn_euler
        elif obs_type ==  "orn" and data_type=="list" and angle=="quaternum":
            return observation_orn_quaternum 
        else:
            return observation_pos
        
    def palm_obs(self,env,data_type="list",angle="euler"):
        obs_euler = []
        obs_quaternum = []
        state_dic_euler = {}
        state_dic_quaternum = {}

        Index = self.get_palm_linkIndex(env)
        state = p.getLinkState(env._kuka_hand.kuka_handId,Index)
            
        pos = list(state[0])
        orn = list(state[1])
        euler = list(p.getEulerFromQuaternion(orn))


        obs_quaternum = pos+orn
        obs_euler = pos+euler

        state_dic_quaternum = {"pos":pos,"orn":orn}
        state_dic_euler = {"pos":pos,"orn":euler}

        if data_type=="list" and angle=="euler":
            return obs_euler
        elif data_type=="dic" and angle=="euler":
            return state_dic_euler
        elif data_type=="list" and angle=="quaternum":
            return obs_quaternum
        elif data_type=="dic" and angle=="quaternum":
            return state_dic_quaternum

    def block_obs(self,env,data_type="list",angle="euler"):

        obs_euler = []
        obs_quaternum = []
        state_dic_euler = {}
        state_dic_quaternum = {}

        state = p.getBasePositionAndOrientation(env.cubeId)
        pos = list(state[0])
        orn = list(state[1])
        euler = list(p.getEulerFromQuaternion(orn))


        obs_quaternum = pos+orn
        obs_euler = pos+euler

        state_dic_quaternum = {"pos":pos,"orn":orn}
        state_dic_euler = {"pos":pos,"orn":euler}

        if data_type=="list" and angle=="euler":
            return obs_euler
        elif data_type=="dic" and angle=="euler":
            return state_dic_euler
        elif data_type=="list" and angle=="quaternum":
            return obs_quaternum
        elif data_type=="dic" and angle=="quaternum":
            return state_dic_quaternum



"""
To run this  file:
1. be in same doirectory
2.python3 -m unittest test_reward
"""