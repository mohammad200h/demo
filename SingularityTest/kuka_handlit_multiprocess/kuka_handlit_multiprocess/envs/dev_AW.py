import pybullet as p
import time

from kuka_handlit_multiprocess.envs.AW import AdaptiveWorkspace

def get_r_from_xml(phy,AW):
    visual_info  =phy.getVisualShapeData(AW.model_id)[0]
    print("visual_info:: ",visual_info)
    _,_,_,dim,_,_,_,_  =visual_info

    print("dim:: ",dim)
    return [dim[0],dim[1]]

def get_pos_from_xml(phy,AW):
  model_info =phy.getBasePositionAndOrientation(AW.model_id)
  pos,orn = model_info
  orn = p.getEulerFromQuaternion(orn)
  print("model_info:: ",pos,orn)
  return pos,orn


AW1_setting ={
  "target_xyz"        :[0,-0.3,0.765],
  "initial_r"         :[0.8,0.7],
  "target_dim"        :[0.05,0.05,0.05],
  "hand_length"       :0.5,
  "grownth_increment" :0.1,
  "obs_mode"          : "kuka"
}
phy = p
phy.connect(p.GUI)

AW = AdaptiveWorkspace(pybullet_obj=phy ,target_xyz=AW1_setting["target_xyz"],initial_r=AW1_setting["initial_r"],
                             render =True,
        
                             target_dim=AW1_setting["target_dim"],hand_length=AW1_setting["hand_length"],
                             grownth_increment=AW1_setting["grownth_increment"],obs_mode = AW1_setting["obs_mode"])



while(1):
   
    # AW.grow_AW()
    r = get_r_from_xml(phy,AW)
    print("AW1_setting::initial_r ",AW1_setting["initial_r"])
    print("r::",r)
    phy.stepSimulation()