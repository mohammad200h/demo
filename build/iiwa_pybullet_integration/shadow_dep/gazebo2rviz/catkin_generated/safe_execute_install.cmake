execute_process(COMMAND "/home/mamad/Demo/demo/build/iiwa_pybullet_integration/shadow_dep/gazebo2rviz/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/mamad/Demo/demo/build/iiwa_pybullet_integration/shadow_dep/gazebo2rviz/catkin_generated/python_distutils_install.sh) returned error code ")
endif()