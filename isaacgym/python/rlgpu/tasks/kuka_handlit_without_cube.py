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



class Kuka_handlit(BaseTask):

    def __init__(self, cfg, sim_params, physics_engine, device_type, device_id, headless):
        print("__init__::called")
        
        self.rigid_bodies_list = ["hand_iiwa_link_ee","lh_ffdistal","lh_mfdistal","lh_rfdistal","lh_thdistal"]
        self.cfg = cfg
        self.sim_params = sim_params
        self.physics_engine = physics_engine
        self.aggregate_mode = self.cfg["env"]["aggregateMode"]

        self.cfg["device_type"] = device_type
        self.cfg["device_id"] = device_id
        self.cfg["headless"] =headless

        self.cfg["env"]["numObservations"] = 23
        self.cfg["env"]["numActions"] = 23

        self.up_axis = "z"
        self.up_axis_idx = 2


        # prop dimensions
        self.prop_width = 0.08
        self.prop_height = 0.08
        self.prop_length = 0.08
        self.prop_spacing = 0.09

        super().__init__(cfg=self.cfg)






        self.kuka_handlit_default_dof_pos = to_torch(23*[0])

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
            index = self.gym.find_actor_rigid_body_index(self.envs[0],self.kuka_handlits[0],link_n,gymapi.DOMAIN_SIM)
            dic["Indexs"].append(index)

        print("indexs::",dic)
        #*****breaking down state :
        self.dof_state = gymtorch.wrap_tensor(dof_state_tensor)
        # shape :: env, degreeof freedom, pos+velocity
        self.dof_state = self.dof_state.view(self.num_envs, -1, 2)
        
        self.pos_orn_state = gymtorch.wrap_tensor(rigid_body_tensor)
        self.pos_orn_state = self.pos_orn_state.view(self.num_envs,-1,13)
        print("self.pos_orn_state::shape:: ",self.pos_orn_state.size())
        print("self.pos_orn_state:: ",self.pos_orn_state)
        # kuka shape:: env,dof of kuka 
        self.kuka_joints = self.dof_state[:,:7,:] # we only need joint positon and not velocity
        self.kuka_j_pos =self.dof_state[:,:7,0]
        # print("self.kuka_joints::shape ",self.kuka_joints.size())
        # print("self.kuka_j_pos:: ",self.kuka_j_pos)
        #index 8 belong to ee this can be seen from viewer 
        self.kuka_ee_pos = self.pos_orn_state[:,8,:3]
        self.kuka_ee_orn = self.pos_orn_state[:,8,3:7]
        # hand
        self.hand_joints = self.dof_state[:,7:,:]
        self.hand_j_pos = self.dof_state[:,7:,0]
        # print("self.hand_j_pos:: ",self.hand_j_pos)
        self.palm_pos = None # I have to add visual link to the middle of the palm
        self.palm_orn = None #I have to add visual link to the middle of the palm
        self.ff_pos = self.pos_orn_state[:,11,:3]
        self.ff_orn = self.pos_orn_state[:,11,3:7]
        self.mf_pos = self.pos_orn_state[:,15,:3]
        self.mf_orn = self.pos_orn_state[:,15,3:7]
        self.rf_pos = self.pos_orn_state[:,19,:3]
        self.rf_orn = self.pos_orn_state[:,19,3:7]
        self.th_pos = self.pos_orn_state[:,23,:3]
        self.th_orn = self.pos_orn_state[:,23,3:7]
        #cube
        self.cube_pos = self.pos_orn_state[:,-1,:3]
        self.cube_orn = self.pos_orn_state[:,-1,3:7]
        # print(" self.cube_pos:: ", self.cube_pos)
        # print(" self.cube_orn:: ", self.cube_orn)
        #********************************************
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
        kuka_handlit_asset_file = "urdf/kuka_handlit_description/handlit_iiwa7_noTable.urdf"
        table_asset_file = "urdf/kuka_handlit_description/table.urdf"
        cube_asset_file = "urdf/objects/cube_multicolor.urdf"#"urdf/kuka_handlit_description/cube.urdf"

        if "asset" in self.cfg["env"]:
            asset_root = self.cfg["env"]["asset"].get("assetRoot", asset_root)
            kuka_handlit_asset_file = self.cfg["env"]["asset"].get("assetFileNameFranka", kuka_handlit_asset_file)
           
        # load franka asset
        asset_options = gymapi.AssetOptions()
        # asset_options.flip_visual_attachments = True
        asset_options.fix_base_link = True
        asset_options.collapse_fixed_joints = True
        asset_options.disable_gravity = True
        asset_options.thickness = 0.001
        asset_options.default_dof_drive_mode = gymapi.DOF_MODE_POS
        asset_options.use_mesh_materials = True
        kuka_handlit_asset = self.gym.load_asset(self.sim, asset_root, kuka_handlit_asset_file, asset_options)

       
        table_asset_options = gymapi.AssetOptions()
        table_asset_options.flip_visual_attachments = False  #mamad: No fucking idea what that does?
        table_asset_options.fix_base_link = True
        # table_asset_options.collapse_fixed_joints = True #mamad: No fucking idea what that does?
        table_asset_options.disable_gravity = False
        # table_asset_options.thickness = 0.001
        table_asset_options.default_dof_drive_mode = gymapi.DOF_MODE_NONE #mamad: No fucking idea what that does?
        # table_asset_options.armature = 0.005
        table_asset_options.use_mesh_materials = True

        cube_asset_options = gymapi.AssetOptions()
        # cube_asset_options.density = 400
        #cube_asset_options.flip_visual_attachments = True
        # cube_asset_options.fix_base_link = True
        # cube_asset_options.disable_gravity = True



        # load table asset
        table_asset = self.gym.load_asset(self.sim, asset_root, table_asset_file, table_asset_options)
        # load cube asset
        cube_asset = self.gym.load_asset(self.sim, asset_root, cube_asset_file, cube_asset_options)
        # cube_asset = self.gym.create_box(self.sim, self.prop_width, self.prop_height, self.prop_width, cube_asset_options)
        self.num_kuka_handlit_bodies = self.gym.get_asset_rigid_body_count(kuka_handlit_asset)
        self.num_kuka_handlit_dofs = self.gym.get_asset_dof_count(kuka_handlit_asset)
        
        self.num_table_bodies = self.gym.get_asset_rigid_body_count(table_asset)
        self.num_cube_bodies = self.gym.get_asset_rigid_body_count(cube_asset)

        print("num kuka_handlit bodies: ", self.num_kuka_handlit_bodies)
        print("num table bodies: ", self.num_table_bodies)
        print("num cube bodies: ", self.num_cube_bodies)
        print("num total: ", self.num_cube_bodies+self.num_kuka_handlit_bodies+self.num_table_bodies)
        print("num kuka_handlit dofs: ", self.num_kuka_handlit_dofs)


        # set franka dof properties
        kuka_handlit_dof_props = self.gym.get_asset_dof_properties(kuka_handlit_asset)
        self.kuka_handlit_dof_lower_limits = []
        self.kuka_handlit_dof_upper_limits = []
        
        for i in range(self.num_kuka_handlit_dofs):
            kuka_handlit_dof_props['driveMode'][i] = gymapi.DOF_MODE_POS
            """
            if self.physics_engine == gymapi.SIM_PHYSX:
                kuka_handlit_dof_props['stiffness'][i] = franka_dof_stiffness[i]
                kuka_handlit_dof_props['damping'][i] = franka_dof_damping[i]
            else:
                kuka_handlit_dof_props['stiffness'][i] = 7000.0
                kuka_handlit_dof_props['damping'][i] = 50.0
            """
            self.kuka_handlit_dof_lower_limits.append(kuka_handlit_dof_props['lower'][i])
            self.kuka_handlit_dof_upper_limits.append(kuka_handlit_dof_props['upper'][i])

        self.kuka_handlit_dof_lower_limits = to_torch(self.kuka_handlit_dof_lower_limits, device=self.device)
        self.kuka_handlit_dof_upper_limits = to_torch(self.kuka_handlit_dof_upper_limits, device=self.device)
  
       
        kuka_handlit_dof_props['effort'][8] = 200



        kuka_pose = gymapi.Transform()
        # kuka_pose.p = gymapi.Vec3(0.0,-0.91,0.7478)
        kuka_pose.p = gymapi.Vec3(0.0,-0.91,0.7478)
        kuka_pose.r = gymapi.Quat.from_axis_angle(gymapi.Vec3(0, 0, 1), -0.5 * math.pi)
        
        
        table_pose = gymapi.Transform()
        table_pose.p = gymapi.Vec3(0.0, 0.0, 0.0)
        # table_pose.r = gymapi.Quat.from_axis_angle(gymapi.Vec3(0, 0, 1), -0.5 * math.pi)
        
        
        cube_pose = gymapi.Transform()
        cube_pose.p = gymapi.Vec3(0.0, 0.0,0.9)
        # cube_pose.r = gymapi.Quat.from_axis_angle(gymapi.Vec3(0, 0, 1), -0.5 * math.pi)

 

        # compute aggregate size
        num_franka_bodies = self.gym.get_asset_rigid_body_count(kuka_handlit_asset)
        num_franka_shapes = self.gym.get_asset_rigid_shape_count(kuka_handlit_asset)
        num_table_bodies = self.gym.get_asset_rigid_body_count(table_asset)
        num_table_shapes = self.gym.get_asset_rigid_shape_count(table_asset)
        num_cube_bodies = self.gym.get_asset_rigid_body_count(cube_asset)
        num_cube_shapes = self.gym.get_asset_rigid_shape_count(cube_asset)

        max_agg_bodies = num_franka_bodies + num_cube_bodies + num_table_bodies
        max_agg_shapes = num_franka_shapes + num_cube_shapes + num_table_shapes

        self.kuka_handlits = []
        self.cabinets = []
        self.default_prop_states = []
        self.prop_start = []
        self.envs = []

        for i in range(self.num_envs):
            # create env instance
            env_ptr = self.gym.create_env(
                self.sim, lower, upper, num_per_row
            )

            if self.aggregate_mode >= 3:
              self.gym.begin_aggregate(env_ptr, max_agg_bodies, max_agg_shapes, True)

            kuka_handlit_actor = self.gym.create_actor(env_ptr, kuka_handlit_asset, kuka_pose, "kuka_handlit", i, 1, 0)
            table_actor        = self.gym.create_actor(env_ptr, table_asset, table_pose, "table", i, 1, 0)
            cube_actor         = self.gym.create_actor(env_ptr, cube_asset, cube_pose, "cube", i, 1, 0)
            
            

            self.gym.set_actor_dof_properties(env_ptr, kuka_handlit_actor, kuka_handlit_dof_props)
        
            if self.aggregate_mode == 2:
                self.gym.begin_aggregate(env_ptr, max_agg_bodies, max_agg_shapes, True)



            if self.aggregate_mode == 1:
                self.gym.begin_aggregate(env_ptr, max_agg_bodies, max_agg_shapes, True)


            if self.aggregate_mode > 0:
                self.gym.end_aggregate(env_ptr)
        
            self.envs.append(env_ptr)
            self.kuka_handlits.append(kuka_handlit_actor)
            
        

        self.hand_handle = self.gym.find_actor_rigid_body_handle(env_ptr, kuka_handlit_actor, "hand_iiwa_link_ee")
        

        # self.default_prop_states = to_torch(self.default_prop_states, device=self.device, dtype=torch.float).view(self.num_envs, self.num_props, 13)

        # self.init_data()


    def compute_reward(self, actions):
        print("compute_reward::called")
        pass

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

        print("self.kuka_j_pos::shape::",self.kuka_j_pos.size())
        print("self.hand_j_pos::shape::",self.hand_j_pos.size())

        self.obs_buf = torch.cat((self.kuka_j_pos,self.hand_j_pos),1)

        print("self.obs_buf:: ", self.obs_buf)
        print("self.obs_buf::shape ", self.obs_buf.size())
        return self.obs_buf

    def compute_termination(self):
        print("compute_termination::called")
        pass

    def reset(self, env_ids):
        print("reset::called")
        env_ids_int32 = env_ids.to(dtype=torch.int32)
        print("reset::called::1")
        # reset franka
        pos = tensor_clamp(
            self.kuka_handlit_default_dof_pos.unsqueeze(0) + 0.25 * (torch.rand((len(env_ids), self.num_kuka_handlit_dofs), device=self.device) - 0.5),
            self.kuka_handlit_dof_lower_limits, self.kuka_handlit_dof_upper_limits)
       

        print("reset::called::2")


        env_ids_int32 = env_ids.to(dtype=torch.int32)    
        # print("self.dof_state:: ",self.dof_state)
        # print("gymtorch.unwrap_tensor(self.dof_state):: ",gymtorch.unwrap_tensor(self.dof_state))
        # print("env_ids_int32:: ",env_ids_int32)
        # print("gymtorch.unwrap_tensor(env_ids_int32):: ",gymtorch.unwrap_tensor(env_ids_int32))
        self.gym.set_dof_state_tensor_indexed(self.sim,
                                              gymtorch.unwrap_tensor(self.dof_state),
                                              gymtorch.unwrap_tensor(env_ids_int32), len(env_ids_int32))
        # print("reset::called::3")
        # print("reset::self.num_envs",self.num_envs)
        # print("reset::env_ids::type",env_ids.size())
        # print("reset::env_ids::type",type(env_ids))
        # print("reset::self.progress_buf",self.progress_buf.size())
        self.progress_buf[env_ids] = 0
        self.reset_buf[env_ids] = 0

    def pre_physics_step(self, actions):

        """
        do i need to write a controller?
        or is there a controller in background?
        (look at kuka and franka and see how they are moved)
        """

        print("pre_physics_step::called")

        # print("actions:: ",actions)




        self.actions = actions.clone().to(self.device)
        # print("self.actions:: ",self.actions)
        self.actions =  tensor_clamp(self.actions,
                                     self.kuka_handlit_dof_lower_limits,
                                     self.kuka_handlit_dof_upper_limits
                                    )
        # print("self.actions:: ",self.actions)
        # print("gymtorch.unwrap_tensor(self.actions):: ",gymtorch.unwrap_tensor(self.actions))
        self.gym.set_dof_position_target_tensor(self.sim,
                                                gymtorch.unwrap_tensor(self.actions))

    def post_physics_step(self):
        print("post_physics_step::called")
        self.progress_buf += 1

        env_ids = self.reset_buf.nonzero(as_tuple=False).squeeze(-1)
        if len(env_ids) > 0:
            self.reset(env_ids)

        self.compute_observations()
        self.compute_reward(self.actions)
        self.compute_termination()


#####################################################################
###=========================jit functions=========================###
#####################################################################


@torch.jit.script
def compute_franka_reward(
    reset_buf, progress_buf, actions, cabinet_dof_pos,
    franka_grasp_pos, drawer_grasp_pos, franka_grasp_rot, drawer_grasp_rot,
    franka_lfinger_pos, franka_rfinger_pos,
    gripper_forward_axis, drawer_inward_axis, gripper_up_axis, drawer_up_axis,
    num_envs, dist_reward_scale, rot_reward_scale, around_handle_reward_scale, open_reward_scale,
    finger_dist_reward_scale, action_penalty_scale, distX_offset, max_episode_length
):
    # type: (Tensor, Tensor, Tensor, Tensor, Tensor, Tensor, Tensor, Tensor, Tensor, Tensor, Tensor, Tensor, Tensor, Tensor, int, float, float, float, float, float, float, float, float) -> Tuple[Tensor, Tensor]

    # distance from hand to the drawer
    d = torch.norm(franka_grasp_pos - drawer_grasp_pos, p=2, dim=-1)
    dist_reward = 1.0 / (1.0 + d ** 2)
    dist_reward *= dist_reward
    dist_reward = torch.where(d <= 0.02, dist_reward * 2, dist_reward)

    axis1 = tf_vector(franka_grasp_rot, gripper_forward_axis)
    axis2 = tf_vector(drawer_grasp_rot, drawer_inward_axis)
    axis3 = tf_vector(franka_grasp_rot, gripper_up_axis)
    axis4 = tf_vector(drawer_grasp_rot, drawer_up_axis)

    dot1 = torch.bmm(axis1.view(num_envs, 1, 3), axis2.view(num_envs, 3, 1)).squeeze(-1).squeeze(-1)  # alignment of forward axis for gripper
    dot2 = torch.bmm(axis3.view(num_envs, 1, 3), axis4.view(num_envs, 3, 1)).squeeze(-1).squeeze(-1)  # alignment of up axis for gripper
    # reward for matching the orientation of the hand to the drawer (fingers wrapped)
    rot_reward = 0.5 * (torch.sign(dot1) * dot1 ** 2 + torch.sign(dot2) * dot2 ** 2)

    # bonus if left finger is above the drawer handle and right below
    around_handle_reward = torch.zeros_like(rot_reward)
    around_handle_reward = torch.where(franka_lfinger_pos[:, 2] > drawer_grasp_pos[:, 2],
                                       torch.where(franka_rfinger_pos[:, 2] < drawer_grasp_pos[:, 2],
                                                   around_handle_reward + 0.5, around_handle_reward), around_handle_reward)
    # reward for distance of each finger from the drawer
    finger_dist_reward = torch.zeros_like(rot_reward)
    lfinger_dist = torch.abs(franka_lfinger_pos[:, 2] - drawer_grasp_pos[:, 2])
    rfinger_dist = torch.abs(franka_rfinger_pos[:, 2] - drawer_grasp_pos[:, 2])
    finger_dist_reward = torch.where(franka_lfinger_pos[:, 2] > drawer_grasp_pos[:, 2],
                                     torch.where(franka_rfinger_pos[:, 2] < drawer_grasp_pos[:, 2],
                                                 (0.04 - lfinger_dist) + (0.04 - rfinger_dist), finger_dist_reward), finger_dist_reward)

    # regularization on the actions (summed for each environment)
    action_penalty = torch.sum(actions ** 2, dim=-1)

    # how far the cabinet has been opened out
    open_reward = cabinet_dof_pos[:, 3]  # drawer_top_joint

    rewards = dist_reward_scale * dist_reward + rot_reward_scale * rot_reward \
        + around_handle_reward_scale * around_handle_reward + open_reward_scale * open_reward \
        + finger_dist_reward_scale * finger_dist_reward - action_penalty_scale * action_penalty

    rewards = torch.where(open_reward > 0.38, rewards + 1.0,
                          torch.where(open_reward > 0.2, rewards + 0.8,
                                      torch.where(open_reward > 0.15, rewards + 0.65,
                                                  torch.where(open_reward > 0.1, rewards + 0.5,
                                                              torch.where(open_reward > 0.05, rewards + 0.35,
                                                                          torch.where(open_reward > 0.01, rewards + 0.25,
                                                                                      torch.where(open_reward > 0.0, rewards + 0.15, rewards)))))))

    rewards = torch.where(franka_lfinger_pos[:, 0] < drawer_grasp_pos[:, 0] - distX_offset,
                          torch.ones_like(rewards) * -1, rewards)
    rewards = torch.where(franka_rfinger_pos[:, 0] < drawer_grasp_pos[:, 0] - distX_offset,
                          torch.ones_like(rewards) * -1, rewards)

    reset_buf = torch.where(franka_lfinger_pos[:, 0] < drawer_grasp_pos[:, 0] - distX_offset,
                            torch.ones_like(reset_buf), reset_buf)
    reset_buf = torch.where(franka_rfinger_pos[:, 0] < drawer_grasp_pos[:, 0] - distX_offset,
                            torch.ones_like(reset_buf), reset_buf)
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
