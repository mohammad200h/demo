# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "sr_utilities: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(sr_utilities_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_core/sr_utilities/srv/getJointState.srv" NAME_WE)
add_custom_target(_sr_utilities_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sr_utilities" "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_core/sr_utilities/srv/getJointState.srv" "sensor_msgs/JointState:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(sr_utilities
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_core/sr_utilities/srv/getJointState.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sr_utilities
)

### Generating Module File
_generate_module_cpp(sr_utilities
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sr_utilities
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(sr_utilities_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(sr_utilities_generate_messages sr_utilities_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_core/sr_utilities/srv/getJointState.srv" NAME_WE)
add_dependencies(sr_utilities_generate_messages_cpp _sr_utilities_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sr_utilities_gencpp)
add_dependencies(sr_utilities_gencpp sr_utilities_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sr_utilities_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(sr_utilities
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_core/sr_utilities/srv/getJointState.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sr_utilities
)

### Generating Module File
_generate_module_eus(sr_utilities
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sr_utilities
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(sr_utilities_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(sr_utilities_generate_messages sr_utilities_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_core/sr_utilities/srv/getJointState.srv" NAME_WE)
add_dependencies(sr_utilities_generate_messages_eus _sr_utilities_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sr_utilities_geneus)
add_dependencies(sr_utilities_geneus sr_utilities_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sr_utilities_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(sr_utilities
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_core/sr_utilities/srv/getJointState.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sr_utilities
)

### Generating Module File
_generate_module_lisp(sr_utilities
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sr_utilities
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(sr_utilities_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(sr_utilities_generate_messages sr_utilities_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_core/sr_utilities/srv/getJointState.srv" NAME_WE)
add_dependencies(sr_utilities_generate_messages_lisp _sr_utilities_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sr_utilities_genlisp)
add_dependencies(sr_utilities_genlisp sr_utilities_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sr_utilities_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(sr_utilities
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_core/sr_utilities/srv/getJointState.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sr_utilities
)

### Generating Module File
_generate_module_nodejs(sr_utilities
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sr_utilities
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(sr_utilities_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(sr_utilities_generate_messages sr_utilities_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_core/sr_utilities/srv/getJointState.srv" NAME_WE)
add_dependencies(sr_utilities_generate_messages_nodejs _sr_utilities_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sr_utilities_gennodejs)
add_dependencies(sr_utilities_gennodejs sr_utilities_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sr_utilities_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(sr_utilities
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_core/sr_utilities/srv/getJointState.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sr_utilities
)

### Generating Module File
_generate_module_py(sr_utilities
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sr_utilities
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(sr_utilities_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(sr_utilities_generate_messages sr_utilities_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_core/sr_utilities/srv/getJointState.srv" NAME_WE)
add_dependencies(sr_utilities_generate_messages_py _sr_utilities_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sr_utilities_genpy)
add_dependencies(sr_utilities_genpy sr_utilities_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sr_utilities_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sr_utilities)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sr_utilities
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(sr_utilities_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(sr_utilities_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sr_utilities)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sr_utilities
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(sr_utilities_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(sr_utilities_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sr_utilities)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sr_utilities
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(sr_utilities_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(sr_utilities_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sr_utilities)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sr_utilities
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(sr_utilities_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(sr_utilities_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sr_utilities)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sr_utilities\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sr_utilities
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sr_utilities
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sr_utilities/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(sr_utilities_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(sr_utilities_generate_messages_py sensor_msgs_generate_messages_py)
endif()
