# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "cw3_helper: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(cw3_helper_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/cw3_helper/srv/ChangeCollisionObject.srv" NAME_WE)
add_custom_target(_cw3_helper_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cw3_helper" "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/cw3_helper/srv/ChangeCollisionObject.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(cw3_helper
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/cw3_helper/srv/ChangeCollisionObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cw3_helper
)

### Generating Module File
_generate_module_cpp(cw3_helper
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cw3_helper
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(cw3_helper_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(cw3_helper_generate_messages cw3_helper_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/cw3_helper/srv/ChangeCollisionObject.srv" NAME_WE)
add_dependencies(cw3_helper_generate_messages_cpp _cw3_helper_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cw3_helper_gencpp)
add_dependencies(cw3_helper_gencpp cw3_helper_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cw3_helper_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(cw3_helper
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/cw3_helper/srv/ChangeCollisionObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cw3_helper
)

### Generating Module File
_generate_module_eus(cw3_helper
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cw3_helper
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(cw3_helper_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(cw3_helper_generate_messages cw3_helper_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/cw3_helper/srv/ChangeCollisionObject.srv" NAME_WE)
add_dependencies(cw3_helper_generate_messages_eus _cw3_helper_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cw3_helper_geneus)
add_dependencies(cw3_helper_geneus cw3_helper_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cw3_helper_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(cw3_helper
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/cw3_helper/srv/ChangeCollisionObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cw3_helper
)

### Generating Module File
_generate_module_lisp(cw3_helper
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cw3_helper
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(cw3_helper_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(cw3_helper_generate_messages cw3_helper_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/cw3_helper/srv/ChangeCollisionObject.srv" NAME_WE)
add_dependencies(cw3_helper_generate_messages_lisp _cw3_helper_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cw3_helper_genlisp)
add_dependencies(cw3_helper_genlisp cw3_helper_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cw3_helper_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(cw3_helper
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/cw3_helper/srv/ChangeCollisionObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cw3_helper
)

### Generating Module File
_generate_module_nodejs(cw3_helper
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cw3_helper
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(cw3_helper_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(cw3_helper_generate_messages cw3_helper_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/cw3_helper/srv/ChangeCollisionObject.srv" NAME_WE)
add_dependencies(cw3_helper_generate_messages_nodejs _cw3_helper_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cw3_helper_gennodejs)
add_dependencies(cw3_helper_gennodejs cw3_helper_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cw3_helper_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(cw3_helper
  "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/cw3_helper/srv/ChangeCollisionObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cw3_helper
)

### Generating Module File
_generate_module_py(cw3_helper
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cw3_helper
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(cw3_helper_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(cw3_helper_generate_messages cw3_helper_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/cw3_helper/srv/ChangeCollisionObject.srv" NAME_WE)
add_dependencies(cw3_helper_generate_messages_py _cw3_helper_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cw3_helper_genpy)
add_dependencies(cw3_helper_genpy cw3_helper_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cw3_helper_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cw3_helper)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cw3_helper
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(cw3_helper_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cw3_helper)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cw3_helper
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(cw3_helper_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cw3_helper)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cw3_helper
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(cw3_helper_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cw3_helper)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cw3_helper
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(cw3_helper_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cw3_helper)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cw3_helper\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cw3_helper
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cw3_helper
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cw3_helper/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(cw3_helper_generate_messages_py std_msgs_generate_messages_py)
endif()
