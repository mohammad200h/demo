from robotAdaptiveActionRepeat import RobotAdaptiveActionRepeat

if __name__ == "__main__":
    AAR = RobotAdaptiveActionRepeat(redner=True,sim_step=1./1000.,
        control_setting = {
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
        })

    print(" kuka::",AAR.kuka_AAR.action_repeat_dic)
    print(" MF::",AAR.mf_ARR.action_repeat_dic  )
    print(" TH::",AAR.th_ARR.action_repeat_dic  )

