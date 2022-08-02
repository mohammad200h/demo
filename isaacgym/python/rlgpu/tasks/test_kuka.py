
import sys,os
from kuka import Kuka
import torch
import yaml
from isaacgym import gymapi
from isaacgym import gymtorch
from rlgpu.utils.torch_jit_utils import *
import numpy as np

sys.path.append("./../utils")
from config import set_np_formatting, set_seed, get_args, parse_sim_params, load_cfg, retrieve_cfg

cfg_path = "../cfg/kuka.yaml"
cfg_train_path = "../cfg/train/rlg/rlg_kuka.yaml"
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

Kh = Kuka( cfg, sim_params, physics_engine, device_type, device_id, headless)


ll = Kh.kuka_dof_lower_limits
ul = Kh.kuka_dof_upper_limits

# print("ll:: ",ll)
# print("ul:: ",ul)
a =np.random.uniform(low=0.5, high=13.3, size=(Kh.num_envs,Kh.num_kuka_dofs))
a=torch.from_numpy(a).to(torch.float32).to(Kh.device)
a =tensor_clamp(a,ll,ul)

# a = Kh.obs_buf
before_contact = None
after_contact = None
for i in range(200):
    print("i:: ",i)
    Kh.step(a)
    if i ==5:
        before_contact = Kh.contacts
    if i ==100:
        after_contact = Kh.contacts


  

print("before_contact:: ",before_contact)
print("after_contact:: ",after_contact)