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

def centering_to_palm(x):
    length_of_motor_box = math.cos(40)*(96/100)
    palm_lenght = (99/100)
    x = x-(length_of_motor_box + palm_lenght/2)
    return x




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
    #hand_group = moveit_commander.MoveGroupCommander('sr_hand')
    
    thumb_finger_group = moveit_commander.MoveGroupCommander('lh_thumb')
    first_finger_group = moveit_commander.MoveGroupCommander('lh_first_finger')
    middle_finger_group = moveit_commander.MoveGroupCommander('lh_middle_finger')
    ring_finger_group = moveit_commander.MoveGroupCommander('lh_ring_finger')
    
   

    print('\n\nhand_iiwa Group Information')
    print('============ Reference frame: {}'.format(iiwa_group.get_planning_frame()))
    print('============ End effector: {}\n\n'.format(iiwa_group.get_end_effector_link()))

    print('middle_finger Group Information')
    print('============ Reference frame: {}'.format(middle_finger_group.get_planning_frame()))
    print('============ Get Joints: {}'.format(middle_finger_group.get_joints()))
    print('============ End effector: {}'.format(middle_finger_group.get_end_effector_link()))

    rospy.sleep(1)


    # The robot can be moved according to the planning group
    iiwa_pose = iiwa_group.get_current_pose(iiwa_group.get_end_effector_link())
    print('============iiwa current pose: {}'.format(iiwa_pose.pose))

    #middle finger pose
    
    middle_finger_pose = middle_finger_group.get_current_pose(middle_finger_group.get_end_effector_link())
    print('============middle_finger_group current pose: {}'.format(middle_finger_pose.pose))


    #hand_group.set_named_target('fingers_pack_thumb_open')
    #plan = hand_group.plan()

    # Alternatively a list of joint values can be given
    


    # The hand has a very strict controller and will occasionally say it as failed even though it has moved to the right
    # position (just not in the right amount of time), ensure you check the achieved position.


    # Objects in the scene can be found using the object tracker node which publishes on the topic
    # '/recognized_objects_array' and to tf. The list of object names is found in the param '/object_list'

    objects = rospy.get_param('object_list')

    object_pose = tf_buffer.lookup_transform('world', objects[2], rospy.Time.now())
    print('============ The object is: {}'.format(objects[2]))
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
    iiwa_pose_eulor [0] = 0 #red
    iiwa_pose_eulor [1] = 2.268     #green
    iiwa_pose_eulor [2] = 0  #blue
    iiwa_pose_quaternion = quaternion_from_euler(iiwa_pose_eulor[0],iiwa_pose_eulor[1],iiwa_pose_eulor[2])

    print('============ The iiwa_pose_quaternion is: {}'.format(iiwa_pose_quaternion))

    iiwa_pose.pose.orientation.x = iiwa_pose_quaternion[0]
    iiwa_pose.pose.orientation.y = iiwa_pose_quaternion[1]
    iiwa_pose.pose.orientation.z = iiwa_pose_quaternion[2]
    iiwa_pose.pose.orientation.w = iiwa_pose_quaternion[3]

    iiwa_pose.pose.position.x =  centering_to_palm(object_pose.transform.translation.x)-0.23
    iiwa_pose.pose.position.y = 0.68
    iiwa_pose.pose.position.z = .99
    print('iiwa planning to pose: {}'.format(iiwa_pose.pose))

    #iiwa_group.set_pose_target(iiwa_pose)
    #result = iiwa_group.plan()
    #print('Plan result: {}'.format(result))
    #iiwa_group.execute(result, wait=True)

    rospy.sleep(1)
    #after moveing to target
    #converting from quaternion to eulor rpy
    iiwa_pose_eulor = euler_from_quaternion([iiwa_pose.pose.orientation.x,iiwa_pose.pose.orientation.y,
                                             iiwa_pose.pose.orientation.z,iiwa_pose.pose.orientation.w])


    #moving the middle finger
    middle_finger_pose.pose.position.x = middle_finger_pose.pose.position.x +0.1
    middle_finger_group.set_pose_target(middle_finger_pose)
    
    result = middle_finger_group.plan()
    print('Plan result: {}'.format(result))
    middle_finger_group.execute(result, wait=True)


    #conveting tuple to a list
    temp =list(iiwa_pose_eulor)
    iiwa_pose_eulor = temp
    print('============ Target_The iiwa_pose_eulor (radian) is: {}'.format(iiwa_pose_eulor))
    print('============ Target_The iiwa_pose_eulor (degree) is: {}'.format([math.degrees(i) for i in iiwa_pose_eulor]))

   
    #middle_finger_pose = middle_finger_group.get_current_pose(middle_finger_group.get_end_effector_link())
    #print('============middle finger current pose: {}'.format(middle_finger_pose.pose))
    




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