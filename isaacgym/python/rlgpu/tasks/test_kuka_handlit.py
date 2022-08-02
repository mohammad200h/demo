
import sys,os
from kuka_handlit import Kuka_handlit
import torch
import yaml
from isaacgym import gymapi
from isaacgym import gymtorch
from rlgpu.utils.torch_jit_utils import *
import numpy as np

sys.path.append("./../utils")
from config import set_np_formatting, set_seed, get_args, parse_sim_params, load_cfg, retrieve_cfg

cfg_path = "../cfg/kuka_handlit.yaml"
cfg_train_path = "../cfg/train/rlg/rlg_kuka_handlit.yaml"
cfg =  {}
cfg_train =  {}
arg = get_args()

with open(cfg_path, 'r') as stream:
    try:
        cfg = yaml.safe_load(stream)
        
    except yaml.YAMLError as exc:
        print(exc) 


#changing the path for model:
cfg["env"]["asset"]["assetRoot"]= "../../../assets"
cfg["env"]["numEnvs"]= 2
cfg["env"]["episodeLength"]= 100


with open(cfg_train_path, 'r') as stream:
    try:
        cfg_train = yaml.safe_load(stream)
        
    except yaml.YAMLError as exc:
        print(exc)

# print("cfg:: ",cfg)
# print("cfg_train:: ",cfg_train)  
# print("arg:: ",arg)

sim_params = parse_sim_params(arg,cfg,cfg_train) #" <isaacgym._bindings.linux-x86_64.gym_38.SimParams object at 0x7f9ebbf9a6f0>"
physics_engine = gymapi.SIM_PHYSX
device_type = "cuda"
device_id = 0
headless = False

Kh = Kuka_handlit( cfg, sim_params, physics_engine, device_type, device_id, headless)


ll = Kh.kuka_handlit_dof_lower_limits
ul = Kh.kuka_handlit_dof_upper_limits

# print("ll:: ",ll)
# print("ul:: ",ul)


a_collition = [-0.25,1.433,0,-2.094,0,0,0]

a =np.random.uniform(low=0.5, high=13.3, size=(Kh.num_envs,Kh.num_kuka_handlit_dofs))

a[0,:7] = a_collition
a[1,:7] = a_collition
a=torch.from_numpy(a).to(torch.float32).to(Kh.device)
a =tensor_clamp(a,ll,ul)

# a = Kh.obs_buf


before_contact = None
after_contact = None
middle_contact = None
for i in range(200):

    Kh.step(a)
    if i ==5:
        before_contact = torch.clone(Kh.contacts)

    # Kh.draw_contact()
    print("i:: ",i)
    print("Kh.contacts:: ",Kh.contacts)

    if i == 98:
        middle_contact = torch.clone(Kh.contacts)
    if i ==100:
        after_contact = torch.clone(Kh.contacts)


"""
print("after_contact::reshaped ",after_contact.view(Kh.num_envs,Kh.total_num_bodies,-1))
print("after_contact:: ",after_contact)

print("middle_contact:: ",middle_contact)

all_index =list(range(Kh.total_num_bodies*Kh.num_envs))
indexs_with_no_contact = torch.where((middle_contact==torch.tensor([ 0.0000e+00,0.0000e+00,0.0000e+00]).to(Kh.device)).all(dim=1))[0].tolist()

indexs_with_contact = sorted(list(set(all_index)-set(indexs_with_no_contact)))

print("indexs_with_contact::",indexs_with_contact)

name =  Kh.get_name_for_rigid_bodys_with_contact(indexs_with_contact)
print("name:: ",name)

Kh.get_rigid_bodies_pair_that_are_in_contact_with_each_other(name,middle_contact)
# print("all rigid bodies:: ",Kh.rigid_body_dic)
"""
print("middle_contact:: ",middle_contact)

indexs_with_contact = Kh.get_contact_idxs(middle_contact)
contact_dic = Kh.get_name_for_rigid_bodys_with_contact(indexs_with_contact)
print("indexs_with_contact::",indexs_with_contact)
print("contact_dic::",contact_dic)

# Kh.get_dist_between_contacts(indexs_with_contact,middle_contact,contact_dic)

"""
filtered_dic = Kh.remove_table_and_cube(contact_dic)

print("filtered_dic:: ",filtered_dic)
"""