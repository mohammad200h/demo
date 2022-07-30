import gym
from stable_baselines3 import PPO

import yaml
import kuka_handlit_multiprocess
import os
#https://stable-baselines3.readthedocs.io/en/master/guide/save_format.html
EXPIREMENT_FOLDER = "exp1_AW_5"

def read_exp_folder_setBy_env_variable():
    OLD_EXP_FOLDER = EXPIREMENT_FOLDER
    print("OLD_EXP_FOLDER::",EXPIREMENT_FOLDER)
    env_variable_exists = os.environ.get('EXP_FOLDER')
    print("env_variable_exists::",env_variable_exists)
    if env_variable_exists:
        fodler = os.environ['EXP_FOLDER']
        print("EXP_FOLDER::",fodler)
        return fodler
    else:
        return OLD_EXP_FOLDER

def load_expirement_setup():
    # loading training setting
    with open(TRAINING_MODEL_SETUP_PATH+"/Training.yml", 'r',encoding="utf-8") as stream:
        try:
            training_setting = yaml.safe_load(stream)
        except yaml.YAMLError as exc:
            print(exc) 
            return 
    
    return training_setting

def parse_adaptive_action_reperate(training_setting):
    training_setting = None if training_setting["adaptive_action_reperate"] =='None' else training_setting
    if training_setting== None:
        return None

    kuka_setting = training_setting["adaptive_action_reperate"]["control_setting"]["kuka"]
    hand_setting = training_setting["adaptive_action_reperate"]["control_setting"]["hand"]
    adaptive_action_reperate = {
        "compute_AAR":training_setting["adaptive_action_reperate"]["compute_AAR"],
        "decay":training_setting["adaptive_action_reperate"]["decay"],
        "decay_mode":None if training_setting["adaptive_action_reperate"]["decay_mode"] =='None' else training_setting["adaptive_action_reperate"]["decay_mode"],
        "decay_param":{
            "success_threshold":training_setting["adaptive_action_reperate"]["decay_param"]["success_threshold"],
            "decay_portion":training_setting["adaptive_action_reperate"]["decay_param"]["decay_portion"]
        },
        "training_steps":training_setting["adaptive_action_reperate"]["training_steps"],
        "control_setting":{
                            "kuka":{                        
                              "force":kuka_setting["force"],
                              "maxVelocity":kuka_setting["maxVelocity"],
                              "positionGain":kuka_setting["positionGain"],
                              "velocityGain":kuka_setting["velocityGain"]
                            },
                            "hand":{
                              "force":None if hand_setting["force"] =='None' else hand_setting["force"],
                              "maxVelocity":None if hand_setting["maxVelocity"] =='None' else hand_setting["maxVelocity"],
                              "positionGain":hand_setting["positionGain"],
                              "velocityGain":hand_setting["velocityGain"]
                            }
                         }
    } 
    return adaptive_action_reperate

########################setting path for expirement###############
#checking if the expirement folder is set using env_variable
#If yes ignore EXPIREMENT_FOLDER set in this file
EXPIREMENT_FOLDER = read_exp_folder_setBy_env_variable()
print("EXPIREMENT_FOLDER::",EXPIREMENT_FOLDER)


EXPIREMENT_PATH ="./Expirements/"+EXPIREMENT_FOLDER+"/PPO/"
TRAINING_MODEL_SETUP_PATH = EXPIREMENT_PATH +"setup"
TRAINING_MODEL_SAVE_PATH = EXPIREMENT_PATH +"saved_model"
TRAINING_SUMMERIES_PATH = EXPIREMENT_PATH + "log"
AW_PROGRESS_PATH = EXPIREMENT_PATH +"AW_progress"
ENV_SETTING_PATH = EXPIREMENT_PATH+"gym_env_setting"

#################################################################

path = "./Expirements/"+EXPIREMENT_FOLDER+"/PPO/saved_model/best_model.zip"


training_setting = load_expirement_setup()
AW_mode =None if training_setting["AW_mode"] =='None' else training_setting["AW_mode"]
adaptive_action_reperate = parse_adaptive_action_reperate(training_setting)

model = PPO.load(path, print_system_info=True)

env = gym.make("kuka_handlit_multiprocess-v0",
                render=True,
                adaptive_action_reperate=adaptive_action_reperate,

                 AW_mode = AW_mode ,
                 reward_function_choice = training_setting["reward_mode"],
                 reward_obs_mode = training_setting["reward_obs_mode"],
                 AW_setting = {
                    "obs_mode": "palm",
                    "initial_r":training_setting["AW_radius"],
                     "visualize_flag":True
                 },

                 obs_mode = training_setting["obs_mode"],
                 random_start = training_setting["random_start"],

                 action_mode = training_setting["action_mode"],
                 max_episode_steps = training_setting["max_episode_steps"],
                 actionRepeat = training_setting["actionRepeat"]
                )

# Enjoy trained agent
obs = env.reset()
for i in range(1000000):
    action, _states = model.predict(obs, deterministic=True)
    # print("action:: ",action)
    # print("obs:: ",obs)
    obs, rewards, done, info = env.step(action)

    if done:
        obs = env.reset()
        print("reseting..")
   