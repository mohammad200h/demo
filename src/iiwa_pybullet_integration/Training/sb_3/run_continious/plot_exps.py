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

import sys



base_line   = ["exp1_state"]
state_exps  ={
    "name":"state",
    "list":["exp1_state","exp3_state","exp6_state","exp7_state"],
    "exp1_state":"palm_pos_orn",
    "exp3_state":"palm",
    "exp6_state":"palm_pos_orn_and_hand_joints",
    "exp7_state":"palm_pos_orn_joint_values"
} 

action_exps ={
    "name":"action",
    "list":["exp2_action"]+base_line,
    "exp2_action":"jointControl_hand_IK_kuka",
    base_line[0]:"jointControl"
} 
reward_exps ={
    "name":"reward",
    "list":["exp1_reward","exp6_reward"]+base_line,
    base_line[0] :"reward_one",
    "exp1_reward":"reward_two",
    "exp6_reward":"reward_three",
} 
start_exps  ={
    "name":"episdoe start",
    "list":[ "exp1_randomStart","exp2_randomStart","exp3_randomStart"]+base_line,
    "exp1_randomStart":"random joint values for arm",
    "exp2_randomStart":"palm spawn above the object",
    "exp3_randomStart": "hand in pregrasp pose",
    base_line[0]: "all joint values set to zero"

} 
aw_exps     ={
    "name":"Adaptive workspace",
    "list":["exp1_AW"]+base_line,
    "exp1_AW":"adaptive workspace",
    base_line[0]:"without adaptive workspace"
}

exps = [state_exps,action_exps,reward_exps,start_exps,aw_exps]






def generate_data_frame_for_single_expirement(data_dic, min_len):
    #  exp_name,run,episode, reward
    fourlet_list = []
    for exp_name in data_dic.keys():
        for run in range(len(data_dic[exp_name])):
                for e in range(min_len):
                    # print("data_dic[exp_name]::len ",len(data_dic[exp_name]))
                    reward = data_dic[exp_name][run][e]
                    fourlet = [exp_name,run,e,reward]
                    fourlet_list.append(fourlet)
                    
    data = pd.DataFrame(fourlet_list,columns = ["exp_name","run","episdoe", "reward"])

    return data

def plot(data_dic, min_len,exp_name_list,exp):

    
    
    data = generate_data_frame_for_single_expirement(data_dic, min_len)

    with pd.option_context('display.max_rows', None, 'display.max_columns', None):  # more options can be specified also
        print(data)
    
    plt.style.use('seaborn')
    sns.set_style("whitegrid", {'axes.grid' : True,
                                'axes.edgecolor':'black'

                                })
    fig = plt.figure()
    plt.clf()
    ax = fig.gca()
    colors = ["blue","orange","green","red"]
    labels = [exp[key] for key in exp_name_list]
    color_patch = []
    for color, label in zip(colors, labels):
        color_patch.append(mpatches.Patch(color=color, label=label))
    sns.lineplot(data=data,x="episdoe",y="reward",hue="exp_name" )

    lgd=plt.legend(
    frameon=True, fancybox=True, \
    prop={ 'size':8}, handles=color_patch, loc="best")

    plt.xlabel("episodes")
    plt.ylabel("average episode reward")

    ax = plt.gca()
    plt.tight_layout()
    path = "./Expirements/"+exp["name"]+".png"
    plt.savefig(path)
    # plt.show()



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
                
    # print("reward::len ",len(reward))
    return reward

def cut_to_same_length(stack_dic,min_len):
 
    adjusted_stack = stack_dic


    for exp_name in stack_dic.keys():
        stack = stack_dic[exp_name]
        stack_len = len(stack)
        for i in range(stack_len):
            adjusted_stack[exp_name][i] = stack[i][:min_len]
        print("exp_name:: ",exp_name)
        print("adjusted_stack[exp_name]::len",len(adjusted_stack[exp_name]))
    return adjusted_stack

def padd_to_same_length(stack_dic,max_len):
 
    adjusted_stack = stack_dic
    

    for exp_name in stack_dic.keys():
        padding = []
        stack = stack_dic[exp_name]
        stack_len = len(stack)
        for i in range(stack_len):
            len_data = len(stack[i])
            print("len_data:: ",len_data)
            if len_data<max_len:
                # we are going to padd the reward with last reward 
                padd_len_needed = max_len-len_data
                print("padd_len_needed:: ",padd_len_needed)
                print("padd_len_needed:: ",padd_len_needed)
                padding = [stack[i][-1] for j in range(padd_len_needed)] 
            adjusted_stack[exp_name][i] = stack[i]+padding
        # print("exp_name:: ",exp_name)
        # print("adjusted_stack[exp_name]::len",len(adjusted_stack[exp_name]))
    return adjusted_stack

def parse_expirements(exp_name_list):
    num_exp_repeat = 5

      
    reward_lenght = []
    reward_stack_dic = {}
    for exp_name in exp_name_list:
        reward_stack = []
        for exp_num in range(num_exp_repeat):

            EXPIREMENT_FOLDER = exp_name+"_"+str(exp_num+1)
            EXPIREMENT_PATH ="./Expirements/"+EXPIREMENT_FOLDER+"/PPO/"
            TRAINING_SUMMERIES_PATH = EXPIREMENT_PATH + "log"
            path_to_tf_event = TRAINING_SUMMERIES_PATH+"/PPO_1/"

            path_to_events_file = path_to_tf_event + get_file_name(path_to_tf_event)

            reward = parse_reward(path_to_events_file)
            reward_stack.append(reward)
            reward_lenght.append(len(reward))

        # print("exp_name:: ",exp_name)
        # print("reward_stack::len ",len(reward_stack))

        reward_stack_dic[exp_name]=reward_stack
        

    min_len = min(reward_lenght)
    max_len = max(reward_lenght)
    # print("min_len::",min_len)
    # print("max_len::",max_len)

    # sys.exit()
    
    # reward_stack = cut_to_same_length(reward_stack_dic,min_len)
    reward_stack = padd_to_same_length(reward_stack_dic,max_len)
    return reward_stack,min_len,max_len
  

if __name__ == "__main__":
    # parse(TRAINING_SUMMERIES_PATH+"/PPO_1"+"/events.out.tfevents.1655306628.saunders-608-22.local.124180.0")
    
    for exp in exps:
        data_dic, min_len,max_len =parse_expirements(exp["list"])

        # print("data_dic:: ",data_dic)
        plot(data_dic, max_len,exp["list"],exp)

        

