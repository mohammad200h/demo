# Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA CORPORATION is strictly prohibited.
import math
import numpy as np
import os

from rlgpu.tasks.base.base_task import BaseTask
from isaacgym import gymtorch
from isaacgym import gymapi

import torch

from rlgpu.utils.torch_jit_utils import *
import sys
# print(os.path.abspath(os.getcwd()))

class Kuka(BaseTask):

    def __init__(self, cfg, sim_params, physics_engine, device_type, device_id, headless):
        # print("__init__::called")
        # print("cfg:: ",cfg)
        # print("sim_params:: ",sim_params)
        # print("physics_engine:: ",physics_engine)
        # print("device_type:: ",device_type)
        # print("device_id:: ",device_id)
        # print("headless:: ",headless)

        self.random_rest_flag = True

        self.rigid_bodies_list = ["hand_iiwa_link_ee"]
        self.cfg = cfg
        self.sim_params = sim_params
        self.physics_engine = physics_engine
        self.aggregate_mode = self.cfg["env"]["aggregateMode"]

        self.max_episode_length = self.cfg["env"]["episodeLength"]

        self.cfg["device_type"] = device_type
        self.cfg["device_id"] = device_id
        self.cfg["headless"] =headless

        self.cfg["env"]["numObservations"] = 7
        self.cfg["env"]["numActions"] = 7

        self.up_axis = "z"
        self.up_axis_idx = 2

        # prop dimensions
        self.prop_width = 0.08
        self.prop_height = 0.08
        self.prop_length = 0.08
        self.prop_spacing = 0.09

        self.cubes =[]
        self.envs = []
        self.kukas = []      

        super().__init__(cfg=self.cfg)


        self.kuka_default_dof_pos = to_torch(7*[0], device=self.device)

        # *************setting up state**************
        # get gym GPU state tensors
        actor_root_state_tensor = self.gym.acquire_actor_root_state_tensor(self.sim)
        dof_state_tensor = self.gym.acquire_dof_state_tensor(self.sim)
        rigid_body_tensor = self.gym.acquire_rigid_body_state_tensor(self.sim)

        self.gym.refresh_actor_root_state_tensor(self.sim)
        self.gym.refresh_dof_state_tensor(self.sim)
        self.gym.refresh_rigid_body_state_tensor(self.sim)

        # **********Getting index of ees**************
        dic ={
            "link_names":self.rigid_bodies_list,
            "Indexs":[]
        }
        for link_n in self.rigid_bodies_list:
            index = self.gym.find_actor_rigid_body_index(self.envs[0],self.kukas[0],link_n,gymapi.DOMAIN_SIM)
            dic["Indexs"].append(index)

        print("indexs::",dic)
        # **********breaking down state :
        self.dof_state = gymtorch.wrap_tensor(dof_state_tensor)
        self.inital_dof_state = torch.clone(self.dof_state)

        # print("intial::self.dof_state:: ", self.dof_state)
        # sys.exit()
        self.kuka_dof_state = self.dof_state.view(self.num_envs, -1, 2)


        self.kuka_j_pos =self.kuka_dof_state[:,:7,0]
        #********************************************
        self.num_dofs = self.gym.get_sim_dof_count(self.sim) // self.num_envs
        self.kuka_dof_targets = torch.zeros((self.num_envs, self.num_dofs), dtype=torch.float, device=self.device)

        self.global_indices = torch.arange(self.num_envs*1 , dtype=torch.int32, device=self.device).view(self.num_envs, -1)

        self.reset(torch.arange(self.num_envs, device=self.device))

    def create_sim(self):
        print("create_sim::called")
        self.sim_params.up_axis = gymapi.UP_AXIS_Z
        self.sim_params.gravity.x = 0
        self.sim_params.gravity.y = 0
        self.sim_params.gravity.z = -9.81
        self.sim = super().create_sim(
            self.device_id, self.graphics_device_id, self.physics_engine, self.sim_params)
        self._create_ground_plane()
        self._create_envs(self.num_envs, self.cfg["env"]['envSpacing'], int(np.sqrt(self.num_envs)))

    def _create_ground_plane(self):
        print("_create_ground_plane::called")
        plane_params = gymapi.PlaneParams()
        plane_params.normal = gymapi.Vec3(0.0, 0.0, 1.0)
        self.gym.add_ground(self.sim, plane_params)

    def _create_envs(self, num_envs, spacing, num_per_row):
        print("_create_envs::called")
        lower = gymapi.Vec3(-spacing, -spacing, 0.0)
        upper = gymapi.Vec3(spacing, spacing, spacing)

        asset_root = "../../assets"
        kuka_asset_file = "urdf/kuka_description/iiwa7.urdf"

        if "asset" in self.cfg["env"]:
            asset_root = self.cfg["env"]["asset"].get("assetRoot", asset_root)

        
        kuka_pose = gymapi.Transform()
        # kuka_pose.p = gymapi.Vec3(0.0,-0.91,0.7478)
        kuka_pose.p = gymapi.Vec3(0.0,0.91,0.7478)
        kuka_pose.r = gymapi.Quat.from_axis_angle(gymapi.Vec3(0, 0, 1), -0.5 * math.pi)


        # load kuka asset
        asset_options = gymapi.AssetOptions()
        asset_options.fix_base_link = True
        asset_options.collapse_fixed_joints = True
        asset_options.disable_gravity = True
        asset_options.thickness = 0.001
        asset_options.default_dof_drive_mode = gymapi.DOF_MODE_POS
        asset_options.use_mesh_materials = True

        kuka_asset  = self.gym.load_asset(self.sim, asset_root, kuka_asset_file, asset_options)

        self.num_kuka_dofs = self.gym.get_asset_dof_count(kuka_asset)
        # set kuka dof properties
        kuka_dof_props = self.gym.get_asset_dof_properties(kuka_asset)
        self.kuka_dof_lower_limits = []
        self.kuka_dof_upper_limits = []


        for i in range(self.num_kuka_dofs):
            kuka_dof_props['driveMode'][i] = gymapi.DOF_MODE_POS

            self.kuka_dof_lower_limits.append(kuka_dof_props['lower'][i])
            self.kuka_dof_upper_limits.append(kuka_dof_props['upper'][i])

        self.kuka_dof_lower_limits = to_torch(self.kuka_dof_lower_limits, device=self.device)
        self.kuka_dof_upper_limits = to_torch(self.kuka_dof_upper_limits, device=self.device)


        for i in range(self.num_envs):
            # create env instance
            env_ptr = self.gym.create_env(self.sim, lower, upper, num_per_row)
        
            kuka_actor = self.gym.create_actor(env_ptr, kuka_asset, kuka_pose, "kuka", i)

            self.envs.append(env_ptr)
            self.kukas.append(kuka_actor)


        self.kukas = to_torch(self.kukas, dtype=torch.long, device=self.device)


    def compute_reward(self, actions):
        print("compute_reward::called")
        self.rew_buf[:], self.reset_buf[:] =_compute_reward(self.max_episode_length,self.num_envs,self.reset_buf,self.progress_buf)

    def compute_observations(self):
        print("compute_observations::called")
        #********** update state************
        # Updates actor root state buffer
        self.gym.refresh_actor_root_state_tensor(self.sim)
        # Updates DOF state buffer
        self.gym.refresh_dof_state_tensor(self.sim)
        # Updates rigid body states buffer
        self.gym.refresh_rigid_body_state_tensor(self.sim)
        #**********************************

        #stacking element of obs

        # print("self.kuka_j_pos::shape::",self.kuka_j_pos.size())
        # print("self.hand_j_pos::shape::",self.hand_j_pos.size())

        self.obs_buf = self.kuka_j_pos

        print("self.obs_buf:: ", self.obs_buf)
        # print("self.obs_buf::shape ", self.obs_buf.size())
        return self.obs_buf

    def compute_termination(self,progress_buf,max_episode_length):
        print("compute_termination::called")
        """
        probably there is a reason termination is calculated inside reward function
        i will do the same till I uonderstand why. could be becasue the calculation is done on gpu.
        """

    def reset(self, env_ids):
        print("\n\n")
        print("reset::called")
        
        print("\n\n")
        env_ids_int32 = env_ids.to(dtype=torch.int32)
     
        multi_env_ids_int32 = self.global_indices[env_ids,:1].flatten()

        pos =tensor_clamp(torch.zeros(len(env_ids), self.num_kuka_dofs).to(torch.float32).to(self.device),
                            self.kuka_dof_lower_limits, self.kuka_dof_upper_limits)

        if self.random_rest_flag:
            pos = tensor_clamp(
                self.kuka_default_dof_pos.unsqueeze(0) + 0.25 * (torch.rand((len(env_ids), self.num_kuka_dofs), device=self.device) - 0.5),
                self.kuka_dof_lower_limits, self.kuka_dof_upper_limits)


        self.kuka_dof_targets[env_ids, :self.num_kuka_dofs] = pos


        sucess=self.gym.set_dof_position_target_tensor_indexed(self.sim,
                                                        gymtorch.unwrap_tensor(self.kuka_dof_targets),
                                                        gymtorch.unwrap_tensor(multi_env_ids_int32), len(multi_env_ids_int32))
        print("sucess:",sucess)
        self.gym.set_dof_state_tensor_indexed(self.sim,
                                              gymtorch.unwrap_tensor(self.inital_dof_state),
                                              gymtorch.unwrap_tensor(multi_env_ids_int32), len(multi_env_ids_int32))



        print("multi_env_ids_int32:: ",multi_env_ids_int32)
        print("actor::index",self.gym.get_actor_index(self.envs[0],0,gymapi.DOMAIN_SIM))
        print("actor::index",self.gym.get_actor_index(self.envs[1],0,gymapi.DOMAIN_SIM))
        print("self.kuka_dof_targets::shape:: ",self.kuka_dof_targets.size())
        print("self.kuka_dof_targets:: ",self.kuka_dof_targets)
        print("self.dof_state:: ",self.dof_state)
        print("self.inital_dof_state:: ",self.inital_dof_state)
        print("self.inital_dof_state::type ",type(self.inital_dof_state))


        self.progress_buf[env_ids] = 0
        self.reset_buf[env_ids] = 0

    def pre_physics_step(self, actions):

        """
        do i need to write a controller?
        or is there a controller in background?
        (look at kuka and franka and see how they are moved)
        """
        print("pre_physics_step::called")
        # print("pre_physics_step::actions:: ",actions)
        # print("pre_physics_step::actions::shape ",actions.size())
        # print("pre_physics_step::actions::dtype ",actions.dtype)
        self.actions = actions.clone().to(self.device)
        # print("self.actions:: ",self.actions)
        self.actions =  tensor_clamp(self.actions,
                                     self.kuka_dof_lower_limits,
                                     self.kuka_dof_upper_limits
                                    )
        # print("self.actions:: ",self.actions)
        # print("gymtorch.unwrap_tensor(self.actions):: ",gymtorch.unwrap_tensor(self.actions))
        self.gym.set_dof_position_target_tensor(self.sim,
                                                gymtorch.unwrap_tensor(self.actions))

    def post_physics_step(self):
        print("post_physics_step::called")
        self.progress_buf += 1

        env_ids = self.reset_buf.nonzero(as_tuple=False).squeeze(-1)
        print("self.progress_buf:: ",self.progress_buf)
        print("env_ids:: ",env_ids)
        print("env_ids::len:: ",len(env_ids))
        if len(env_ids) > 0:
            self.reset(env_ids)

        self.compute_observations()
        self.compute_reward(self.actions)
        # self.compute_termination()


#####################################################################
###=========================jit functions=========================###
#####################################################################


@torch.jit.script
def _compute_reward(max_episode_length,num_envs,reset_buf,progress_buf):
    # type: (float,float,Tensor,Tensor) -> Tuple[Tensor, Tensor]

    ##############reward caclulation#########################
    rewards = torch.ones(int(num_envs))
    ##############termination calcilation####################

    reset_buf = torch.where(progress_buf >= max_episode_length - 1, torch.ones_like(reset_buf), reset_buf)

    return rewards, reset_buf


@torch.jit.script
def compute_grasp_transforms(hand_rot, hand_pos, franka_local_grasp_rot, franka_local_grasp_pos,
                             drawer_rot, drawer_pos, drawer_local_grasp_rot, drawer_local_grasp_pos
                             ):
    # type: (Tensor, Tensor, Tensor, Tensor, Tensor, Tensor, Tensor, Tensor) -> Tuple[Tensor, Tensor, Tensor, Tensor]

    global_franka_rot, global_franka_pos = tf_combine(
        hand_rot, hand_pos, franka_local_grasp_rot, franka_local_grasp_pos)
    global_drawer_rot, global_drawer_pos = tf_combine(
        drawer_rot, drawer_pos, drawer_local_grasp_rot, drawer_local_grasp_pos)

    return global_franka_rot, global_franka_pos, global_drawer_rot, global_drawer_pos
