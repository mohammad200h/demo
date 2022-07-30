# https://www.reddit.com/r/reinforcementlearning/comments/gnvlcp/way_to_plot_goodlooking_rewards_plots/
# https://stackoverflow.com/questions/37304461/tensorflow-importing-data-from-a-tensorboard-tfevent-file
# https://seaborn.pydata.org/generated/seaborn.lineplot.html

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import matplotlib.patches as mpatches
import os

from os import listdir
from os.path import isfile, join

import tensorflow as tf
from tensorflow.python.summary.summary_iterator import summary_iterator


EXPIREMENT_NAME = "exp1_state"


def read_exp_name_setBy_env_variable():
    OLD_EXPIREMENT_NAME = EXPIREMENT_NAME
    print("OLD_EXPIREMENT_NAME::",EXPIREMENT_NAME)
    env_variable_exists = os.environ.get('EXPIREMENT_NAME')
    print("env_variable_exists::",env_variable_exists)
    if env_variable_exists:
        exp_name = os.environ['EXPIREMENT_NAME']
        print("EXPIREMENT_NAME::",exp_name)
        return exp_name
    else:
        return OLD_EXPIREMENT_NAME

########################setting path for expirement###############
#checking if the expirement folder is set using env_variable
#If yes ignore EXPIREMENT_NAME set in this file
EXPIREMENT_NAME = read_exp_name_setBy_env_variable()

print("EXPIREMENT_NAME::",EXPIREMENT_NAME)

#################################################################


def geherate_data_frame_for_single_expirement(data_list, min_len):
    #  run,episode, reward
    tripple_list = []

    for run in range(len(data_list)):
            for e in range(min_len):
                reward = data_list[run][e]
                tripple = [run,e,reward]
                tripple_list.append(tripple)
                    
    data = pd.DataFrame(tripple_list,columns = ["run","episdoe", "reward"])

    return data

def plot_single_expirement(data_list, min_len):

    
    
    data = geherate_data_frame_for_single_expirement(data_list, min_len)

    with pd.option_context('display.max_rows', None, 'display.max_columns', None):  # more options can be specified also
        print(data)
    

    sns.set_style("whitegrid", {'axes.grid' : True,
                                'axes.edgecolor':'black'

                                })
    fig = plt.figure()
    plt.clf()
    ax = fig.gca()
    colors = ["blue"]
    labels = ["DQN"]
    color_patch = []
    # for color, label, data in zip(colors, labels, data_list):
    #     sns.tsplot(time=range(min_len), data=data, color=color, ci=95)
    #     color_patch.append(mpatches.Patch(color=color, label=label))
    sns.lineplot(data=data,x="episdoe",y="reward" )

    plt.tight_layout()

    plt.show()


def get_file_name(path_to_tf_event):
    # getting event file 
    files = [f for f in listdir(path_to_tf_event) if isfile(join(path_to_tf_event, f))]
    event_file = files[0]

    return  event_file


def parse_reward(path_to_events_file):
    reward = []
    for e in summary_iterator(path_to_events_file):
        for v in e.summary.value:
            if v.tag == 'rollout/ep_rew_mean':
                reward.append(v.simple_value)
                
    print("reward::len ",len(reward))
    return reward

def make_all_same_length(stack,min_len):
 
    adjusted_stack = []

    stack_len = len(stack)
    for i in range(stack_len):
        adjusted_stack.append(stack[i][:min_len])

    return adjusted_stack

def parse_expirements(exp_name):
    num_exp_repeat = 5

    reward_stack = []  #this is a list with dimention num_exp_repeat * len reward
    reward_lenght = []

    for exp_num in range(num_exp_repeat):

        EXPIREMENT_FOLDER = exp_name+"_"+str(exp_num+1)
        EXPIREMENT_PATH ="./Expirements/"+EXPIREMENT_FOLDER+"/PPO/"
        TRAINING_SUMMERIES_PATH = EXPIREMENT_PATH + "log"
        path_to_tf_event = TRAINING_SUMMERIES_PATH+"/PPO_1/"
        
        path_to_events_file = path_to_tf_event + get_file_name(path_to_tf_event)

        reward = parse_reward(path_to_events_file)
        reward_stack.append(reward)
        reward_lenght.append(len(reward))

    min_len = min(reward_lenght)
    # print("reward_stack:: ",reward_stack)
    reward_stack = make_all_same_length(reward_stack,min_len)
    return reward_stack,min_len
  

if __name__ == "__main__":
    # parse(TRAINING_SUMMERIES_PATH+"/PPO_1"+"/events.out.tfevents.1655306628.saunders-608-22.local.124180.0")
    data_list, min_len =parse_expirements(EXPIREMENT_NAME)
    plot_single_expirement(data_list, min_len)

