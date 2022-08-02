#!/usr/bin/env python
from time import sleep
import pybullet as p
import numpy as np
from modelGenerator import DomainRandomization

import random
from mamad_util import JointInfo
from matplotlib import pyplot as plt
import matplotlib.animation as animation 


class InteractivePid():

    def __init__(self,sim_step,finger="TH"):

        self.p = p
        self.finger = finger
        self.sim_step =sim_step

        Robot,RobotId, endEffectorId = self.setUpWorld()
        self.RobotId = RobotId
     

        self.jointInfo = JointInfo()
        self.jointInfo.get_infoForAll_joints(Robot)
        #getting number of active joints
        self.active_joints_info  = self.jointInfo.getActiveJointsInfo()
        self.num_active_joints   = self.jointInfo.getNumberOfActiveJoints()       
  
        ###############Sliders################
        self.p_ids,self.d_ids,self.command_ids = self.setup_GUI_slidbars()
        ################data buffer###########
        self.time_step = 0
        self.res       =[[]for j in range(4)]
        self.commands  =[[]for j in range(4)]
        self.time =[]

        ########## Ploting setting ############
        color = ['b','g','c','y']
        plt.ion()
        self.fig = plt.figure()
        self.axs =[]

        self.reses_plt=[]
        self.commands_plt=[]
        for j in range(4):
            
 

            self.axs.append(self.fig.add_subplot(2,2,j+1 ))
            self.axs[j].axis(ymin=-1.7,ymax=1.7)
            self.axs[j].axis(xmin=0,xmax=1000)
          
            res, = self.axs[j].plot(self.time,self.res[j], color[j])
            command, = self.axs[j].plot(self.time,self.commands[j], 'r')
            self.reses_plt.append(res)
            self.commands_plt.append(command)
        # self.fig.canvas.draw()
        # plt.show(block=False)
        ########################################

    
    def setUpWorld(self,initialSimSteps=100):
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
        _timeStep = 1./ self.sim_step
        self.p.setTimeStep(_timeStep)
        self.p.resetSimulation()

        dr = DomainRandomization()
        dr.visual_randomization()
        dr.save_setting()
        dr.generate_model_sdf(control_mode=self.finger)
        dr.generate_collison_model()


        sleep(0.1)
        self.p.configureDebugVisualizer(self.p.COV_ENABLE_RENDERING,0)
        # Load Baxter
        Robot = self.p.loadSDF("./model.sdf")
        RobotId = Robot[0]
        euler_angle = [0,0,3.14]
        quaternion_angle = self.p.getQuaternionFromEuler(euler_angle)

        self.p.resetBasePositionAndOrientation(RobotId, [0, 0, 0],quaternion_angle)
        #p.resetBasePositionAndOrientation(RobotId, [0.5, -0.8, 0.0],[0,0,0,1])
        #p.resetBasePositionAndOrientation(RobotId, [0, 0, 0], )

        self.p.configureDebugVisualizer(p.COV_ENABLE_RENDERING,1)

        # Grab relevant joint IDs
        endEffectorId = 48 # (left gripper left finger)

        # Set gravity
        self.p.setGravity(0., 0., -10.)

        # Let the world run for a bit
        for _ in range(initialSimSteps):
            self.p.stepSimulation()

        return Robot,RobotId, endEffectorId

    
    def setup_GUI_slidbars(self):
        p_ids  =[]
        d_ids  =[] 

        command_ids =[]

        #pd sliders
        for i in range(4):
            
            jointName = self.active_joints_info[i]["jointName"]
            jointName = jointName.decode("utf-8") 
            p_id = self.p.addUserDebugParameter("P::"+jointName,0,100,1)
            d_id = self.p.addUserDebugParameter("D::"+jointName,0,100,1)
            p_ids.append(p_id)
            d_ids.append(d_id)
        
        for j in range(4):

            jointName = self.active_joints_info[j]["jointName"]
            jointName = jointName.decode("utf-8") 
            jointll = self.active_joints_info[j]["jointLowerLimit"]
            jointul = self.active_joints_info[j]["jointUpperLimit"]

            c = self.p.addUserDebugParameter(jointName,jointll,jointul,0)
            command_ids.append(c)

        return p_ids,d_ids,command_ids

    def read_GUI_slidbars(self):
        p_ids = self.p_ids
        d_ids = self.d_ids
        command_ids = self.command_ids

        ps = []
        ds = []
        commands = []

        for id in p_ids:
            p = self.p.readUserDebugParameter(id)
            ps.append(p)
        for id in d_ids:
            d = self.p.readUserDebugParameter(id)
            ds.append(d)
        for id in command_ids:
            c = self.p.readUserDebugParameter(id)
            commands.append(c)
        
        return ps,ds,commands

    def reset(self):
        #choose intial hand pos
        start_pos,command = self.get_starting_pos_and_command()

        ####reseting pos#####
        # for j in range(self.num_active_joints):
        #     jointIndex = self.active_joints_info[j]["jointIndex"]
        #     self.p.resetJointState(self.RobotId,jointIndex,start_pos[j])  
        self.setUpWorld()
        return start_pos,command   
  
    def run(self):
        while(1):
            self.time_step+=1
            #check if reset
            rKey = ord('r')
            keys = self.p.getKeyboardEvents()
            if rKey in keys and keys[rKey]&self.p.KEY_WAS_TRIGGERED:
                self.reset()


            #getting new values
            ps,ds,commands = self.read_GUI_slidbars()

            #apply action
            self.apply_command(ps,ds,commands)
            self.p.stepSimulation()
            res = self.obs()
            
            #store data in buffer
            self.upate_data_buffer(commands,res)

            #remder fig
            if self.time_step%100 ==0:
                self.render_pid(ps,ds)

 
    #utility function
    def get_starting_pos_and_command(self):
        
        starting_pos = []
        command_pos = []  
        for i in range(4):
            random_joint_value = random.uniform(self.active_joints_info[i]["jointLowerLimit"],self.active_joints_info[i]["jointUpperLimit"])
            starting_pos.append(random_joint_value)
                
        for i in range(4):
            random_joint_value = random.uniform(self.active_joints_info[i]["jointLowerLimit"],self.active_joints_info[i]["jointUpperLimit"])
            command_pos.append(random_joint_value)


        return starting_pos,command_pos

    def apply_command(self,ps,ds,command):

        for j in range(4):
            jointIndex = self.active_joints_info[j]["jointIndex"]
            self.p.setJointMotorControl2(bodyIndex=self.RobotId, jointIndex=jointIndex, controlMode=p.POSITION_CONTROL,
                                    targetPosition=command[j],targetVelocity=0,force=self.active_joints_info[j]["jointMaxForce"], 
                                    maxVelocity=self.active_joints_info[j]["jointMaxVelocity"],positionGain=ps[j],velocityGain=ds[j])
    
    def obs(self):

        joint_values = []
        for j in range(4):
            jointIndex = self.active_joints_info[j]["jointIndex"]
            jointState = self.p.getJointState(self.RobotId,jointIndex)[0]  

            joint_values.append(jointState)  

        return joint_values    


    def render_pid(self,ps,ds):
        print("plotting..")


        for j in range(4):
            jointName = self.active_joints_info[j]["jointName"]
            jointName = jointName.decode("utf-8") 

            self.axs[j].title.set_text(jointName+" "+"p="+str(ps[j])+" "+"d="+str(ds[j]))
            self.commands_plt[j].set_ydata(self.commands[j])
            self.reses_plt[j].set_ydata(self.res[j])

            self.commands_plt[j].set_xdata(self.time)
            self.reses_plt[j].set_xdata(self.time)
            
        self.fig.canvas.draw()
        self.fig.canvas.flush_events()


    def upate_data_buffer(self,commands,res):
        
        if self.time_step<=1000:
            for j in range(4):
                self.res[j].append(res[j])
                self.commands[j].append(commands[j])
            self.time = [t for t in range(self.time_step) ]
        else:
            #We pop one value from front and add new one to the end keeping size of data constant
            for j in range(4):
                self.res[j].pop(0)
                self.res[j].append(res[j])
                self.commands[j].pop(0)
                self.commands[j].append(commands[j])
            self.time =[t for t in range(1000) ]


       

if __name__ == "__main__":

    guiClient = p.connect(p.GUI)
    p.resetDebugVisualizerCamera(1, 180, 0., [0., 0.2, 0.3])

    IP = InteractivePid(600)

    IP.run()
    
