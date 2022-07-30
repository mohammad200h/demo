# Install script for directory: /home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_core/sr_tactile_sensors

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
  include("/home/mamad/Demo/demo/build/iiwa_pybullet_integration/shadow_dep/sr_core/sr_tactile_sensors/catkin_generated/safe_execute_install.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/mamad/Demo/demo/build/iiwa_pybullet_integration/shadow_dep/sr_core/sr_tactile_sensors/catkin_generated/installspace/sr_tactile_sensors.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sr_tactile_sensors/cmake" TYPE FILE FILES
    "/home/mamad/Demo/demo/build/iiwa_pybullet_integration/shadow_dep/sr_core/sr_tactile_sensors/catkin_generated/installspace/sr_tactile_sensorsConfig.cmake"
    "/home/mamad/Demo/demo/build/iiwa_pybullet_integration/shadow_dep/sr_core/sr_tactile_sensors/catkin_generated/installspace/sr_tactile_sensorsConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sr_tactile_sensors" TYPE FILE FILES "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_core/sr_tactile_sensors/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_virtual" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_virtual")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_virtual"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors" TYPE EXECUTABLE FILES "/home/mamad/Demo/demo/devel/lib/sr_tactile_sensors/sr_tactile_virtual")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_virtual" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_virtual")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_virtual"
         OLD_RPATH "/home/mamad/Demo/demo/devel/lib:/opt/ros/kinetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_virtual")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_rviz_marker" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_rviz_marker")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_rviz_marker"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors" TYPE EXECUTABLE FILES "/home/mamad/Demo/demo/devel/lib/sr_tactile_sensors/sr_tactile_rviz_marker")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_rviz_marker" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_rviz_marker")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_rviz_marker"
         OLD_RPATH "/home/mamad/Demo/demo/devel/lib:/opt/ros/kinetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_rviz_marker")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_bumper_rviz_marker" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_bumper_rviz_marker")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_bumper_rviz_marker"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors" TYPE EXECUTABLE FILES "/home/mamad/Demo/demo/devel/lib/sr_tactile_sensors/sr_bumper_rviz_marker")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_bumper_rviz_marker" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_bumper_rviz_marker")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_bumper_rviz_marker"
         OLD_RPATH "/home/mamad/Demo/demo/devel/lib:/opt/ros/kinetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_bumper_rviz_marker")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/tactile_example" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/tactile_example")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/tactile_example"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors" TYPE EXECUTABLE FILES "/home/mamad/Demo/demo/devel/lib/sr_tactile_sensors/tactile_example")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/tactile_example" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/tactile_example")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/tactile_example"
         OLD_RPATH "/home/mamad/Demo/demo/devel/lib:/opt/ros/kinetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/tactile_example")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_virtual_gazebo" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_virtual_gazebo")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_virtual_gazebo"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors" TYPE EXECUTABLE FILES "/home/mamad/Demo/demo/devel/lib/sr_tactile_sensors/sr_tactile_virtual_gazebo")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_virtual_gazebo" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_virtual_gazebo")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_virtual_gazebo"
         OLD_RPATH "/home/mamad/Demo/demo/devel/lib:/opt/ros/kinetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/sr_tactile_sensors/sr_tactile_virtual_gazebo")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sr_tactile_sensors" TYPE DIRECTORY FILES "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_core/sr_tactile_sensors/include/sr_tactile_sensors/" FILES_MATCHING REGEX "/[^/]*\\.hpp$")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sr_tactile_sensors/params" TYPE DIRECTORY FILES "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_core/sr_tactile_sensors/params/")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sr_tactile_sensors/launch" TYPE DIRECTORY FILES "/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_core/sr_tactile_sensors/launch/")
endif()

