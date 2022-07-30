#!/usr/bin/env python

from .kuka.adaptiveActionRepeat import AdativeActionRepeat as KUKA_AAR
from .hand.adaptiveActionRepeat import AdativeActionRepeat as HAND_AAR
from pkg_resources import resource_string,resource_filename
##The action repeate will be done on control side since controller converts all command types to 
## joint commands

 
    
class RobotAdaptiveActionRepeat():
    def __init__(self,redner=True,sim_step=1./500.,
        control_setting = {
            "kuka":{                        
                "force":None,
                "maxVelocity":None,
                "positionGain":None,
                "velocityGain":None
            },
            "hand":{
                "force":None,
                "maxVelocity":None,
                "positionGain":None,
                "velocityGain":None
            }
        }):

 
        self.kuka_AAR = KUKA_AAR(redner,sim_step,control_setting["kuka"])
        self.mf_ARR   = HAND_AAR(False,redner,"MF",sim_step,control_setting["hand"])
        self.th_ARR   = HAND_AAR(False,redner,"TH",sim_step,control_setting["hand"])


    def get(self,joint_obs,joint_command,is_grasp_phase=False):

        if not is_grasp_phase:
            ##kuka is moving the hand is not all the commands for hand should be ignored
            kuka_obs     = joint_obs[:7]
            kuka_command = joint_command[:7]
            step,step_list = self.kuka_AAR.get(kuka_obs,kuka_command)
            return step,step_list
        else:
            ##kuka and hand are moving together
            robot_steps   = []
            steps_for_all_joints = []
            ##############Fingers#############
            #FF
            ff_obs     =joint_obs[7:7+4]
            ff_command =joint_command[7:7+4]  
            #MF
            mf_obs     =joint_obs[7+4:7+2*4]
            mf_command =joint_command[7+4:7+2*4] 
            #RF
            rf_obs     =joint_obs[7+4*2:7+3*4]
            rf_command =joint_command[7+4*2:7+3*4]
            #TH
            th_obs     =joint_obs[7+4*3:7+4*4]
            th_command =joint_command[7+4*3:7+4*4]

            hand_obs     = [ff_obs,mf_obs,rf_obs,th_obs]
            hand_command = [ff_command,mf_command,rf_command,th_command]
            
            ########KUKA################
            kuka_obs     = joint_obs[:7]
            kuka_command = joint_command[:7]
            step,step_list = self.kuka_AAR.get(kuka_obs,kuka_command)
            robot_steps.append(step)
            steps_for_all_joints += step_list



            #fingers
            for i in range(3):
                step,step_list = self.mf_ARR.get(hand_obs[i],hand_command[i])
                robot_steps.append(step)
                steps_for_all_joints += step_list
            #thumb
            step,step_list = self.th_ARR.get(hand_obs[-1],hand_command[-1])
            robot_steps.append(step)
            steps_for_all_joints += step_list
        

            return max(robot_steps),steps_for_all_joints

    





    

