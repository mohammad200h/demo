# Install script for directory: /home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_muscle_tools

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/mamad/Demo/demo/build/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_muscle_tools/catkin_generated/installspace/sr_edc_muscle_tools.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sr_edc_muscle_tools/cmake" TYPE FILE FILES
    "/home/mamad/Demo/demo/build/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_muscle_tools/catkin_generated/installspace/sr_edc_muscle_toolsConfig.cmake"
    "/home/mamad/Demo/demo/build/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_muscle_tools/catkin_generated/installspace/sr_edc_muscle_toolsConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sr_edc_muscle_tools" TYPE FILE FILES "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_muscle_tools/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sr_edc_muscle_tools" TYPE PROGRAM FILES
    "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_muscle_tools/bin/start_valve_controllers.sh"
    "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_muscle_tools/bin/empty.sh"
    "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_muscle_tools/bin/extend.sh"
    "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_muscle_tools/bin/example_sendupdate.py"
    "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_muscle_tools/bin/example_move_joint.py"
    "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_muscle_tools/bin/calibrate_pressure_sensors.sh"
    "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_muscle_tools/bin/start_position_controllers.sh"
    "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_muscle_tools/bin/stop_all_controllers.sh"
    "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_muscle_tools/bin/example_reading_sensors.py"
    "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_muscle_tools/bin/empty_all_valves.sh"
    "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/shadow_robot_ethercat/sr_edc_muscle_tools/bin/flex.sh"
    )
endif()

