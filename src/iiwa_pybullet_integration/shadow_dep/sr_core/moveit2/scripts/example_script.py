#!/usr/bin/env python

import sys
import math
import rospy
import moveit_commander
from cw3_helper.srv import ChangeCollisionObject
import tf2_ros
import tf
from tf.msg import tfMessage
from tf.transformations import quaternion_from_euler ,euler_from_quaternion

def cw3_example_script():
    """
    This script will go through the main aspects of moveit and the components you will need to complete the coursework.
    You can find more information on
    """
    moveit_commander.roscpp_initialize(sys.argv)
    rospy.init_node('cw3_example_script')

    tf_buffer = tf2_ros.Buffer()
    tf_listener = tf2_ros.TransformListener(tf_buffer)

    # Robot contains the entire state of the robot (iiwa and shadow hand)
    robot = moveit_commander.RobotCommander()
    # We can get a list of all the groups in the robot
    print('============ Robot Groups:')
    print('{}\n\n'.format(robot.get_group_names()))

    # Planning groups are used to control seperate aspects of the robot.
    # iiwa_group controls the iiwa arm from the base link to the end effector
    # hand group controls all of the joints of the hand.

    mf_group = moveit_commander.MoveGroupCommander('middel_finger')  
    ff_group = moveit_commander.MoveGroupCommander('first_finger')
    iiwa_group = moveit_commander.MoveGroupCommander('iwaa')

   

    print('\n\mf Group Information')
    print('============ Reference frame: {}'.format(mf_group.get_planning_frame()))
    print('============ End effector: {}\n\n'.format(mf_group.get_end_effector_link()))

    print('ff Group Information')
    print('============ Reference frame: {}'.format(ff_group.get_planning_frame()))
    print('============ Get Joints: {}'.format(ff_group.get_joints()))
    print('============ End effector: {}'.format(ff_group.get_end_effector_link()))

    print('iiwa Group Information')
    print('============ Reference frame: {}'.format(iiwa_group.get_planning_frame()))
    print('============ Get Joints: {}'.format(iiwa_group.get_joints()))
    print('============ End effector: {}'.format(iiwa_group.get_end_effector_link()))
    rospy.sleep(1)

    # The robot can be moved according to the planning group
    mf_pose = mf_group.get_current_pose(mf_group.get_end_effector_link())
    print('============ mf current pose: {}'.format(mf_pose.pose))

    ff_pose = ff_group.get_current_pose(ff_group.get_end_effector_link())
    print('============ ff current pose: {}'.format(ff_pose.pose))

    iiwa_pose = iiwa_group.get_current_pose(iiwa_group.get_end_effector_link())
    print('============ iiwa current pose: {}'.format(iiwa_pose.pose))
   
    '''
    ff_pose.pose.position.x =  ff_pose.pose.position.x -0.1
    ff_pose.pose.position.y = ff_pose.pose.position.y-0.1
    ff_pose.pose.position.z = ff_pose.pose.position.y -0.1

    ff_group.set_pose_target(ff_pose)
    result = ff_group.plan()
    print('Plan result: {}'.format(result))
    ff_group.execute(result, wait=True)
    '''
    iiwa_pose.pose.position.x =  iiwa_pose.pose.position.x 
    iiwa_pose.pose.position.y = iiwa_pose.pose.position.y
    iiwa_pose.pose.position.z = iiwa_pose.pose.position.z

    iiwa_group.set_pose_target(iiwa_pose)
    result = iiwa_group.plan()
    print('Plan result: {}'.format(result))
    iiwa_group.execute(result, wait=True)

   
    

    rospy.sleep(10)

    

    # When finished shut down moveit_commander.
    moveit_commander.roscpp_shutdown()


if __name__ == '__main__':
    try:
        cw3_example_script()
    except rospy.ROSInterruptException:
        pass
