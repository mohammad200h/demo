from gym.envs.registration import register
import logging
logger = logging.getLogger(__name__)
register(
    id='kuka_handlit_multiprocess-v0',
    entry_point='kuka_handlit_multiprocess.envs:Kuka_HandlitGymEnv',
    kwargs={"render" : False, 
            "timeStep" : 1./1000.,
            "obs_mode" : "kuka_world",
            "graspPhaseRadius" : 0.35,
            "action_mode" : "delta_joint_control",
            "reward_obs_mode" : None,
            "AW_mode" : None,
            
            "reward_function_choice" : 1,
            "actionRepeat" : 1,
            "adaptive_action_reperate" : {
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
            "max_episode_steps" : 5000,
            "control_delay" : 5,
            "symitric_action" : False
	},
)
