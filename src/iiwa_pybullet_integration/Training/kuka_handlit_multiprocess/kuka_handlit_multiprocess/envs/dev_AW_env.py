import pybullet as p
import time
from kuka_handlit_controller import Kuka_Handlit

from kuka_handlit_multiprocess.envs.AW import AdaptiveWorkspace

def get_r_from_xml(phy,AW):
    visual_info  =phy.getVisualShapeData(AW.model_id)[0]
    # print("visual_info:: ",visual_info)
    _,_,_,dim,_,_,_,_  =visual_info

    # print("dim:: ",dim)
    return [dim[0],dim[1]]

def get_pos_from_xml(phy,AW):
  model_info =phy.getBasePositionAndOrientation(AW.model_id)
  pos,orn = model_info
  orn = p.getEulerFromQuaternion(orn)
  print("model_info:: ",pos,orn)
  return pos,orn


AW1_setting ={
  "target_xyz"        :[0,-0.3,0.765],
  "initial_r"         :[0.3,0.3],
  "target_dim"        :[0.05,0.05,0.05],
  "hand_length"       :0.5,
  "grownth_increment" :0.1,
  "obs_mode"          : "palm"
}
phy = p
phy.connect(p.GUI)
kuka_angle = p.getQuaternionFromEuler([0,0,3.14])
controller = Kuka_Handlit(phy,kuka_pos =[-0.015,-0.91,0.7478]+list(kuka_angle))

AW = AdaptiveWorkspace(pybullet_obj=phy ,target_xyz=AW1_setting["target_xyz"],initial_r=AW1_setting["initial_r"],
                             render =True,
                             robot_id=controller.get_robot_id(),
                             robot_ee = controller.get_palm_linkIndex(),
                             target_dim=AW1_setting["target_dim"],hand_length=AW1_setting["hand_length"],
                             grownth_increment=AW1_setting["grownth_increment"],obs_mode = AW1_setting["obs_mode"])


kuka_joints = AW.get_reset_pos()
AW_check = True
while kuka_joints==None or AW_check:
  kuka_joints = AW.get_reset_pos()
  joints = list(kuka_joints)+[0]*16
  controller.reset(joints)
  phy.stepSimulation()
  obs = controller.getPureObservation()["hand"]["xyz_rpy"]["palm"]
  pos,orn = obs[:3],obs[3:]
  print("obs::len:: ",len(obs))
  print("obs:: ",obs)
  AW_check = AW.check_if_ee_outside_AW((pos,orn))
  print("AW_check:: ",AW_check)


print("\n")
# print("obs:: ",obs)
print("\n")
print("success!")
while(1):
   
    # AW.grow_AW()
    r = get_r_from_xml(phy,AW)
 