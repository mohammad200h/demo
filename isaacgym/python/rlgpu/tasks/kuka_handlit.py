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
# sys.exit()



class Kuka_handlit(BaseTask):

    def __init__(self, cfg, sim_params, physics_engine, device_type, device_id, headless):
        # print("__init__::called")
        # print("cfg:: ",cfg)
        # print("sim_params:: ",sim_params)
        # print("physics_engine:: ",physics_engine)
        # print("device_type:: ",device_type)
        # print("device_id:: ",device_id)
        # print("headless:: ",headless)

        self.random_rest_flag = True

        self.rigid_bodies_list = ["hand_iiwa_link_ee","lh_ffdistal","lh_mfdistal","lh_rfdistal","lh_thdistal","palm_ee"]
        self.cfg = cfg
        self.sim_params = sim_params
        self.physics_engine = physics_engine
        self.aggregate_mode = self.cfg["env"]["aggregateMode"]

        self.max_episode_length = self.cfg["env"]["episodeLength"]

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

        self.cubes =[]
        self.tables = []
        self.kuka_handlits = [] 
        self.envs = []
          

        super().__init__(cfg=self.cfg)

        self.kuka_handlit_default_dof_pos = to_torch(23*[0], device=self.device)
        self.contacts = None
        # *************setting up state**************
        # get gym GPU state tensors
        actor_root_state_tensor = self.gym.acquire_actor_root_state_tensor(self.sim)
        dof_state_tensor = self.gym.acquire_dof_state_tensor(self.sim)
        rigid_body_tensor = self.gym.acquire_rigid_body_state_tensor(self.sim)

        self.gym.refresh_actor_root_state_tensor(self.sim)
        self.gym.refresh_dof_state_tensor(self.sim)
        self.gym.refresh_rigid_body_state_tensor(self.sim)


   
     
        #***************get rigidbody handle***********
        actors_name = ["kuka_handlit","table","cube"]
        link_dic = {
            "kuka_handlit":{
                            "actor":self.kuka_handlits[0],
                            "links":["hand_iiwa_link_0","hand_iiwa_link_1","hand_iiwa_link_2","hand_iiwa_link_3","hand_iiwa_link_4","hand_iiwa_link_5","hand_iiwa_link_6","hand_iiwa_link_7","hand_iiwa_link_ee",
                                     "lh_forearm","lh_palm","palm_ee"
                                     "lh_ffknuckle","lh_ffproximal","lh_ffmiddle","lh_ffdistal",
                                     "lh_mfknuckle","lh_mfproximal","lh_mfmiddle","lh_mfdistal",
                                     "lh_rfknuckle","lh_rfproximal","lh_rfmiddle","lh_rfdistal",
                                     "lh_thbase","lh_thproximal","lh_thhub","lh_thmiddle","lh_thdistal"],
                            "handles":[],
                            "index":[]
            },
            "cube":{
                 "actor":self.cubes[0],
                 "links":["baseLink"],
                  "handles":[],
                  "index":[]
            },
            "table":{
                 "actor":self.tables[0],
                 "links":["topLeft_Leg","topRight_Leg","buttomLeft_Leg","buttomRight_Leg","tableTop"],
                  "handles":[],
                  "index":[]
            }

  
        }
        self.rigid_body_dic ={}
        
        for actor in actors_name:
            for ridid_body_name in link_dic[actor]["links"]:
                handle = self.gym.get_rigid_handle(self.envs[0],actor,ridid_body_name)
                link_dic[actor]["handles"].append(handle)

                index =self.gym.find_actor_rigid_body_index(self.envs[0],link_dic[actor]["actor"],ridid_body_name,gymapi.DOMAIN_SIM)
                link_dic[actor]["index"].append(index)

                if index !=-1:
                    self.rigid_body_dic[index]= ridid_body_name


        print("link_dic[kuka_handlit][handles]:: ",link_dic["kuka_handlit"]["handles"])
        print("link_dic[cube][handles]:: ",link_dic["cube"]["handles"])
        print("link_dic[table][handles]:: ",link_dic["table"]["handles"])

        print("link_dic[kuka_handlit][index]:: ",link_dic["kuka_handlit"]["index"])
        print("link_dic[cube][index]:: ",link_dic["cube"]["index"])
        print("link_dic[table][index]:: ",link_dic["table"]["index"])

        print("rigid_body_dic:: ",self.rigid_body_dic)

        # sys.exit()
        # **********Getting index of ees**************
        dic ={
            "link_names":self.rigid_bodies_list,
            "Indexs":[]
        }
        for link_n in self.rigid_bodies_list:
            index = self.gym.find_actor_rigid_body_index(self.envs[0],self.kuka_handlits[0],link_n,gymapi.DOMAIN_SIM)
            dic["Indexs"].append(index)

        print("indexs::",dic)
        sys.exit()
        #*****breaking down state :
        self.dof_state = gymtorch.wrap_tensor(dof_state_tensor)
        self.inital_dof_state = torch.clone(self.dof_state)
        # shape :: env, degreeof freedom, pos+velocity
        self.kuka_handlit_dof_state = self.dof_state.view(self.num_envs, -1, 2)
        # print("self.dof_state:: ",self.dof_state)

        self.pos_orn_state = gymtorch.wrap_tensor(rigid_body_tensor)
        print("rigid_body_tensor::shape:: ", self.pos_orn_state.size() )
        print("rigid_body_tensor:: ", self.pos_orn_state )
        print("table::env1:: ",self.pos_orn_state[30])
        print("table::env1:: ",self.pos_orn_state[61])
        # sys.exit()
        self.pos_orn_state = self.pos_orn_state.view(self.num_envs,-1,13)
        # print("self.pos_orn_state::shape:: ",self.pos_orn_state.size())
        # print("self.pos_orn_state:: ",self.pos_orn_state)
        # kuka shape:: env,dof of kuka 
        self.kuka_joints = self.kuka_handlit_dof_state[:,:7,:] # we only need joint positon and not velocity
        self.kuka_j_pos =self.kuka_handlit_dof_state[:,:7,0]
        # print("self.kuka_joints::shape ",self.kuka_joints.size())
        # print("self.kuka_j_pos:: ",self.kuka_j_pos)
        #index 8 belong to ee this can be seen from viewer 
        self.kuka_ee_pos = self.pos_orn_state[:,8,:3]
        self.kuka_ee_orn = self.pos_orn_state[:,8,3:7]
        # hand
        self.hand_joints = self.kuka_handlit_dof_state[:,7:,:]
        self.hand_j_pos = self.kuka_handlit_dof_state[:,7:,0]
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
        
        self.num_dofs = self.gym.get_sim_dof_count(self.sim) // self.num_envs
        self.kuka_handlit_dof_targets = torch.zeros((self.num_envs, self.num_dofs), dtype=torch.float, device=self.device)

        self.global_indices = torch.arange(self.num_envs*3 , dtype=torch.int32, device=self.device).view(self.num_envs, -1)

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
        cube_asset_file = "urdf/kuka_handlit_description/cube.urdf"
        table_asset_file = "urdf/kuka_handlit_description/table.urdf"
        cabinet_asset_file = "urdf/sektion_cabinet_model/urdf/sektion_cabinet_2.urdf"
        if "asset" in self.cfg["env"]:
            asset_root = self.cfg["env"]["asset"].get("assetRoot", asset_root)

        kuka_pose = gymapi.Transform()
        # kuka_pose.p = gymapi.Vec3(0.0,-0.91,0.7478)
        kuka_pose.p = gymapi.Vec3(0.0,0.91,0.7478)
        kuka_pose.r = gymapi.Quat.from_axis_angle(gymapi.Vec3(0, 0, 1), -0.5 * math.pi)
        
        
        cube_pose = gymapi.Transform()
        cube_pose.p = gymapi.Vec3(0.0,0,4)

        table_pose = gymapi.Transform()
        table_pose.p = gymapi.Vec3(0.0, 0.0, 0.0)

        # load franka asset
        asset_options = gymapi.AssetOptions()
        asset_options.fix_base_link = True
        asset_options.collapse_fixed_joints = True
        asset_options.disable_gravity = True
        asset_options.thickness = 0.001
        asset_options.default_dof_drive_mode = gymapi.DOF_MODE_POS
        asset_options.use_mesh_materials = True
        
        cube_asset_options = gymapi.AssetOptions()
        cube_asset_options.fix_base_link = False
        cube_asset_options.disable_gravity = False
        cube_asset_options.density = 400

        table_asset_options = gymapi.AssetOptions()
        table_asset_options.flip_visual_attachments = False  #mamad: No fucking idea what that does?
        table_asset_options.fix_base_link = True
        # table_asset_options.collapse_fixed_joints = True #mamad: No fucking idea what that does?
        table_asset_options.disable_gravity = False
        table_asset_options.thickness = 0.001
        table_asset_options.default_dof_drive_mode = gymapi.DOF_MODE_NONE #mamad: No fucking idea what that does?
        table_asset_options.armature = 0.005
        table_asset_options.use_mesh_materials = True

        kuka_handlit_asset  = self.gym.load_asset(self.sim, asset_root, kuka_handlit_asset_file, asset_options)
        table_asset         = self.gym.load_asset(self.sim, asset_root, table_asset_file, table_asset_options)
        cube_asset          = self.gym.load_asset(self.sim, asset_root, cube_asset_file, cube_asset_options)
        # cube_asset = self.gym.create_box(self.sim, self.prop_width, self.prop_height, self.prop_width, cube_asset_options)
        

        self.num_kuka_handlit_dofs = self.gym.get_asset_dof_count(kuka_handlit_asset)
        # set kuka_handlit dof properties
        kuka_handlit_dof_props = self.gym.get_asset_dof_properties(kuka_handlit_asset)
        self.kuka_handlit_dof_lower_limits = []
        self.kuka_handlit_dof_upper_limits = []


        self.num_table_bodies = self.gym.get_asset_rigid_body_count(table_asset)
        self.num_kuka_handlit_bodies = self.gym.get_asset_rigid_body_count(kuka_handlit_asset)
        self.num_cube_bodies = self.gym.get_asset_rigid_body_count(cube_asset)
        self.total_num_bodies =  self.num_table_bodies+self.num_kuka_handlit_bodies+self.num_cube_bodies
        print("num_table_bodies:: ",self.num_table_bodies)
        print("num_kuka_handlit_bodies:: ",self.num_kuka_handlit_bodies)
        print("num_cube_bodies:: ",self.num_cube_bodies)
        print("total_num_bodies:: ",self.total_num_bodies)


        # sys.exit()

        for i in range(self.num_kuka_handlit_dofs):
            kuka_handlit_dof_props['driveMode'][i] = gymapi.DOF_MODE_POS

            self.kuka_handlit_dof_lower_limits.append(kuka_handlit_dof_props['lower'][i])
            self.kuka_handlit_dof_upper_limits.append(kuka_handlit_dof_props['upper'][i])

        self.kuka_handlit_dof_lower_limits = to_torch(self.kuka_handlit_dof_lower_limits, device=self.device)
        self.kuka_handlit_dof_upper_limits = to_torch(self.kuka_handlit_dof_upper_limits, device=self.device)


        for i in range(self.num_envs):
            # create env instance
            env_ptr = self.gym.create_env(self.sim, lower, upper, num_per_row)
        
            kuka_handlit_actor = self.gym.create_actor(env_ptr, kuka_handlit_asset, kuka_pose, "kuka_handlit", i)
            table_actor        = self.gym.create_actor(env_ptr, table_asset, table_pose, "table",i)
            cube_actor         = self.gym.create_actor(env_ptr, cube_asset, cube_pose, "cube",i)
            self.envs.append(env_ptr)
            self.cubes.append(cube_actor)
            self.tables.append(table_actor)
            self.kuka_handlits.append(kuka_handlit_actor)


        self.kuka_handlits = to_torch(self.kuka_handlits, dtype=torch.long, device=self.device)

    def compute_reward(self, actions):
        print("compute_reward::called")
        self.rew_buf[:], self.reset_buf[:] =_compute_reward(self.max_episode_length,self.reset_buf,self.progress_buf,self.kuka_ee_pos,self.ff_pos,self.mf_pos,self.rf_pos,self.th_pos,self.cube_pos)

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
        self.gym.refresh_net_contact_force_tensor(self.sim)
        self.contacts = gymtorch.wrap_tensor(self.gym.acquire_net_contact_force_tensor(self.sim))#.view(self.num_envs,self.total_num_bodies,-1)
        
        
        # print("contacts::shape ",self.contacts.size())
        # print("contacts:: ",self.contacts)

        #stacking element of obs

        # print("self.kuka_j_pos::shape::",self.kuka_j_pos.size())
        # print("self.hand_j_pos::shape::",self.hand_j_pos.size())

        self.obs_buf = torch.cat((self.kuka_j_pos,self.hand_j_pos),1)

        # print("self.obs_buf:: ", self.obs_buf)
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

        pos =tensor_clamp(torch.zeros(len(env_ids), self.num_kuka_handlit_dofs).to(torch.float32).to(self.device),
                            self.kuka_handlit_dof_lower_limits, self.kuka_handlit_dof_upper_limits)

        if self.random_rest_flag:
            pos = tensor_clamp(
                self.kuka_handlit_default_dof_pos.unsqueeze(0) + 0.25 * (torch.rand((len(env_ids), self.num_kuka_handlit_dofs), device=self.device) - 0.5),
                self.kuka_handlit_dof_lower_limits, self.kuka_handlit_dof_upper_limits)
        # self.kuka_handlit_dof_targets[env_ids, :self.num_kuka_handlit_dofs] = pos
        print("actor::index",self.gym.find_actor_index(self.envs[1],"kuka_handlit",gymapi.DOMAIN_SIM))
        print("actor::index",self.gym.get_actor_index(self.envs[0],2,gymapi.DOMAIN_SIM))
        print("reset::pos",pos)
        print("reset::env_ids",env_ids)
        print("reset::self.kuka_handlits",self.kuka_handlits)
        print("reset::self.kuka_handlits::len",len(self.kuka_handlits))
        print("self.num_dofs:: ",self.num_dofs)
        print("self.kuka_handlit_dof_targets::shape:: ",self.kuka_handlit_dof_targets.size())

       
        print("reset::self.dof_state",self.dof_state)
        print("reset::self.global_indices",self.global_indices)
        print("reset::multi_env_ids_int32",multi_env_ids_int32)

        kuka_handlit_indices = self.kuka_handlits[env_ids].to(torch.int32)
        self.kuka_handlit_dof_targets[env_ids, :self.num_kuka_handlit_dofs] = pos
        

        sucess=self.gym.set_dof_position_target_tensor_indexed(self.sim,
                                                        gymtorch.unwrap_tensor(self.kuka_handlit_dof_targets),
                                                        gymtorch.unwrap_tensor(multi_env_ids_int32), len(multi_env_ids_int32))
        print("sucess:",sucess)
        self.gym.set_dof_state_tensor_indexed(self.sim,
                                              gymtorch.unwrap_tensor(self.inital_dof_state),
                                              gymtorch.unwrap_tensor(multi_env_ids_int32), len(multi_env_ids_int32))

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
        print("self.progress_buf:: ",self.progress_buf)
        print("env_ids:: ",env_ids)
        print("env_ids::len:: ",len(env_ids))
        
        
        if len(env_ids) > 0:
            self.reset(env_ids)



        self.compute_observations()
        self.compute_reward(self.actions)
        # self.compute_termination()

    #utility functions
    def remove_table_and_cube(self,contact_dic):
        #removing tabe and cube form dic
        filtered_dic = contact_dic
        print("remove_table_and_cube::contact_dic:: ",contact_dic)
        for key in contact_dic.keys():
            idxs = contact_dic[key]["idx"] 
            name = contact_dic[key]["name"] 
            print("idxs::",idxs)
            print("name::",name)
            if "baseLink" in name:
                index = name.index("baseLink")
                name.remove("baseLink")
                idxs.remove(idxs[index])      
            if "tableTop" in name:
                index = name.index("tableTop")
                name.remove("tableTop")
                idxs.remove(idxs[index])
   
            print("idxs:: ",idxs)
            print("name:: ",name)
            filtered_dic[key]["idx"] =idxs 
            filtered_dic[key]["name"] =name
        
        return filtered_dic


    def get_contact_idxs(self,contact_mat):
        all_index =list(range(self.total_num_bodies*self.num_envs))
        indexs_with_no_contact = torch.where((contact_mat==torch.tensor([ 0.0000e+00,0.0000e+00,0.0000e+00]).to(self.device)).all(dim=1))[0].tolist()

        indexs_with_contact = sorted(list(set(all_index)-set(indexs_with_no_contact)))

        return indexs_with_contact

    def get_name_for_rigid_bodys_with_contact(self,idxs):
        #envid = [(idx,name)] 
        contact_dic = {}

        old_env_id = None
        for idx in idxs:
            original_map = [0,31]
            given_map = None
            lower_bound =None
            upper_bound = None
            boundary = None
            env_idx_boundary = [i*self.total_num_bodies for i in range(0,self.num_envs+1)]

            closeds_boundary = min(env_idx_boundary, key=lambda x:abs(x-idx))
            closeds_boundary_idx = env_idx_boundary.index(closeds_boundary)

            if idx<closeds_boundary:
                lower_bound = env_idx_boundary[closeds_boundary_idx-1]
                upper_bound = env_idx_boundary[closeds_boundary_idx]
            elif idx>closeds_boundary:
                lower_bound = env_idx_boundary[closeds_boundary_idx]
                upper_bound = env_idx_boundary[closeds_boundary_idx+1]

            env_id =int(lower_bound/self.total_num_bodies)

            given_map = [lower_bound,upper_bound]

            obj_handle_regardless_of_env = original_map[0]+((original_map[1]-original_map[0])/(given_map[1]-given_map[0]))*(idx-given_map[0])

            if  env_id !=old_env_id: 
                contact_dic[env_id] = {"idx":[idx],
                                       "name":[self.rigid_body_dic[obj_handle_regardless_of_env]]
                                        }
                
            else:
                contact_dic[env_id]["idx"].append(idx)
                contact_dic[env_id]["name"].append(self.rigid_body_dic[obj_handle_regardless_of_env])

            old_env_id = env_id

        # env_index_name_tuple =  (env_id,idx,self.rigid_body_dic[obj_handle_regardless_of_env])


        return contact_dic
        
    def get_rigid_bodies_pair_that_are_in_contact_with_each_other(self,contact_dic,contact_points_mat):
        # reshaping contact_mat
        # env = [(contact_pairs)]

        contacts_for_all_envs ={}
        
        env_ids = contact_dic.keys()
        # print("env_ids::",env_ids)
        # print("env_ids::type::",type(env_ids))

        for env_id in env_ids:
            idxs = contact_dic[env_id]["idx"]
            pair_dic = self.contacts_with_the_same_point(idxs,contact_points_mat)
            for key,value in pair_dic.items():
                if env_id not in contacts_for_all_envs.keys():
                    contacts_for_all_envs[env_id] = [tuple([key]+value)]
                else:
                    contacts_for_all_envs[env_id].append(tuple([key]+value))
            

        #coverting idxs to names
        old_env_id = None
        for env_id in env_ids:
            contact_pairs_per_env = contacts_for_all_envs[env_id]
            for contact_pair in contact_pairs_per_env:

                # print("contact_pair:: ",contact_pair)
                dic = self.get_name_for_rigid_bodys_with_contact(list(contact_pair))
                # print("names:: ",dic)

                if env_id !=old_env_id:
                    contacts_for_all_envs[env_id] = [tuple(dic[env_id]["name"])]
                else:
                    contacts_for_all_envs[env_id].append(tuple(dic[env_id]["name"]))

                old_env_id = env_id

        return  contacts_for_all_envs

    def contacts_with_the_same_point(self,idxs,env_contact_points):
        idx_dic = {}
        # print("env_contact_points:: ",env_contact_points)
        # print("idxs:: ",idxs)
        for idx in idxs:
            # print("idx:: ",idx)
            p = torch.abs(env_contact_points[idx,:])
            # print("p:: ",p)
            idx_for_matching_contact_point =torch.where((torch.abs(env_contact_points)==p).all(dim=1))[0].tolist() 

            print("idx_for_matching_contact_point:: ",idx_for_matching_contact_point)

            if idx_for_matching_contact_point not in idx_dic.values():
                idx_dic[idx] = idx_for_matching_contact_point

        print("idx_dic:: ",idx_dic)
        for idx in idx_dic.keys():       
            # removng idx from list of contats
            for value in idx_dic[idx]:
                if value ==idx:
                    idx_dic[idx].remove(value)

                # print("idx_dic:: ",idx_dic)
   

        # remove duplicates

        # print("idx_dic:: ",idx_dic)
        return idx_dic

    def draw_contact(self):
        print("self.contacts:: ",self.contacts)
        self.draw_points = self.contacts.view(self.num_envs,self.total_num_bodies,-1)[0]
        print("self.draw_points:: ",self.draw_points)
        all_index =list(range(self.total_num_bodies))
        indexs_with_no_contact = torch.where((self.draw_points==torch.tensor([ 0.0000e+00,0.0000e+00,0.0000e+00]).to(self.device)).all(dim=1))[0].tolist()

        indexs_with_contact = sorted(list(set(all_index)-set(indexs_with_no_contact)))
        print("indexs_with_no_contact:: ",indexs_with_no_contact)
        print("indexs_with_contact:: ",indexs_with_contact)
        if len(indexs_with_contact)>0:
            for index in indexs_with_contact:   
                print("self.draw_points[index]:: ",self.draw_points[index].tolist())
                self.gym.draw_env_rigid_contacts(self.viewer, self.envs[0], self.draw_points[index].tolist(),0.4,False)

    def get_dist_between_contacts(self,idxs,middle_contact,names):
        cascated_names =[] 
        for key in names.keys():
            cascated_names +=names[key]["name"]
        print("cascated_names:: ",cascated_names)
        # sys.exit()
        mat_with_collisiton = middle_contact[idxs]
        
        print("len(idxs):: ",len(idxs))
        for i in range(len(idxs)):
            #removing row with idx
            print("cascated_names[i]:: ",cascated_names[i])

            tmp = mat_with_collisiton - mat_with_collisiton[i] #subtract this vector form all rows

            tmp = torch.pow(tmp,2) # each element to power 2
            tmp = torch.sum(tmp,1) # sum elements in row for each row
            tmp = torch.sqrt(tmp)
            print("tmp::",tmp)
        
     
#####################################################################
###=========================jit functions=========================###
#####################################################################


@torch.jit.script
def _compute_reward(max_episode_length,reset_buf,progress_buf,ee_pos,ff_pos,mf_pos,rf_pos,th_pos,cube_pos):
    # type: (float,Tensor,Tensor,Tensor,Tensor,Tensor,Tensor,Tensor,Tensor) -> Tuple[Tensor, Tensor]
    
    

    ##############reward caclulation#########################
    ff_dist = d = torch.norm(ff_pos - cube_pos, p=2, dim=-1)
    mf_dist = d = torch.norm(mf_pos - cube_pos, p=2, dim=-1)
    rf_dist = d = torch.norm(rf_pos - cube_pos, p=2, dim=-1)
    th_dist = d = torch.norm(th_pos - cube_pos, p=2, dim=-1)

    print("th_dist::size:: ",th_dist.size())

    ee_dist = d = torch.norm(ee_pos - cube_pos, p=2, dim=-1)

    dist_reward = -1*(ff_dist+mf_dist+rf_dist+th_dist+ee_dist)
    rewards = dist_reward
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





