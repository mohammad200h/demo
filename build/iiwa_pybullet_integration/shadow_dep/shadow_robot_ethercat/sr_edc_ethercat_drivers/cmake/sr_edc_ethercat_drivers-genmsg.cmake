# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "sr_edc_ethercat_drivers: 3 messages, 0 services")

set(MSG_I_FLAGS "-Isr_edc_ethercat_drivers:/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(sr_edc_ethercat_drivers_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTraceSample.msg" NAME_WE)
add_custom_target(_sr_edc_ethercat_drivers_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sr_edc_ethercat_drivers" "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTraceSample.msg" ""
)

get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/ActuatorInfo.msg" NAME_WE)
add_custom_target(_sr_edc_ethercat_drivers_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sr_edc_ethercat_drivers" "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/ActuatorInfo.msg" ""
)

get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTrace.msg" NAME_WE)
add_custom_target(_sr_edc_ethercat_drivers_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sr_edc_ethercat_drivers" "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTrace.msg" "sr_edc_ethercat_drivers/ActuatorInfo:sr_edc_ethercat_drivers/MotorTraceSample:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(sr_edc_ethercat_drivers
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTraceSample.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sr_edc_ethercat_drivers
)
_generate_msg_cpp(sr_edc_ethercat_drivers
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/ActuatorInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sr_edc_ethercat_drivers
)
_generate_msg_cpp(sr_edc_ethercat_drivers
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTrace.msg"
  "${MSG_I_FLAGS}"
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/ActuatorInfo.msg;/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTraceSample.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sr_edc_ethercat_drivers
)

### Generating Services

### Generating Module File
_generate_module_cpp(sr_edc_ethercat_drivers
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sr_edc_ethercat_drivers
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(sr_edc_ethercat_drivers_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(sr_edc_ethercat_drivers_generate_messages sr_edc_ethercat_drivers_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTraceSample.msg" NAME_WE)
add_dependencies(sr_edc_ethercat_drivers_generate_messages_cpp _sr_edc_ethercat_drivers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/ActuatorInfo.msg" NAME_WE)
add_dependencies(sr_edc_ethercat_drivers_generate_messages_cpp _sr_edc_ethercat_drivers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTrace.msg" NAME_WE)
add_dependencies(sr_edc_ethercat_drivers_generate_messages_cpp _sr_edc_ethercat_drivers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sr_edc_ethercat_drivers_gencpp)
add_dependencies(sr_edc_ethercat_drivers_gencpp sr_edc_ethercat_drivers_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sr_edc_ethercat_drivers_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(sr_edc_ethercat_drivers
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTraceSample.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sr_edc_ethercat_drivers
)
_generate_msg_eus(sr_edc_ethercat_drivers
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/ActuatorInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sr_edc_ethercat_drivers
)
_generate_msg_eus(sr_edc_ethercat_drivers
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTrace.msg"
  "${MSG_I_FLAGS}"
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/ActuatorInfo.msg;/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTraceSample.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sr_edc_ethercat_drivers
)

### Generating Services

### Generating Module File
_generate_module_eus(sr_edc_ethercat_drivers
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sr_edc_ethercat_drivers
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(sr_edc_ethercat_drivers_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(sr_edc_ethercat_drivers_generate_messages sr_edc_ethercat_drivers_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTraceSample.msg" NAME_WE)
add_dependencies(sr_edc_ethercat_drivers_generate_messages_eus _sr_edc_ethercat_drivers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/ActuatorInfo.msg" NAME_WE)
add_dependencies(sr_edc_ethercat_drivers_generate_messages_eus _sr_edc_ethercat_drivers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTrace.msg" NAME_WE)
add_dependencies(sr_edc_ethercat_drivers_generate_messages_eus _sr_edc_ethercat_drivers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sr_edc_ethercat_drivers_geneus)
add_dependencies(sr_edc_ethercat_drivers_geneus sr_edc_ethercat_drivers_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sr_edc_ethercat_drivers_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(sr_edc_ethercat_drivers
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTraceSample.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sr_edc_ethercat_drivers
)
_generate_msg_lisp(sr_edc_ethercat_drivers
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/ActuatorInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sr_edc_ethercat_drivers
)
_generate_msg_lisp(sr_edc_ethercat_drivers
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTrace.msg"
  "${MSG_I_FLAGS}"
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/ActuatorInfo.msg;/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTraceSample.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sr_edc_ethercat_drivers
)

### Generating Services

### Generating Module File
_generate_module_lisp(sr_edc_ethercat_drivers
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sr_edc_ethercat_drivers
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(sr_edc_ethercat_drivers_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(sr_edc_ethercat_drivers_generate_messages sr_edc_ethercat_drivers_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTraceSample.msg" NAME_WE)
add_dependencies(sr_edc_ethercat_drivers_generate_messages_lisp _sr_edc_ethercat_drivers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/ActuatorInfo.msg" NAME_WE)
add_dependencies(sr_edc_ethercat_drivers_generate_messages_lisp _sr_edc_ethercat_drivers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTrace.msg" NAME_WE)
add_dependencies(sr_edc_ethercat_drivers_generate_messages_lisp _sr_edc_ethercat_drivers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sr_edc_ethercat_drivers_genlisp)
add_dependencies(sr_edc_ethercat_drivers_genlisp sr_edc_ethercat_drivers_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sr_edc_ethercat_drivers_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(sr_edc_ethercat_drivers
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTraceSample.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sr_edc_ethercat_drivers
)
_generate_msg_nodejs(sr_edc_ethercat_drivers
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/ActuatorInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sr_edc_ethercat_drivers
)
_generate_msg_nodejs(sr_edc_ethercat_drivers
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTrace.msg"
  "${MSG_I_FLAGS}"
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/ActuatorInfo.msg;/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTraceSample.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sr_edc_ethercat_drivers
)

### Generating Services

### Generating Module File
_generate_module_nodejs(sr_edc_ethercat_drivers
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sr_edc_ethercat_drivers
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(sr_edc_ethercat_drivers_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(sr_edc_ethercat_drivers_generate_messages sr_edc_ethercat_drivers_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTraceSample.msg" NAME_WE)
add_dependencies(sr_edc_ethercat_drivers_generate_messages_nodejs _sr_edc_ethercat_drivers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/ActuatorInfo.msg" NAME_WE)
add_dependencies(sr_edc_ethercat_drivers_generate_messages_nodejs _sr_edc_ethercat_drivers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTrace.msg" NAME_WE)
add_dependencies(sr_edc_ethercat_drivers_generate_messages_nodejs _sr_edc_ethercat_drivers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sr_edc_ethercat_drivers_gennodejs)
add_dependencies(sr_edc_ethercat_drivers_gennodejs sr_edc_ethercat_drivers_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sr_edc_ethercat_drivers_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(sr_edc_ethercat_drivers
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTraceSample.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sr_edc_ethercat_drivers
)
_generate_msg_py(sr_edc_ethercat_drivers
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/ActuatorInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sr_edc_ethercat_drivers
)
_generate_msg_py(sr_edc_ethercat_drivers
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTrace.msg"
  "${MSG_I_FLAGS}"
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/ActuatorInfo.msg;/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTraceSample.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sr_edc_ethercat_drivers
)

### Generating Services

### Generating Module File
_generate_module_py(sr_edc_ethercat_drivers
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sr_edc_ethercat_drivers
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(sr_edc_ethercat_drivers_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(sr_edc_ethercat_drivers_generate_messages sr_edc_ethercat_drivers_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTraceSample.msg" NAME_WE)
add_dependencies(sr_edc_ethercat_drivers_generate_messages_py _sr_edc_ethercat_drivers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/ActuatorInfo.msg" NAME_WE)
add_dependencies(sr_edc_ethercat_drivers_generate_messages_py _sr_edc_ethercat_drivers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_ethercat_drivers/msg/MotorTrace.msg" NAME_WE)
add_dependencies(sr_edc_ethercat_drivers_generate_messages_py _sr_edc_ethercat_drivers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sr_edc_ethercat_drivers_genpy)
add_dependencies(sr_edc_ethercat_drivers_genpy sr_edc_ethercat_drivers_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sr_edc_ethercat_drivers_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sr_edc_ethercat_drivers)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sr_edc_ethercat_drivers
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(sr_edc_ethercat_drivers_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sr_edc_ethercat_drivers)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sr_edc_ethercat_drivers
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(sr_edc_ethercat_drivers_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sr_edc_ethercat_drivers)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sr_edc_ethercat_drivers
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(sr_edc_ethercat_drivers_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sr_edc_ethercat_drivers)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sr_edc_ethercat_drivers
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(sr_edc_ethercat_drivers_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sr_edc_ethercat_drivers)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sr_edc_ethercat_drivers\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sr_edc_ethercat_drivers
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(sr_edc_ethercat_drivers_generate_messages_py std_msgs_generate_messages_py)
endif()
