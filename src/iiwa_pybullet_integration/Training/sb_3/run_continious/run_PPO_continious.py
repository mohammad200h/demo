import gym
import kuka_handlit_multiprocess

from typing import Callable

from stable_baselines3 import PPO
from stable_baselines3.ppo import MlpPolicy
from stable_baselines3.common.vec_env import  DummyVecEnv, SubprocVecEnv,VecNormalize
from stable_baselines3.common.utils import set_random_seed
from stable_baselines3.common.env_util import make_vec_env


import yaml
import numpy as np
import os

import matplotlib.pyplot as plt

from stable_baselines3.common.monitor import Monitor
from stable_baselines3.common.results_plotter import load_results, ts2xy

from stable_baselines3.common.callbacks import BaseCallback
import argparse
import math 

"""
useful links:
https://github.com/hill-a/stable-baselines/issues/634
https://stable-baselines.readthedocs.io/en/master/guide/examples.html#pybullet-normalizing-input-features

"""

EXPIREMENT_FOLDER = "exp1_state_1"



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
        "starting_AAR_percentage":training_setting["adaptive_action_reperate"]["starting_AAR_percentage"],
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

class SaveOnBestTrainingRewardCallback(BaseCallback):
    """
    Callback for saving a model (the check is done every ``check_freq`` steps)
    based on the training reward (in practice, we recommend using ``EvalCallback``).

    :param check_freq: (int)
    :param log_dir: (str) Path to the folder where the model will be saved.
      It must contains the file created by the ``Monitor`` wrapper.
    :param verbose: (int)
    """
    def __init__(self, check_freq: int, log_dir: str, verbose=1):
        super(SaveOnBestTrainingRewardCallback, self).__init__(verbose)
        self.check_freq = check_freq
        self.log_dir = log_dir
        self.save_path = os.path.join(log_dir, 'best_model')
        self.best_mean_reward = -np.inf

    def _init_callback(self) -> None:
        # Create folder if needed
        if self.save_path is not None:
            os.makedirs(self.save_path, exist_ok=True)

    def _on_step(self) -> bool:
        if self.n_calls % self.check_freq == 0:

          # Retrieve training reward
          x, y = ts2xy(load_results(self.log_dir), 'timesteps')
          if len(x) > 0:
              # Mean training reward over the last 100 episodes
              mean_reward = np.mean(y[-100:])
              if self.verbose > 0:
                print("Num timesteps: {}".format(self.num_timesteps))
                print("Best mean reward: {:.2f} - Last mean reward per episode: {:.2f}".format(self.best_mean_reward, mean_reward))

              # New best model, you could save the agent here
              if mean_reward > self.best_mean_reward:
                  self.best_mean_reward = mean_reward
                  # Example for saving best model
                  if self.verbose > 0:
                    print("Saving new best model to {}".format(self.save_path))
                  self.model.save(self.save_path)

        return True


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

training_setting = load_expirement_setup()
log_dir = TRAINING_MODEL_SAVE_PATH


AW_mode =None if training_setting["AW_mode"] =='None' else training_setting["AW_mode"]
adaptive_action_reperate = parse_adaptive_action_reperate(training_setting)
cliprange_vf =None if training_setting["cliprange_vf"] =='None' else training_setting["cliprange_vf"]



################ArgParser#################
parser = argparse.ArgumentParser(description='Process Args for expirement.')
parser.add_argument('n_env',metavar='n_env',type=int,help='number of env used for this training. each env consumes a core')
args = parser.parse_args()
################vector enviornment###################

env_id = "kuka_handlit_multiprocess-v0"
env_kwargs = {
"render":False,
"adaptive_action_reperate":adaptive_action_reperate,

 "AW_mode":AW_mode ,
 "reward_function_choice":training_setting["reward_mode"],
 "reward_obs_mode":training_setting["reward_obs_mode"],
 'AW_setting':{
    "obs_mode": "palm",
    "initial_r":training_setting["AW_radius"],
     "visualize_flag":True
 },

 'obs_mode':training_setting["obs_mode"],
 "random_start":training_setting["random_start"],

 "action_mode":training_setting["action_mode"],
 "max_episode_steps":training_setting["max_episode_steps"],
 "actionRepeat":training_setting["actionRepeat"]
}

if __name__ == '__main__':
  env = make_vec_env(env_id, n_envs=args.n_env,env_kwargs=env_kwargs,monitor_dir=log_dir,vec_env_cls=SubprocVecEnv)
  
  env = VecNormalize(env, norm_obs=True, norm_reward=True, clip_obs=10.)
  #############################AAR##########################

  n_steps = 0
  control_delay = 5
  if adaptive_action_reperate !=None:
    
    if adaptive_action_reperate["starting_AAR_percentage"] ==1:
         n_steps =math.ceil(training_setting["max_episode_steps"] /( adaptive_action_reperate["starting_AAR_percentage"]*control_delay))
    else:
        n_steps =math.ceil(training_setting["max_episode_steps"] * adaptive_action_reperate["starting_AAR_percentage"]/control_delay)

  else:
    n_steps = math.ceil(training_setting["max_episode_steps"]/control_delay)
    
  #######################################################
  model = PPO(MlpPolicy, env,
          gamma           =training_setting["discount"], 
          n_steps         =n_steps, 
          ent_coef        =training_setting["ent_coef"], 
          learning_rate   =float(training_setting["lr"]), 
          vf_coef         =training_setting["vf_coef"], 
          max_grad_norm   =training_setting["max_grad_norm"], 
          gae_lambda      =training_setting["lam"], 
          batch_size      =training_setting["batch_size"],
          n_epochs        =training_setting["n_epoch"],
          clip_range      =training_setting["cliprange"],
          clip_range_vf   =cliprange_vf,
          verbose         =1,
          tensorboard_log =TRAINING_SUMMERIES_PATH,
         
          )
  
  # Create the callback: check every 1000 steps
  callback = SaveOnBestTrainingRewardCallback(check_freq=1000, log_dir=log_dir)
  
  time_steps = 100000000000000000000000000000000000000000000000000
  
  model.learn(total_timesteps=time_steps,callback=callback)
  
