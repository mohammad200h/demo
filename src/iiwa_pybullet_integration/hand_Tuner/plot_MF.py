
#!/usr/bin/env python
from time import sleep
import pybullet as p
import numpy as np
from modelGenerator import DomainRandomization

import random
from mamad_util import JointInfo
from matplotlib import pyplot as plt

import csv

last_line_read = 0

def setUpWorld(initialSimSteps=100):
    """
    Reset the simulation to the beginning and reload all models.

    Parameters
    ----------
    initialSimSteps : int

    Returns
    -------
    baxterId : int
    endEffectorId : int 
    """
    _timeStep = 1./600.
    p.setTimeStep(_timeStep)
    p.resetSimulation()
    
    dr = DomainRandomization()
    dr.visual_randomization()
    dr.save_setting()
    dr.generate_model_sdf(control_mode="MF")
    

    sleep(0.1)
    p.configureDebugVisualizer(p.COV_ENABLE_RENDERING,0)
    # Load Baxter
    Robot = p.loadSDF("./model.sdf")
    RobotId = Robot[0]
    euler_angle = [0,0,3.14]
    quaternion_angle = p.getQuaternionFromEuler(euler_angle)

    p.resetBasePositionAndOrientation(RobotId, [0, 0, 0],quaternion_angle)
    #p.resetBasePositionAndOrientation(RobotId, [0.5, -0.8, 0.0],[0,0,0,1])
    #p.resetBasePositionAndOrientation(RobotId, [0, 0, 0], )

    p.configureDebugVisualizer(p.COV_ENABLE_RENDERING,1)

    # Grab relevant joint IDs
    endEffectorId = 48 # (left gripper left finger)

    # Set gravity
    p.setGravity(0., 0., -10.)

    # Let the world run for a bit
    for _ in range(initialSimSteps):
        p.stepSimulation()

    return Robot,RobotId, endEffectorId

def convert_str_to_list(string):
    float_list = []
    str_list = string.split(",")
    for str_int in str_list:
        float_list.append(float(str_int))
    
    return float_list


def get_starting_pos_and_command(active_joints_info,generate=True,stable=True):
    global last_line_read
    starting_pos = []
    command_pos = []
    if generate:
        
        for i in range(4):
            random_joint_value = random.uniform(active_joints_info[i]["jointLowerLimit"],active_joints_info[i]["jointUpperLimit"])
            starting_pos.append(random_joint_value)
                
        for i in range(4):
            random_joint_value = random.uniform(active_joints_info[i]["jointLowerLimit"],active_joints_info[i]["jointUpperLimit"])
            command_pos.append(random_joint_value)
    else:
        file_name = "mf_stable.csv" if stable else "mf_unstable.csv"
        path = "./"+file_name
        csvfile = open(path)
        reader = csv. reader(csvfile)
        num_of_lines= len(list(reader))
        current_line = 0
        print(num_of_lines)
        with open(path, 'rb') as csvfile:
            for row in csvfile.readlines():
                current_line +=1 
                line = row.decode("utf-8")
                list_from_str = convert_str_to_list(line)
                if current_line > last_line_read and current_line<num_of_lines:
                    starting_pos = list_from_str[:4]
                    command_pos = list_from_str[4:8]
                    last_line_read = current_line
                    return starting_pos,command_pos

    return starting_pos,command_pos



def log_unstable(starting_pos,command,pid_tune):
    header =  ["s_1","s_2","s_3","s_4",
            "c_1","c_2","c_3","c_4",
            "p_1","d_1","p_2","d_2","p_3","d_3","p_4","d_4"
           ]
    pid_list  =[pid_tune[0]["p"],pid_tune[0]["d"],
                pid_tune[1]["p"],pid_tune[1]["d"],
                pid_tune[2]["p"],pid_tune[2]["d"],
                pid_tune[3]["p"],pid_tune[3]["d"]
               ]
    data = starting_pos+command+pid_list
    log(False,data,header)

def log_stable(starting_pos,command,pid_tune):
    header=["s_1","s_2","s_3","s_4",
            "c_1","c_2","c_3","c_4",
            "p_1","d_1","p_2","d_2","p_3","d_3","p_4","d_4"
           ]
    pid_list  =[pid_tune[0]["p"],pid_tune[0]["d"],
                pid_tune[1]["p"],pid_tune[1]["d"],
                pid_tune[2]["p"],pid_tune[2]["d"],
                pid_tune[3]["p"],pid_tune[3]["d"]
               ]
    data = starting_pos+command+pid_list
    log(True,data,header)

def log(stable,data,header):
    file_name = "mf_stable.csv" if stable else "mf_unstable.csv"
    path = "./"+file_name

    with open(path, 'a') as f:
        # create the csv writer
        writer = csv.writer(f)

        # write a row to the csv file
        writer.writerow(data)

def is_pid_stable(time_slots,inital_joints,command,phase_one,phase_two):
    #detecting if command joint value is higher than instial joint value
    command_is_higher_than_intial_j_value = [False]*4
    for j in range(4):
        if command[j]>inital_joints[j]:
            command_is_higher_than_intial_j_value[j]=True
        else:
            command_is_higher_than_intial_j_value[j]=False
    
    ##Test1: The reponse has not overshot in phase one
    for j in range(4):
        for i in range(time_slots["phase_one"]):
            if command_is_higher_than_intial_j_value[j]:
                if phase_one[j][i]<=command[j]+0.1:
                    continue 
                else:
                    print("first")
                    print("Test1::Failed::j::",j+1)
                    print("command_is_higher_than_intial_j_value:: ",command_is_higher_than_intial_j_value[j])
                    return False
            else:
                if phase_one[j][i]>=command[j]-0.1:
                    continue 
                else:
                    print("scond")
                    print("Test1::Failed::j::",j+1)
                    print("command_is_higher_than_intial_j_value:: ",command_is_higher_than_intial_j_value[j])
                    return False

        


    ##Test2: The is no isolation in phase two
    a,b = None,None
    for i in range(4):
        index  =random.randint(0,len(phase_two[0])-1)
        a = phase_two[i][index]
        if index+2 <len(phase_two[0])-1:
            b = phase_two[i][index+2]
        else:
            b = phase_two[i][index-2]
        print("a,b",a,b)
        if round(a) ==round(b):
            continue 
        else:
            print("Test2::Failed::j::",i+1)
            return False

    return True

def try_pid(generate=True,stable=True,log=True,plot=False):


    Robot,RobotId, endEffectorId = setUpWorld()


    ############### Getting robot info #################
    jointInfo = JointInfo()
    jointInfo.get_infoForAll_joints(Robot)
    #getting number of active joints
    active_joints_info  = jointInfo.getActiveJointsInfo()
    num_active_joints = jointInfo.getNumberOfActiveJoints()

    # print("num_active_joints:: ",num_active_joints)
    # print("active_joints_info:: ",active_joints_info)
    ul =[]
    ll =[]
    for i in range(num_active_joints):
        ul.append(active_joints_info[i]["jointUpperLimit"])
        ll.append(active_joints_info[i]["jointLowerLimit"])

    
    ################ Reseting robot pos to random positions ################

    starting_pos,command = get_starting_pos_and_command(active_joints_info,generate=generate,stable=stable)
    # starting_pos = [0.048943705869702	,0.318388471324207	,0.231053217350093	,0.385302271794615]

    for j in range(num_active_joints):
        jointIndex = active_joints_info[j]["jointIndex"]
        p.resetJointState(RobotId,jointIndex,starting_pos[j])


    ################ Issuing command #############
    # jointMaxForce
    # jointMaxVelocity
    # command = [1,1,0.4,0]
    # command = [-0.5639559817397786, 0.8725542815522195, -0.6583402402458911, 0.5973350331384765]

    #####Generating a random target command ######
    # command = [0.598550325328398,	0.790667297715977,	0.517462502198521,	0.252159362849422]
    ########################PID######################

    pid_res =[
        {
            "command":[],
            "obs":[]
        },
        {
            "command":[],
            "obs":[]
        },
        {
            "command":[],
            "obs":[]
        },
        {
            "command":[],
            "obs":[]
        }
    ]

    pid_tune=[
        {
         "p":1,
         "d":1   
        },
        {
         "p":1,
         "d":1
        },
        {
         "p":1,
         "d":1
        },
        {
         "p":1,
         "d":1  
        },
    ]
    #############################
    time_slots = {
        "phase_one":2500,
        "phase_two":2500
    }
    phase_one =[[0 for i in range(time_slots["phase_one"])]for j in range(4)]
    phase_two =[[0 for i in range(time_slots["phase_two"])]for j in range(4)]

    time = time_slots["phase_one"]+time_slots["phase_two"]
    for i in range(time):
        for j in range(num_active_joints):
            jointIndex = active_joints_info[j]["jointIndex"]
            p.setJointMotorControl2(bodyIndex=RobotId, jointIndex=jointIndex, controlMode=p.POSITION_CONTROL,
                                    targetPosition=command[j],targetVelocity=0,force=active_joints_info[j]["jointMaxForce"], 
                                    maxVelocity=active_joints_info[j]["jointMaxVelocity"],positionGain=pid_tune[j]["p"],velocityGain=pid_tune[j]["d"])

            jointState = p.getJointState(RobotId,jointIndex)[0]
            pid_res[j]["command"].append(command[j])
            pid_res[j]["obs"].append(jointState)
            if i<time_slots["phase_one"]:
                # print("i:: ",i)
                phase_one[j][i] = jointState
            else:
                adjusted_i = i-time_slots["phase_one"]
                phase_two[j][adjusted_i] = jointState

        p.stepSimulation()

    ################## Detecting if pid reponse was stable #################
    stable = is_pid_stable(time_slots,starting_pos,command,phase_one,phase_two)

    print("stable:: ",stable)
    if log:
        if not stable:
            log_unstable(starting_pos,command,pid_tune)
        else:
            log_stable(starting_pos,command,pid_tune)

    ####################plottting##########################################
    color  = ['b','g','c','y']
    fig = plt.figure()
    axs =[]
    for i in range(4):
    
        axs.append(fig.add_subplot(2,2,i+1 ))
        axs[i].axis(ymin=-1.5,ymax=1.5)
        axs[i].plot([i for i in range(time)],pid_res[i]["command"],'r')
        axs[i].plot([i for i in range(time)],pid_res[i]["obs"],color[i])
        axs[i].title.set_text("j"+str(i+1))


    print("command::",command)
    print("starting_pos::",starting_pos)
    if plot:
        plt.show()


    # while(1):
    #     p.stepSimulation()

if __name__ == "__main__":

    # get_command(generate=False,stable= False)

    guiClient = p.connect(p.GUI)
    p.resetDebugVisualizerCamera(1, 180, 0., [0., 0.2, 0.3])
    
    for i in range(500):
        try_pid(generate=False,stable=True,log=False,plot=True)
