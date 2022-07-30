import os, inspect
currentdir = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe())))
print("\n")
print ("AW::current_dir=" + currentdir)
print("\n")
os.sys.path.insert(0,currentdir)
import math
import numpy as np
import pybullet as p
import os.path, time

import pybullet_data
from kuka_handlit_controller import Kuka_Handlit
import random

import  sys



class AW_process():
  """
  We use the AW_buffer to store calculated plan for random ee pose. Each AW belonging to env process contrbute to this buffer.
  This will lead to less computation on each process.
  """
  def __init__(self,robot_id,robot_ee,size=30):
    #(pos,joint_values)
    self._buffer_size= size
    self._robot_id = robot_id
    self._robot_ee = robot_ee
    self.AW_Buffer  =[]
    self.current_plan = None
    print("robot_ee:: ",robot_ee)


  def get_buffer_size(self):
    return len(self.AW_Buffer)  
  
  def get_plan_joint_values_from_buffer(self):
    return random.choice(self.AW_Buffer)[1]

  def get_new_plan_joint_values(self,pose):
    joint_values = self.get_plan_for_pos(pose)
    plan = (pose,joint_values)
    self.current_plan = plan
    return plan[1]

  def get_plan_from_buffer(self):
    return random.choice(self.AW_Buffer)
  
  def get_new_plan(self,pose):
    joint_values = self.get_plan_for_pos(pose)
    plan = (pose,joint_values)
    self.current_plan = plan
    return plan
  
  def get_plan_for_pos(self,pose):
   return  p.calculateInverseKinematics(self._robot_id,self._robot_ee,pose)

  def add_to_buffer(self):
    if get_buffer_size()>self._buffer_size:
      self.AW_Buffer.pop(0)
    self.AW_Buffer.append(current_plan)

class AdaptiveWorkspace(object):
  
  def __init__(self,
               target_xyz,
               initial_r,
               target_dim,
               hand_length,
               grownth_increment,
               robot_id=None,
               robot_ee =None,
               path=None,
               render =False,
               pybullet_obj=None,
               client_id=None,
               obs_mode = "kuka",
               sucss_threshold = 10#The agent should succed in task for this many times
               ):
   
    self.AW_process= AW_process(robot_id,robot_ee)
    self._p = pybullet_obj
    self.client_id = client_id
    self.visualize_flag = render
    self.target_dim = target_dim
    self.AlreadyRanAW = False
    self.hand_length = hand_length
    self.target_xyz = target_xyz
    self.obs_mode = obs_mode
    self.initial_r = self.set_initial_r(initial_r)
    self.sucss_threshold= sucss_threshold
    self.model_id  =None
    self.grownth_increment = grownth_increment
    self.kuka_handId = 3
    self.growthTriggered =False
    self.obs_modes =["kuka,palm"]
    self.AWState = {"Robot":{},#ee position according to AW
                    "target":{},
                    "success_count":0
                    }
    self.AWState["target"] = self.target_xyz

    self.set_bound()


    self.model_pos = self.target_xyz[:]
    self.model_pos[2]+=self.initial_r[1]/2
    self.generate_sdf()
    # print("\n\n")
    # print("self.visualize_flag:: ",self.visualize_flag)
    # print("\n\n")
    # sys.exit()

  def check_if_ee_outside_AW(self,ee_xyz):
    State  = ee_xyz
    Pos = State[0]
    Orn = State[1]
    print("check_if_ee_outside_AW::Pos:: ",Pos)
    print("check_if_ee_outside_AW::Orn:: ",Orn)
    dist_x = abs(Pos[0] - self.target_xyz[0])
    dist_y = abs(Pos[1] - self.target_xyz[1])
    dist_z = abs(Pos[2] - self.target_xyz[2])
    dist = [dist_x,dist_y,dist_z]
    # print("\n\n")
    # print("dist::",dist)
    # print("\n\n")
    # print(" self.initial_r:: ", self.initial_r)
    ee_to_origin = math.sqrt(dist_x**2 + dist_y**2 + dist_z**2)
    for i,d in enumerate(dist):
      if i <2:
        index =0
      else:
        index =1

      # print("index::",index)
      # print("self.initial_r[index]::",self.initial_r[index])
      # print("dist::",dist)

      if (d> self.initial_r[index]):
          return True
      else:
          continue
    return False
  
  def grow_AW(self):
    kuka_work_space_r = 10

    self.AWState["success_count"]+=1
    
    if self.AWState["success_count"] ==self.sucss_threshold:
      # print("grow_AW::I am inside first if")
      if (self.initial_r[0] + self.grownth_increment <= kuka_work_space_r):
        # print("grow_AW::I am inside second if")
        for i in range(2):
          self.initial_r[i] += self.grownth_increment

      
      self.AWState["success_count"]=0
      if self.model_id !=None:
        print("self.model_id:: ",self.model_id)
        self._p.removeBody(self.model_id)
      
      self.set_bound()
      self.generate_sdf()
 
  def pick_random_ee_position_in_AW(self,vary_angle_by=1.570796/2):

    base_angle = [0,3.14,0]
    angle = [0,0,0]
    ee_xyz = [0,0,0]
    # x -axis
    ee_xyz[0] =  random.choice([random.uniform(self.x_bound_to_the_left_of_object[0] ,self.x_bound_to_the_left_of_object[1]),
                                random.uniform(self.x_bound_to_the_right_of_object[0],self.x_bound_to_the_right_of_object[1])
                              ])  
    # y-axis
    ee_xyz[1] =  random.choice([random.uniform(self.y_bound_to_the_left_of_object[0], self.y_bound_to_the_left_of_object[1]),
                                random.uniform(self.y_bound_to_the_right_of_object[0],self.y_bound_to_the_right_of_object[1])
                              ])  
    # z-axis
    ee_xyz[2] = random.uniform(self.z_bound[0],self.z_bound[1])
    # print("AW1::pick_random_ee_position_in_AW()::self.initial_r[2]",self.initial_r[2])
    # print("AW1::pick_random_ee_position_in_AW::self.target_xyz[2]+z_limit",self.target_xyz[2]+z_limit)
    # print("AW1::pick_random_ee_position_in_AW::self.target_xyz[2]+self.initial_r[2]",self.target_xyz[2]+self.initial_r[2])
    # print("AW1::pick_random_ee_position_in_AW::ee_xyz",ee_xyz)

    for i in range(len(angle)):
      angle[i]= random.uniform(base_angle[i]-vary_angle_by,base_angle[i]+vary_angle_by)

    self.AWState["Robot"] = {"ee_xyz":ee_xyz,"angle":angle,"vary_angle_by":vary_angle_by,"x_limit":self.x_limit,"y_limit":self.y_limit,"z_limit":self.z_limit,"r":self.initial_r}
    # print("\n\n")
    # print("AW::AWState['Robot']:: ",self.AWState["Robot"])
    # print("\n\n")
    return  self.AWState["Robot"]
  
  def get_reset_pos(self):
    if self.AW_process.get_buffer_size()>20:
      return self.AW_process.get_plan_joint_values_from_buffer()
    else:
      pose = self.pick_random_ee_position_in_AW()
      print("pick_random_ee_position_in_AW::pose[ee_xyz]:: ",pose["ee_xyz"])
      pose = pose["ee_xyz"]
      return self.AW_process.get_new_plan_joint_values(pose)
  def add_to_buffer():
    self.AW_process.add_to_buffer()

  def generate_sdf(self):
    #TODO:Find a way to visualize a cylinder
      self.visual_id =self._p.createVisualShape(shapeType=self._p.GEOM_CYLINDER,
                                    rgbaColor=[1, 1, 1, 0.3],
                                    specularColor=[0.4, .4, 0],
                                    radius = self.initial_r[0],
                                    length = self.initial_r[1]
                                    )



      self.model_id=self._p.createMultiBody(baseMass=0,
                      baseVisualShapeIndex=self.visual_id,
                      basePosition=self.model_pos,
                      useMaximalCoordinates=0
                      )

      print("self.model_id:: ",self.model_id)
      
     
  #utility
  def set_bound(self):
    self.x_bound_to_the_right_of_object = [self.target_dim[0]/2,self.initial_r[0]/2]
    self.x_bound_to_the_left_of_object  = [i*-1 for i in self.x_bound_to_the_right_of_object]

    self.y_bound_to_the_right_of_object = self.x_bound_to_the_right_of_object
    self.y_bound_to_the_left_of_object  = self.x_bound_to_the_left_of_object 

    self.z_bound = [self.target_xyz[2]+self.target_dim[2],self.target_xyz[2]+self.initial_r[1]]

    self.x_limit = [self.x_bound_to_the_right_of_object,self.x_bound_to_the_left_of_object]
    self.y_limit = [self.y_bound_to_the_right_of_object,self.y_bound_to_the_left_of_object]
    self.z_limit = self.z_bound

  def view_setting():
    print(" target_xyz, initial_r,target_dim,hand_length,grownth_increment,obs_mode = 'kuka'")

  def view_obs_mods():
    print("obs_mods:: ",self.obs_modes)
  
  def set_initial_r(self,initial_r):
    # print("AW::set_initial_r()")
    # print("AW::set_initial_r()::initial_r:: ",initial_r)
    # make sure the redius provided is enough otherwise changeit 
    radius =2*[0]
    if self.obs_mode == "palm":
      # print("AW::set_initial_r()::palm")
      for i,r in enumerate(initial_r):
        if r>self.target_dim[i]:
          radius[i]=r
          # print("AW::set_initial_r()::palm::radius[i]=r:: ",radius[i])
        else:
          radius[i]= self.target_dim[i]*2
          # print("AW::set_initial_r()::palm::radius[i]= self.target_dim[i]*2:: ",radius[i])
    else:
      # print("AW::set_initial_r()::kuka")
      for i,r in enumerate(initial_r):
        if r>self.target_dim[i]+self.hand_length:
          radius[i]=r
          # print("AW::set_initial_r()::kuka::radius[i]=r:: ", radius[i])
        else:
          radius[i]= self.target_dim[i]+self.hand_length+r/2
          # print("AW::set_initial_r()::kuka::radius[i]= self.target_dim[i]+self.hand_length+r/2:: ", radius[i])
    # print("AW::radius:: ",radius)
    return radius
