# Install script for directory: /home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_interface/sr_robot_launch

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/mamad/Demo/demo/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/mamad/Demo/demo/build/iiwa_pybullet_integration/shadow_dep/sr_interface/sr_robot_launch/catkin_generated/installspace/sr_robot_launch.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sr_robot_launch/cmake" TYPE FILE FILES
    "/home/mamad/Demo/demo/build/iiwa_pybullet_integration/shadow_dep/sr_interface/sr_robot_launch/catkin_generated/installspace/sr_robot_launchConfig.cmake"
    "/home/mamad/Demo/demo/build/iiwa_pybullet_integration/shadow_dep/sr_interface/sr_robot_launch/catkin_generated/installspace/sr_robot_launchConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sr_robot_launch" TYPE FILE FILES "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_interface/sr_robot_launch/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sr_robot_launch" TYPE PROGRAM FILES
    "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_interface/sr_robot_launch/scripts/check_arms_ready"
    "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_interface/sr_robot_launch/scripts/teach_mode_node"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sr_robot_launch/launch" TYPE DIRECTORY FILES "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_interface/sr_robot_launch/launch/")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sr_robot_launch/config" TYPE DIRECTORY FILES "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_interface/sr_robot_launch/config/")
endif()

