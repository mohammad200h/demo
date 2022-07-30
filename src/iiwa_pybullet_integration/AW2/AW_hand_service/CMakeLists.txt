cmake_minimum_required(VERSION 2.8.3)
project(AW_hand_service)


add_compile_options(-std=c++14)



## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED 
    COMPONENTS 
    moveit_core 
    moveit_ros_planning 
    moveit_ros_planning_interface 
    pluginlib 
    cmake_modules 
    bio_ik
    tf
    cw3_helper 
    pcl_ros
    roscpp
    sensor_msgs
    rospy
    std_msgs
    message_generation)

find_package(Boost REQUIRED system filesystem date_time thread)
find_package(Eigen REQUIRED)
add_service_files(
  DIRECTORY srv
  FILES
  moveObj.srv
  moveRobot.srv
)
generate_messages(
  DEPENDENCIES
  std_msgs
  sensor_msgs
)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES 
  CATKIN_DEPENDS 
    moveit_core
    moveit_ros_planning_interface
    interactive_markers 
    bio_ik
    cw3_helper
    tf
    pcl_ros
    roscpp
    sensor_msgs
    message_runtime 
    std_msgs
    
    
)


###########
## Build ##
###########


include_directories(SYSTEM ${Boost_INCLUDE_DIR} ${EIGEN_INCLUDE_DIRS})
include_directories(${catkin_INCLUDE_DIRS})
include_directories(${bio_ik_INCLUDE_DIRS})
link_directories(${catkin_LIBRARY_DIRS})


add_executable(AW_moveitInterface src/AW_moveitInterface.cpp)
add_dependencies(AW_moveitInterface ${catkin_EXPORTED_TARGETS})
target_link_libraries(AW_moveitInterface ${catkin_LIBRARIES} ${Boost_LIBRARIES})
install(TARGETS AW_moveitInterface DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})



