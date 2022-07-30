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

    iiwa_group = moveit_commander.MoveGroupCommander('hand_iiwa')
    hand_group = moveit_commander.MoveGroupCommander('sr_hand')

   

    print('\n\nhand_iiwa Group Information')
    print('============ Reference frame: {}'.format(iiwa_group.get_planning_frame()))
    print('============ End effector: {}\n\n'.format(iiwa_group.get_end_effector_link()))

    print('sr_hand Group Information')
    print('============ Reference frame: {}'.format(hand_group.get_planning_frame()))
    print('============ Get Joints: {}'.format(hand_group.get_joints()))
    print('============ End effector: {}'.format(hand_group.get_end_effector_link()))

    rospy.sleep(1)

    '''
      ============ The object is: RedCylinder
      Found object at: translation:
      x: 0.599961921708
      y: 0.399967082224
      z: 0.783347410559
      rotation:
      x: -0.000133715123802
      y: 5.21730819613e-05
      z: -9.7343300484e-06
      w: 0.999999989652

    '''



    # The robot can be moved according to the planning group
    iiwa_pose = iiwa_group.get_current_pose(iiwa_group.get_end_effector_link())
    print('============iiwa current pose: {}'.format(iiwa_pose.pose))

    #hand_group.set_named_target('fingers_pack_thumb_open')
    #plan = hand_group.plan()

    # Alternatively a list of joint values can be given
    joint_values = hand_group.get_current_joint_values()



    # The hand has a very strict controller and will occasionally say it as failed even though it has moved to the right
    # position (just not in the right amount of time), ensure you check the achieved position.


    # Objects in the scene can be found using the object tracker node which publishes on the topic
    # '/recognized_objects_array' and to tf. The list of object names is found in the param '/object_list'

    objects = rospy.get_param('object_list')

    object_pose = tf_buffer.lookup_transform('world', objects[0], rospy.Time.now())
    print('============ The object is: {}'.format(objects[0]))
    print('Found object at: {}'.format(object_pose.transform))


    #************************************Moving iiwa and hand***********************************
    # ros coordinate frame red-x green-y blue-z
    # euler_from_quaternion returns tuple which is imuutable

    #converting from quaternion to eulor rpy
    iiwa_pose_eulor = euler_from_quaternion([iiwa_pose.pose.orientation.x,iiwa_pose.pose.orientation.y,
                                             iiwa_pose.pose.orientation.z,iiwa_pose.pose.orientation.w])

    #conveting tuple to a list
    temp =list(iiwa_pose_eulor)
    iiwa_pose_eulor = temp
    print('============ The iiwa_pose_eulor (radian) is: {}'.format(iiwa_pose_eulor))
    print('============ The iiwa_pose_eulor (degree) is: {}'.format([math.degrees(i) for i in iiwa_pose_eulor]))

    object__pose_eulor = euler_from_quaternion([object_pose.transform.rotation.x,object_pose.transform.rotation.y,
                                                object_pose.transform.rotation.z,object_pose.transform.rotation.w])
    print('============ The object__pose_eulor (radian) is: {}'.format(object__pose_eulor))
    print('============ The object__pose_eulor (degree) is: {}'.format([math.degrees(i) for i in object__pose_eulor]))

    eulor_correction =[ 0 for i in range(4)]
    eulor_correction[0]= -(3.0353665368240796+0.0002674312652206356)
    eulor_correction[1] = -(0.45788170764142927-0.0001043435597777646)
    eulor_correction[2] =(3.089214049532599 -1.948261266285742e-05)


    #iiwa_pose_eulor = iiwa_pose_eulor + eulor_correction
    iiwa_pose_eulor [0] = 0
    iiwa_pose_eulor [1] = 2
    iiwa_pose_eulor [2] = 2
    iiwa_pose_quaternion = quaternion_from_euler(iiwa_pose_eulor[0],iiwa_pose_eulor[1],iiwa_pose_eulor[2])

    print('============ The iiwa_pose_quaternion is: {}'.format(iiwa_pose_quaternion))

    iiwa_pose.pose.orientation.x = iiwa_pose_quaternion[0]
    iiwa_pose.pose.orientation.y = iiwa_pose_quaternion[1]
    iiwa_pose.pose.orientation.z = iiwa_pose_quaternion[2]
    iiwa_pose.pose.orientation.w = iiwa_pose_quaternion[3]

    '''
    # finding roatation quaternion
    q_inv =     quaternion_from_euler(0, 0, 0)
    q_inv[0] =  iiwa_pose.pose.orientation.x
    q_inv[1] =  iiwa_pose.pose.orientation.y
    q_inv[2] =  iiwa_pose.pose.orientation.z
    q_inv[3] = -iiwa_pose.pose.orientation.w  # Negate for inverse

    q_obj= quaternion_from_euler(0, 0, 0)
    q_obj[0] =  object_pose.transform.rotation.x
    q_obj[1] =  object_pose.transform.rotation.y
    q_obj[2] =  object_pose.transform.rotation.z
    q_obj[3] =  object_pose.transform.rotation.w

    qr = tf.transformations.quaternion_multiply(q_obj, q_inv)

    #rotating iiwa end effector by qr
    iiwa_pose.pose.orientation.x *= qr[0]
    iiwa_pose.pose.orientation.y *= qr[1]
    iiwa_pose.pose.orientation.z *= qr[2]
    iiwa_pose.pose.orientation.w *= qr[3]
    '''
    iiwa_pose.pose.position.x =  0.599961921708
    iiwa_pose.pose.position.y = 0.399967082224
    iiwa_pose.pose.position.z = 1.5

    print('iiwa planning to pose: {}'.format(iiwa_pose.pose))
    iiwa_group.set_pose_target(iiwa_pose)
    result = iiwa_group.plan()
    print('Plan result: {}'.format(result))
    iiwa_group.execute(result, wait=True)

    rospy.sleep(1)

    '''
    hand_group.set_joint_value_target({"lh_FFJ1": 1.5707, "lh_FFJ2": 1.5707, "lh_FFJ3": 1.5707, "lh_FFJ4": 0.0,
                                       "lh_MFJ1": 1.5707, "lh_MFJ2": 1.5707, "lh_MFJ3": 1.5707, "lh_MFJ4": 0.0,
                                       "lh_RFJ1": 1.5707, "lh_RFJ2": 1.5707, "lh_RFJ3": 1.5707, "lh_RFJ4": 0.0,
                                       "lh_THJ1": 0.0, "lh_THJ2": 0.0, "lh_THJ4": 0.0, "lh_THJ5": 0.0})
    plan = hand_group.plan()
    print('Plan result: {}\n\n'.format(plan))
    hand_group.execute(plan, wait=True)

    '''




    # TF doesn't always return as transform even when the transform exists, try catching the execption, waiting a second
    # and looking up the transform again.

    # To grasp objects they must first be added to the allowed collision matrix so that the path planner knows to ignore
    #  the collision. You can do this using a service '/add_object_acm', they can also be removed from the acm after
    # grasping to prevent any unintended collisions.

    add_to_acm = rospy.ServiceProxy('/add_object_acm', ChangeCollisionObject)
    remove_from_acm = rospy.ServiceProxy('/remove_object_acm', ChangeCollisionObject)

    success = add_to_acm(objects[0])

    # Now you can plan a motion to grasp the object

    rospy.sleep(10)

    success = remove_from_acm(objects[0])

    # When finished shut down moveit_commander.
    moveit_commander.roscpp_shutdown()


if __name__ == '__main__':
    try:
        cw3_example_script()
    except rospy.ROSInterruptException:
        pass
