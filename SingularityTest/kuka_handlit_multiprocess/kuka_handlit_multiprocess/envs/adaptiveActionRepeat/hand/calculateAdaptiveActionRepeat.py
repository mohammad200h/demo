#!/usr/bin/env python
from time import sleep
import pybullet as p
import numpy as np
from modelGenerator import DomainRandomization

import random
from mamad_util import JointInfo
import sys
from adaptiveActionRepeat import RecordAdaptiveRepeat,AdativeActionRepeat


if __name__ == "__main__":


    # RecordAdaptiveRepeat()()
    AAR_MF =  AdativeActionRepeat(use_sdf_control=False,
                            redner=True,control_mode="MF",
                            sim_step=1./1000.,
                            control_setting = {
                                                "force":None,
                                                "maxVelocity":None,
                                                "positionGain":1,
                                                "velocityGain":1
                            }
    )
    AAR_TH =  AdativeActionRepeat(use_sdf_control=False,
                            redner=True,control_mode="TH",
                            sim_step=1./1000.,
                            control_setting = {
                                                "force":None,
                                                "maxVelocity":None,
                                                "positionGain":1,
                                                "velocityGain":1
                            }
    )
    print("action_repeat_dic::MF ", AAR_MF.action_repeat_dic)
    print("action_repeat_dic::TH ", AAR_TH.action_repeat_dic)
 
    


