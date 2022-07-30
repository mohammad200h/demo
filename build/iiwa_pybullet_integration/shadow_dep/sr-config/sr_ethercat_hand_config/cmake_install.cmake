# Install script for directory: /home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr-config/sr_ethercat_hand_config

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/mamad/Demo/demo/build/iiwa_pybullet_integration/shadow_dep/sr-config/sr_ethercat_hand_config/catkin_generated/installspace/sr_ethercat_hand_config.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sr_ethercat_hand_config/cmake" TYPE FILE FILES
    "/home/mamad/Demo/demo/build/iiwa_pybullet_integration/shadow_dep/sr-config/sr_ethercat_hand_config/catkin_generated/installspace/sr_ethercat_hand_configConfig.cmake"
    "/home/mamad/Demo/demo/build/iiwa_pybullet_integration/shadow_dep/sr-config/sr_ethercat_hand_config/catkin_generated/installspace/sr_ethercat_hand_configConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sr_ethercat_hand_config" TYPE FILE FILES "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr-config/sr_ethercat_hand_config/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sr_ethercat_hand_config" TYPE PROGRAM FILES
    "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr-config/sr_ethercat_hand_config/demos/demo_r.py"
    "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr-config/sr_ethercat_hand_config/demos/demo_ls.py"
    "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr-config/sr_ethercat_hand_config/demos/demo_rc.py"
    "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr-config/sr_ethercat_hand_config/demos/demo_l.py"
    "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr-config/sr_ethercat_hand_config/demos/demo_rs.py"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sr_ethercat_hand_config/calibrations" TYPE DIRECTORY FILES "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr-config/sr_ethercat_hand_config/calibrations/")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sr_ethercat_hand_config/controls" TYPE DIRECTORY FILES "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr-config/sr_ethercat_hand_config/controls/")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sr_ethercat_hand_config/mappings" TYPE DIRECTORY FILES "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr-config/sr_ethercat_hand_config/demos/")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sr_ethercat_hand_config/launch" TYPE DIRECTORY FILES "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr-config/sr_ethercat_hand_config/launch/")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sr_ethercat_hand_config/rates" TYPE DIRECTORY FILES "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr-config/sr_ethercat_hand_config/rates/")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sr_ethercat_hand_config" TYPE FILE FILES "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr-config/sr_ethercat_hand_config/diagnostic_analyzer.yaml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sr_ethercat_hand_config" TYPE FILE FILES "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr-config/sr_ethercat_hand_config/diagnostic_analyzer_bimanual.yaml")
endif()

