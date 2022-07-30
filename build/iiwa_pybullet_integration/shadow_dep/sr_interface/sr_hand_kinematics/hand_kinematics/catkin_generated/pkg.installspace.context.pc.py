# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include;/opt/ros/kinetic/share/orocos_kdl/../../include;/usr/include/eigen3".split(';') if "${prefix}/include;/opt/ros/kinetic/share/orocos_kdl/../../include;/usr/include/eigen3" != "" else []
PROJECT_CATKIN_DEPENDS = "roscpp;tf;urdf;kdl_parser;kdl_coupling;sensor_msgs;tf_conversions;moveit_core;geometry_msgs;pluginlib;moveit_msgs;moveit_ros_planning;sr_utilities".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lhand_kinematics;-lhand_kinematics_coupling_lib;/opt/ros/kinetic/lib/liborocos-kdl.so.1.3.2".split(';') if "-lhand_kinematics;-lhand_kinematics_coupling_lib;/opt/ros/kinetic/lib/liborocos-kdl.so.1.3.2" != "" else []
PROJECT_NAME = "hand_kinematics"
PROJECT_SPACE_DIR = "/home/mamad/Demo/demo/install"
PROJECT_VERSION = "1.3.0"
