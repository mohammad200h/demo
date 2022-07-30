# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "sr_utilities;sr_hardware_interface;sr_mechanism_model;sr_external_dependencies;sr_robot_msgs;std_srvs;diagnostic_updater;realtime_tools;controller_manager_msgs;roscpp;rospy".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lsr_hand_lib".split(';') if "-lsr_hand_lib" != "" else []
PROJECT_NAME = "sr_robot_lib"
PROJECT_SPACE_DIR = "/home/mamad/Demo/demo/install"
PROJECT_VERSION = "1.4.0"
