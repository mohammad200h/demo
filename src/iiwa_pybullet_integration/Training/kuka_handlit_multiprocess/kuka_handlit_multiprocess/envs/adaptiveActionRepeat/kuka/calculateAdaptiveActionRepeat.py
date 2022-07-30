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

    AAR = AdativeActionRepeat(redner=True,sim_step=1./1000.,
                              control_setting = {
                                                  "force":200.0,
                                                  "maxVelocity":0.35,
                                                  "positionGain":0.3,
                                                  "velocityGain":1
                                                }
    )
    print("action_repeat_dic:: ",AAR.action_repeat_dic)
    


