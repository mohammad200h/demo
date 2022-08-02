from isaacgym import gymapi
import math

gym = gymapi.acquire_gym()
# get default set of parameters
sim_params = gymapi.SimParams()

# set common parameters
sim_params.dt = 1 / 60
sim_params.substeps = 2
sim_params.up_axis = gymapi.UP_AXIS_Z
sim_params.gravity = gymapi.Vec3(0.0, 0.0, -9.8)

# set PhysX-specific parameters
sim_params.physx.use_gpu = True
sim_params.physx.solver_type = 1
sim_params.physx.num_position_iterations = 6
sim_params.physx.num_velocity_iterations = 1
sim_params.physx.contact_offset = 0.01
sim_params.physx.rest_offset = 0.0

# set Flex-specific parameters
sim_params.flex.solver_type = 5
sim_params.flex.num_outer_iterations = 4
sim_params.flex.num_inner_iterations = 20
sim_params.flex.relaxation = 0.8
sim_params.flex.warm_start = 0.5

# create sim with these parameters

compute_device_id = 0
graphics_device_id = 0
sim = gym.create_sim(compute_device_id, graphics_device_id, gymapi.SIM_PHYSX, sim_params)

asset_root = "./assets"
kuka_handlit_asset_file = "urdf/kuka_handlit_description/handlit_iiwa7_noTable.urdf"
table_asset_file = "urdf/kuka_handlit_description/table.urdf"
cube_asset_file = "urdf/kuka_handlit_description/cube.urdf"
asset_options = gymapi.AssetOptions()
# asset_options.flip_visual_attachments = False
# asset_options.fix_base_link = True
# asset_options.collapse_fixed_joints = True
# asset_options.disable_gravity = True
# asset_options.thickness = 0.001
# asset_options.angular_damping = 0.01

# asset_options.use_physx_armature = True
# asset_options.default_dof_drive_mode = gymapi.DOF_MODE_NONE

kuka_asset = gym.load_asset(sim, asset_root, kuka_handlit_asset_file,asset_options)
table_asset = gym.load_asset(sim, asset_root, table_asset_file,asset_options)
cube_asset = gym.load_asset(sim, asset_root, cube_asset_file,asset_options)

spacing = 2.0
lower = gymapi.Vec3(-spacing, 0.0, -spacing)
upper = gymapi.Vec3(spacing, spacing, spacing)

plane_params = gymapi.PlaneParams()
plane_params.normal = gymapi.Vec3(0.0, 0.0, 1.0)
gym.add_ground(sim, plane_params)

env = gym.create_env(sim, lower, upper, 8)

# -0.015,-0.91,0.7478

kuka_pose = gymapi.Transform()
kuka_pose.p = gymapi.Vec3(0.0,-0.91,0.7478)
kuka_pose.r = gymapi.Quat.from_axis_angle(gymapi.Vec3(0, 0, 1), -0.5 * math.pi)


pose = gymapi.Transform()
pose.p = gymapi.Vec3(0.0, 0.0, 0.0)
# pose.r = gymapi.Quat.from_axis_angle(gymapi.Vec3(0, 0, 1), -0.5 * math.pi)


cube_pose = gymapi.Transform()
cube_pose.p = gymapi.Vec3(0.0, 0.0, 0.8)
# cube_pose.r = gymapi.Quat.from_axis_angle(gymapi.Vec3(0, 0, 1), -0.5 * math.pi)



kuka_actor_handle = gym.create_actor(env, kuka_asset, kuka_pose, "Kuka_handlit_Actor", 0, 1)
table_actor_handle = gym.create_actor(env, table_asset, pose, "Table_Actor", 0, 1)
cube_actor_handle = gym.create_actor(env, cube_asset, cube_pose, "Cube_Actor", 0, 1)

cam_props = gymapi.CameraProperties()
viewer = gym.create_viewer(sim, cam_props)
cam_pos = gymapi.Vec3(5.0, 5.0,5.0)
cam_target = gymapi.Vec3(0.0, 0.0, 0.0)
gym.viewer_camera_look_at(viewer, None, cam_pos, cam_target)

while(1):
    gym.step_graphics(sim)
    gym.draw_viewer(viewer, sim, True)