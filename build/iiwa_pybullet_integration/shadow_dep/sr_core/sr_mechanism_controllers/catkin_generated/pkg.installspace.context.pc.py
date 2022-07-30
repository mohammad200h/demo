# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "std_msgs;std_srvs;roscpp;actionlib;controller_manager_msgs;sr_robot_msgs;sr_utilities;controller_interface;ros_ethercat_model;realtime_tools;velocity_controllers;pluginlib;rosconsole;angles;control_toolbox;sr_hardware_interface;xmlrpcpp".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lsr_mechanism_controllers".split(';') if "-lsr_mechanism_controllers" != "" else []
PROJECT_NAME = "sr_mechanism_controllers"
PROJECT_SPACE_DIR = "/home/mamad/Demo/demo/install"
PROJECT_VERSION = "1.4.0"
