#!/usr/bin/env python

from trac_ik_python.trac_ik import IK
import rospy
import xml.etree.ElementTree as ET


urdf_path = "./iiwa7.urdf"
urdf = ET.parse(urdf_path).getroot()
urdf_str = ET.tostring(urdf).decode("utf-8")
# print("type::urdf_str::",type(urdf_str))
# print("urdf_str:: ",urdf_str)
# urdf_str = rospy.get_param('/robot_description')

robot_base_link = "im_iiwa_link_0"
robot_ee = "im_iiwa_link_7"
ik_solver = IK(robot_base_link,
               robot_ee,
               urdf_string=urdf_str)

print("base_link:: ",ik_solver.base_link)
print("tip_link:: ",ik_solver.tip_link)
print("joint_names:: ",ik_solver.joint_names)
print("link_names:: ",ik_solver.link_names)

seed_state = [0.0] * ik_solver.number_of_joints

res= ik_solver.get_ik(seed_state,
                0.45, 0.1, 0.3,  # X, Y, Z
                0.0, 0.0, 0.0, 1.0)  # QX, QY, QZ, QW

print("res:: ",res)


"""
requirement install trace ik
sudo apt-get install ros-noetic-trac-ik
"""