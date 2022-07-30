import unittest
import gym
import kuka_handlit_multiprocess
import pybullet as p
# from kuka_handlit_multiprocess.envs.mamad_util import JointInfo

import math

class Env_getExtendedObservation(unittest.TestCase):
    def __init__(self, *args, **kwargs):
        super(Env_getExtendedObservation, self).__init__(*args, **kwargs)
        self.fingerTip_link_name = ["distal_FF","distal_MF","distal_RF","thdistal"] #this are joints between final link and one before it
        self.env_name = "kuka_handlit_multiprocess-v0"

   

      
    def test_obs_pos_and_orn_relative_to_world_kuka(self):
        """
        angles are in euler
        return [kuka_pos,kuka_orn,Block_pos,Block_orn,FF_pos,MF_pos,RF_pos,TH_pos]
        """
        # creating environment
        env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
                    action_mode = "jointControl",
                    obs_mode = "kuka_pos_orn",
                    adaptive_action_reperate = None,
                    reward_function_choice=1			
	    )
       
   
        
        env.reset()

        kuka_state  = self.kuka_obs(env,data_type="dic",angle="euler")
        block_state = self.block_obs(env,data_type="dic",angle="euler")
        fingers_state = self.fingers_obs(env,obs_type = "pos",data_type="list",angle=None)
        ground_truth = kuka_state["pos"]+kuka_state["orn"]+block_state["pos"]+block_state["orn"]+fingers_state
        
       

        test = env.getExtendedObservation()


        self.assertEqual(test,ground_truth)
        env.close()
        
    
    def test_obs_pos_and_orn_relative_to_world_palm(self):
        """
        angles are in euler
        return [palm_pos,palm_orn,Block_pos,Block_orn,FF_pos,MF_pos,RF_pos,TH_pos]
        """

        # creating environment

        env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
                    action_mode = "jointControl",
                    obs_mode = "palm_pos_orn",
                    adaptive_action_reperate = None,
                    reward_function_choice=1			
	    )

        env.reset()

        palm_state  = self.palm_obs(env,data_type="dic",angle="euler")
        block_state = self.block_obs(env,data_type="dic",angle="euler")
        fingers_state = self.fingers_obs(env,obs_type = "pos",data_type="list",angle=None)
        ground_truth = palm_state["pos"]+palm_state["orn"]+block_state["pos"]+block_state["orn"]+fingers_state
 
        test = env.getExtendedObservation()

        # print("ground_truth:: ",ground_truth)
        # print("test:: ",test)
        self.assertEqual(test,ground_truth)
        env.close()


    def test_obs_distAndOrn_relativeToKukaAndFingers_true(self):
        """
        worldFrame=True
        all the outputs are relative to world frame
        outout:[kuka_ee_dsit,
                FF_dist,
                MF_dist,
                RF_dist,
                TH_dist,
                block_orn,
                kuka_ee_orn
                ]
        """
        # creating environment
        env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
                    action_mode = "jointControl",
                    obs_mode = "kuka_world",
                    adaptive_action_reperate = None,
                    reward_function_choice=1			
	    )

        env.reset()

        kuka_state  = self.kuka_obs(env,data_type="dic",angle="euler")
        block_state = self.block_obs(env,data_type="dic",angle="euler")
        fingers_state = self.fingers_obs(env,obs_type = "pos",data_type="list",angle=None)
      
        #calculating distances
        fingers_dist_worldFrame =[]
        kuka_pos  = kuka_state["pos"]
        kuka_orn  = kuka_state["orn"]
        block_pos = block_state["pos"]
        block_orn = block_state["orn"]  

        #dist between kuka ee and block
        kuka_dist_x = abs(block_pos[0] - kuka_pos[0])
        kuka_dist_y = abs(block_pos[1] - kuka_pos[1])
        kuka_dist_z = abs(block_pos[2] - kuka_pos[2])

        kuka_dist = math.sqrt(kuka_dist_x**2+ kuka_dist_y**2+ kuka_dist_z**2)

        state_counter = 0
        for linkName in self.get_fingerTips_linkIndex(env):
            state_counter +=1
            fingerState = fingers_state[3*(state_counter-1):3*state_counter]#xyz 
            finger_pos = fingerState
  
            #Distance of finger_ee to obj in world frame
            finger_dist_x = block_pos[0] - finger_pos[0]
            finger_dist_y = block_pos[1] - finger_pos[1]
            finger_dist_z = block_pos[2] - finger_pos[2]

            finger_dist = math.sqrt(finger_dist_x**2+ finger_dist_y**2+ finger_dist_z**2)
            fingers_dist_worldFrame.append(finger_dist)

        robot_dist_worldFrame = [kuka_dist]+fingers_dist_worldFrame  
        obs_worldFrame = robot_dist_worldFrame+block_orn+kuka_orn
        
        ground_truth = obs_worldFrame

        test = env.getExtendedObservation()
        self.assertEqual(test,ground_truth)
        env.close()

    
    def test_obs_distAndOrn_relativeToKukaAndFingers_false(self):
        """
        worldFrame=False
        outout:[blockPosInKukaFrame,
        FF_dist_FFFrame,
        MF_dist_MFFrame,
        RF_dist_RFFrame,
        TH_dist_THFrame,
        block_orn_kuka_eeFrame,
        ]
        """
        fingers_dist_fingerFrame =[]

        # creating environment
        env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
                    action_mode = "jointControl",
                    obs_mode = "kuka",
                    adaptive_action_reperate = None,
                    reward_function_choice=1			
	    )

        env.reset()

        kuka_state  = self.kuka_obs(env,data_type="dic",angle="quaternum")
        block_state = self.block_obs(env,data_type="dic",angle="quaternum")
        fingers_state = self.fingers_obs(env,obs_type = "pos_orn",data_type="list",angle="quaternum")

        kuka_pos = kuka_state["pos"]
        kuka_orn = kuka_state["orn"]

        block_pos = block_state["pos"]
        block_orn = block_state["orn"]
        #getting block in kuka frame
        invKuka_eePos,invKuka_eeOrn = p.invertTransform(kuka_pos,kuka_orn)
        blockPosInkuka_EE,blockOrnInkuka_EE = p.multiplyTransforms(invKuka_eePos,invKuka_eeOrn,block_pos,block_orn)
  
        blockPosInKukaFrame = math.sqrt(blockPosInkuka_EE[0]**2+ blockPosInkuka_EE[1]**2+blockPosInkuka_EE[2]**2)
        blockOrnInkuka_EE = list(p.getEulerFromQuaternion(blockOrnInkuka_EE))

        #Fingers in kuka frame
        state_counter = 0
        for linkName in self.get_fingerTips_linkIndex(env):
            state_counter +=1
            fingerState = fingers_state[7*(state_counter-1):7*state_counter]#xyz 
            finger_pos = fingerState[:3]
            finger_orn = fingerState[3:]

            invfingertipPos, invfingertipOrn = p.invertTransform(finger_pos,finger_orn)
            blockPosInfingertip_EE, blockOrnInfingertip_EE = p.multiplyTransforms(invfingertipPos,invfingertipOrn,block_pos,block_orn)

            # size of vector for finger_ee to obj in world frame
            finger_dist_fingerFrame = math.sqrt(blockPosInfingertip_EE[0]**2+ blockPosInfingertip_EE[1]**2+blockPosInfingertip_EE[2]**2)

            fingers_dist_fingerFrame.append(finger_dist_fingerFrame)

        robot_dist_kukaFrame =  [blockPosInKukaFrame ]+fingers_dist_fingerFrame
        obs_in_kukaFrame = robot_dist_kukaFrame+blockOrnInkuka_EE
        
        ground_truth = obs_in_kukaFrame

        test = env.getExtendedObservation()
        self.assertEqual(test,ground_truth)
    
     
    def test_obs_distAndOrn_relativeToKukaAndFingers_xyz_true(self):
        """
        all the outputs are relative to world frame
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
        """
        # creating environment
        env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
                    action_mode = "jointControl",
                    obs_mode = "kuka_world_xyz",
                    adaptive_action_reperate = None,
                    reward_function_choice=1			
	    )

        env.reset()

        kuka_state  = self.kuka_obs(env,data_type="dic",angle="euler")
        block_state = self.block_obs(env,data_type="dic",angle="euler")
        fingers_state = self.fingers_obs(env,obs_type = "pos",data_type="list",angle=None)
      
        #calculating distances
        fingers_dist_worldFrame =[]
        kuka_pos  = kuka_state["pos"]
        kuka_orn  = kuka_state["orn"]
        block_pos = block_state["pos"]
        block_orn = block_state["orn"]  

        #dist between kuka ee and block
        kuka_dist_x = abs(block_pos[0] - kuka_pos[0])
        kuka_dist_y = abs(block_pos[1] - kuka_pos[1])
        kuka_dist_z = abs(block_pos[2] - kuka_pos[2])

        kuka_dist = [kuka_dist_x, kuka_dist_y, kuka_dist_z]
        kuka_dist = [abs(i) for i in kuka_dist]


        state_counter = 0
        for linkName in self.get_fingerTips_linkIndex(env):
            state_counter +=1
            fingerState = fingers_state[3*(state_counter-1):3*state_counter]#xyz 
            finger_pos = fingerState
  
            #Distance of finger_ee to obj in world frame
            finger_dist_x = block_pos[0] - finger_pos[0]
            finger_dist_y = block_pos[1] - finger_pos[1]
            finger_dist_z = block_pos[2] - finger_pos[2]

            finger_dist = [finger_dist_x,finger_dist_y,finger_dist_z]
            finger_dist = [abs(i) for i in finger_dist]
            fingers_dist_worldFrame+=finger_dist

        robot_dist_worldFrame = kuka_dist+fingers_dist_worldFrame  
        obs_worldFrame = robot_dist_worldFrame+block_orn+kuka_orn

        ground_truth = obs_worldFrame

        test = env.getExtendedObservation()
        self.assertEqual(test,ground_truth)

    def test_obs_distAndOrn_relativeToKukaAndFingers_xyz_false(self):
        """       
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
        fingers_dist_fingerFrame =[]

        # creating environment
        env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
                    action_mode = "jointControl",
                    obs_mode = "kuka_xyz",
                    adaptive_action_reperate = None,
                    reward_function_choice=1			
	    )

        env.reset()

        kuka_state  = self.kuka_obs(env,data_type="dic",angle="quaternum")
        block_state = self.block_obs(env,data_type="dic",angle="quaternum")
        fingers_state = self.fingers_obs(env,obs_type = "pos_orn",data_type="list",angle="quaternum")

        kuka_pos = kuka_state["pos"]
        kuka_orn = kuka_state["orn"]

        block_pos = block_state["pos"]
        block_orn = block_state["orn"]
        #getting block in kuka frame
        invKuka_eePos,invKuka_eeOrn = p.invertTransform(kuka_pos,kuka_orn)
        blockPosInkuka_EE,blockOrnInkuka_EE = p.multiplyTransforms(invKuka_eePos,invKuka_eeOrn,block_pos,block_orn)
  
        # size of vector for kuka_ee to obj in kuka frame
        blockPosIn_kukaFrame = [blockPosInkuka_EE[0],blockPosInkuka_EE[1],blockPosInkuka_EE[2]]
        blockPosIn_kukaFrame = [abs(i) for i in blockPosIn_kukaFrame]
        blockOrnInkuka_EE = list(p.getEulerFromQuaternion(blockOrnInkuka_EE))

        #Fingers in kuka frame
        state_counter = 0
        for linkName in self.get_fingerTips_linkIndex(env):
            state_counter +=1
            fingerState = fingers_state[7*(state_counter-1):7*state_counter]#xyz 
            finger_pos = fingerState[:3]
            finger_orn = fingerState[3:]

            invfingertipPos, invfingertipOrn = p.invertTransform(finger_pos,finger_orn)
            blockPosInfingertip_EE, blockOrnInfingertip_EE = p.multiplyTransforms(invfingertipPos,invfingertipOrn,block_pos,block_orn)
    
            # size of vector for finger_ee to obj in world frame
            finger_dist_fingerFrame = [blockPosInfingertip_EE[0], blockPosInfingertip_EE[1],blockPosInfingertip_EE[2]]
            finger_dist_fingerFrame = [abs(i) for i in finger_dist_fingerFrame]
    
            fingers_dist_fingerFrame.extend(finger_dist_fingerFrame)

        robot_dist_EEsFrame = blockPosIn_kukaFrame+fingers_dist_fingerFrame
        obs_worldFrame = robot_dist_EEsFrame+blockOrnInkuka_EE

        ground_truth = obs_worldFrame

        test = env.getExtendedObservation()
        self.assertEqual(test,ground_truth)
    
    def test_obs_distAndOrn_relativeToPalmAndFingers_true(self):
        """
        all the outputs are relative to world frame
        outout:[palm_dsit,
                FF_dist,
                MF_dist,
                RF_dist,
                TH_dist,
                block_orn,
                palm_orn
                ]
        """
        # creating environment
        env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
                    action_mode = "jointControl",
                    obs_mode = "palm_world",
                    adaptive_action_reperate = None,
                    reward_function_choice=1			
	    )

        env.reset()

        palm_state  = self.palm_obs(env,data_type="dic",angle="euler")
        block_state = self.block_obs(env,data_type="dic",angle="euler")
        fingers_state = self.fingers_obs(env,obs_type = "pos",data_type="list",angle=None)
      
        #calculating distances
        fingers_dist_worldFrame =[]
        palm_pos  = palm_state["pos"]
        palm_orn  = palm_state["orn"]
        block_pos = block_state["pos"]
        block_orn = block_state["orn"]  

        #dist between palm ee and block
        palm_dist_x = abs(block_pos[0] - palm_pos[0])
        palm_dist_y = abs(block_pos[1] - palm_pos[1])
        palm_dist_z = abs(block_pos[2] - palm_pos[2])

        palm_dist = math.sqrt(palm_dist_x**2+ palm_dist_y**2+ palm_dist_z**2)

        state_counter = 0
        for linkName in self.get_fingerTips_linkIndex(env):
            state_counter +=1
            fingerState = fingers_state[3*(state_counter-1):3*state_counter]#xyz 
            finger_pos = fingerState
  
            #Distance of finger_ee to obj in world frame
            finger_dist_x = block_pos[0] - finger_pos[0]
            finger_dist_y = block_pos[1] - finger_pos[1]
            finger_dist_z = block_pos[2] - finger_pos[2]

            finger_dist = math.sqrt(finger_dist_x**2+ finger_dist_y**2+ finger_dist_z**2)
            fingers_dist_worldFrame.append(finger_dist)

        robot_dist_worldFrame = [palm_dist]+fingers_dist_worldFrame  
        obs_worldFrame = robot_dist_worldFrame+block_orn+palm_orn
        
        ground_truth = obs_worldFrame

        test = env.getExtendedObservation()
        self.assertEqual(test,ground_truth)

    def test_obs_distAndOrn_relativeToPalmAndFingers_false(self):
        """
        outout:[palm_dsit_palmFrame,
        FF_dist_FFFrame,
        MF_dist_MFFrame,
        RF_dist_RFFrame,
        TH_dist_THFrame,
        block_orn_palmFrame,
        ]
        """
        fingers_dist_fingerFrame =[]

        # creating environment
        env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
                    action_mode = "jointControl",
                    obs_mode = "palm",
                    adaptive_action_reperate = None,
                    reward_function_choice=1			
	    )

        env.reset()

        palm_state  = self.palm_obs(env,data_type="dic",angle="quaternum")
        block_state = self.block_obs(env,data_type="dic",angle="quaternum")
        fingers_state = self.fingers_obs(env,obs_type = "pos_orn",data_type="list",angle="quaternum")

        palm_pos = palm_state["pos"]
        palm_orn = palm_state["orn"]

        block_pos = block_state["pos"]
        block_orn = block_state["orn"]
        #getting block in palm frame
        invpalm_eePos,invpalm_eeOrn = p.invertTransform(palm_pos,palm_orn)
        blockPosInpalm_EE,blockOrnInpalm_EE = p.multiplyTransforms(invpalm_eePos,invpalm_eeOrn,block_pos,block_orn)
  
        blockPosInpalmFrame = math.sqrt(blockPosInpalm_EE[0]**2+ blockPosInpalm_EE[1]**2+blockPosInpalm_EE[2]**2)
        blockOrnInpalm_EE = list(p.getEulerFromQuaternion(blockOrnInpalm_EE))

        #Fingers in palm frame
        state_counter = 0
        for linkName in self.get_fingerTips_linkIndex(env):
            state_counter +=1
            fingerState = fingers_state[7*(state_counter-1):7*state_counter]#xyz 
            finger_pos = fingerState[:3]
            finger_orn = fingerState[3:]

            invfingertipPos, invfingertipOrn = p.invertTransform(finger_pos,finger_orn)
            blockPosInfingertip_EE, blockOrnInfingertip_EE = p.multiplyTransforms(invfingertipPos,invfingertipOrn,block_pos,block_orn)

            # size of vector for finger_ee to obj in world frame
            finger_dist_fingerFrame = math.sqrt(blockPosInfingertip_EE[0]**2+ blockPosInfingertip_EE[1]**2+blockPosInfingertip_EE[2]**2)

            fingers_dist_fingerFrame.append(finger_dist_fingerFrame)

        robot_dist_palmFrame =  [blockPosInpalmFrame ]+fingers_dist_fingerFrame
        obs_in_palmFrame = robot_dist_palmFrame+blockOrnInpalm_EE
        
        ground_truth = obs_in_palmFrame

        test = env.getExtendedObservation()
        self.assertEqual(test,ground_truth)


    def test_obs_distAndOrn_relativeToPalmAndFingers_xyz_true(self):
        """
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
        """
        # creating environment
        env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
                    action_mode = "jointControl",
                    obs_mode = "palm_world_xyz",
                    adaptive_action_reperate = None,
                    reward_function_choice=1			
	    )

        env.reset()

        palm_state  = self.palm_obs(env,data_type="dic",angle="euler")
        block_state = self.block_obs(env,data_type="dic",angle="euler")
        fingers_state = self.fingers_obs(env,obs_type = "pos",data_type="list",angle=None)
      
        #calculating distances
        fingers_dist_worldFrame =[]
        palm_pos  = palm_state["pos"]
        palm_orn  = palm_state["orn"]
        block_pos = block_state["pos"]
        block_orn = block_state["orn"]  

        #dist between palm ee and block
        palm_dist_x = abs(block_pos[0] - palm_pos[0])
        palm_dist_y = abs(block_pos[1] - palm_pos[1])
        palm_dist_z = abs(block_pos[2] - palm_pos[2])

        palm_dist = [palm_dist_x, palm_dist_y, palm_dist_z]
        palm_dist = [abs(i) for i in palm_dist]


        state_counter = 0
        for linkName in self.get_fingerTips_linkIndex(env):
            state_counter +=1
            fingerState = fingers_state[3*(state_counter-1):3*state_counter]#xyz 
            finger_pos = fingerState
  
            #Distance of finger_ee to obj in world frame
            finger_dist_x = block_pos[0] - finger_pos[0]
            finger_dist_y = block_pos[1] - finger_pos[1]
            finger_dist_z = block_pos[2] - finger_pos[2]

            finger_dist = [finger_dist_x,finger_dist_y,finger_dist_z]
            finger_dist = [abs(i) for i in finger_dist]
            fingers_dist_worldFrame+=finger_dist

        robot_dist_worldFrame = palm_dist+fingers_dist_worldFrame  
        obs_worldFrame = robot_dist_worldFrame+block_orn+palm_orn

        ground_truth = obs_worldFrame

        test = env.getExtendedObservation()
        self.assertEqual(test,ground_truth)
    

    def test_obs_distAndOrn_relativeToPalmAndFingers_xyz_false(self):
        """       
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
        fingers_dist_fingerFrame =[]

        # creating environment
        env =  gym.make("kuka_handlit_multiprocess-v0",
					render=False,
					timeStep=1/1000,
                    action_mode = "jointControl",
                    obs_mode = "palm_xyz",
                    adaptive_action_reperate = None,
                    reward_function_choice=1			
	    )

        env.reset()

        palm_state  = self.palm_obs(env,data_type="dic",angle="quaternum")
        block_state = self.block_obs(env,data_type="dic",angle="quaternum")
        fingers_state = self.fingers_obs(env,obs_type = "pos_orn",data_type="list",angle="quaternum")

        palm_pos = palm_state["pos"]
        palm_orn = palm_state["orn"]

        block_pos = block_state["pos"]
        block_orn = block_state["orn"]
        #getting block in palm frame
        invpalm_eePos,invpalm_eeOrn = p.invertTransform(palm_pos,palm_orn)
        blockPosInpalm_EE,blockOrnInpalm_EE = p.multiplyTransforms(invpalm_eePos,invpalm_eeOrn,block_pos,block_orn)
  
        # size of vector for palm_ee to obj in palm frame
        blockPosIn_palmFrame = [blockPosInpalm_EE[0],blockPosInpalm_EE[1],blockPosInpalm_EE[2]]
        blockPosIn_palmFrame = [abs(i) for i in blockPosIn_palmFrame]
        blockOrnInpalm_EE = list(p.getEulerFromQuaternion(blockOrnInpalm_EE))

        #Fingers in palm frame
        state_counter = 0
        for linkName in self.get_fingerTips_linkIndex(env):
            state_counter +=1
            fingerState = fingers_state[7*(state_counter-1):7*state_counter]#xyz 
            finger_pos = fingerState[:3]
            finger_orn = fingerState[3:]

            invfingertipPos, invfingertipOrn = p.invertTransform(finger_pos,finger_orn)
            blockPosInfingertip_EE, blockOrnInfingertip_EE = p.multiplyTransforms(invfingertipPos,invfingertipOrn,block_pos,block_orn)
    
            # size of vector for finger_ee to obj in world frame
            finger_dist_fingerFrame = [blockPosInfingertip_EE[0], blockPosInfingertip_EE[1],blockPosInfingertip_EE[2]]
            finger_dist_fingerFrame = [abs(i) for i in finger_dist_fingerFrame]
    
            fingers_dist_fingerFrame.extend(finger_dist_fingerFrame)

        robot_dist_EEsFrame = blockPosIn_palmFrame+fingers_dist_fingerFrame
        obs_worldFrame = robot_dist_EEsFrame+blockOrnInpalm_EE

        ground_truth = obs_worldFrame

        test = env.getExtendedObservation()
        self.assertEqual(test,ground_truth)

    #utility functions
    def get_fingerTips_linkIndex(self,env):
        fingerTips_linkIndex = []
        fingerTips_jointInfo = []
        fingerTip_joint_name_bytes = [i.encode(encoding='UTF-8',errors='strict') for i in self.fingerTip_link_name]

        # getting joints for the final link
        for i in fingerTip_joint_name_bytes:
          fingerTips_jointInfo.append(env.controller.jointInfo.searchBy(key="linkName",value = i)[0])

        #extracting joint index which equivalent to link index
        for i in fingerTips_jointInfo: 
          fingerTips_linkIndex.append(i["jointIndex"])  

        return fingerTips_linkIndex

    def get_palm_linkIndex(self,env):
        link_name ="palm_fake"

        link_name_encoded = link_name.encode(encoding='UTF-8',errors='strict')
        palm_link_jointInfo = env.controller.jointInfo.searchBy(key="linkName",value =link_name_encoded )[0]

        palm_link_Index  = palm_link_jointInfo["jointIndex"]

        return palm_link_Index

    def get_kuka_ee_linkIndex(self,env):
        link_name ="lbr_iiwa_link_7"
        print("get_kuka_ee_linkIndex::env:: ",env)
        print("get_kuka_ee_linkIndex::env::controller ",env.controller)


        link_name_encoded = link_name.encode(encoding='UTF-8',errors='strict')
        kuka_ee_link_jointInfo = env.controller.jointInfo.searchBy(key="linkName",value =link_name_encoded )[0]

        kuka_ee_link_Index     = kuka_ee_link_jointInfo["jointIndex"]

        return kuka_ee_link_Index
                  
    def kuka_obs(self,env,data_type="list",angle="euler"):
        obs_euler = []
        obs_quaternum = []
        state_dic_euler = {}
        state_dic_quaternum = {}
        kuka_ee_link_Index = self.get_kuka_ee_linkIndex(env)

        state = p.getLinkState(env.controller._robot_id,kuka_ee_link_Index)#mamad:returns endeffector info position orientation
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
          state = p.getLinkState(env.controller._robot_id,index)#mamad:returns endeffector info position orientation
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
        state = p.getLinkState(env.controller._robot_id,Index)
            
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
2.python -m unittest test_observation
"""