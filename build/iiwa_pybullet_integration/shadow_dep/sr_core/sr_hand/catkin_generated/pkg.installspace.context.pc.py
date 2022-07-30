# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "roslib;roscpp;rospy;std_msgs;std_srvs;sensor_msgs;sr_robot_msgs;control_msgs;controller_manager_msgs;sr_utilities;diagnostic_msgs;dynamic_reconfigure;self_test;urdf;gazebo_msgs;ros_ethercat_model;position_controllers".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lHandCommander;-lSrVirtual".split(';') if "-lHandCommander;-lSrVirtual" != "" else []
PROJECT_NAME = "sr_hand"
PROJECT_SPACE_DIR = "/home/mamad/Demo/demo/install"
PROJECT_VERSION = "1.4.0"
