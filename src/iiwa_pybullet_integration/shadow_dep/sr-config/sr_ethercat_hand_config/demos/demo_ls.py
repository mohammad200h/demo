#!/usr/bin/env python

# Script to move the left hand into store position.

import rospy
from sr_robot_commander.sr_hand_commander import SrHandCommander
from sr_utilities.hand_finder import HandFinder

rospy.init_node("store_left_hand", anonymous=True)

hand_finder = HandFinder()

hand_parameters = hand_finder.get_hand_parameters()
hand_serial = hand_parameters.mapping.keys()[0]

hand_commander = SrHandCommander(hand_parameters=hand_parameters,
                                 hand_serial=hand_serial)

rospy.sleep(0.5)

open_hand = {'lh_FFJ1': 0.0, 'lh_FFJ2': 0.0, 'lh_FFJ3': 0.0, 'lh_FFJ4': 0.0,
             'lh_MFJ1': 0.0, 'lh_MFJ2': 0.0, 'lh_MFJ3': 0.0, 'lh_MFJ4': 0.0,
             'lh_RFJ1': 0.0, 'lh_RFJ2': 0.0, 'lh_RFJ3': 0.0, 'lh_RFJ4': 0.0,
             'lh_THJ1': 0.0, 'lh_THJ2': 0.0, 'lh_THJ4': 0.0, 'lh_THJ5': 0.0}

pack_hand_1 = {'lh_FFJ1': 1.5707, 'lh_FFJ2': 1.5707, 'lh_FFJ3': 1.5707, 'lh_FFJ4': 0.0,
               'lh_MFJ1': 1.5707, 'lh_MFJ2': 1.5707, 'lh_MFJ3': 1.5707, 'lh_MFJ4': 0.0,
               'lh_RFJ1': 1.5707, 'lh_RFJ2': 1.5707, 'lh_RFJ3': 1.5707, 'lh_RFJ4': 0.0}

pack_hand_2 = {'lh_THJ4': 1.2, 'lh_THJ5': 0.0}

pack_hand_3 = {'lh_THJ1': 0.89, 'lh_THJ2': 0.40, 'lh_THJ5': 0.35}


# Move hand to open position
joint_states = open_hand
rospy.loginfo("Moving hand to open position")
hand_commander.move_to_joint_value_target_unsafe(joint_states, 2.0, False)
rospy.sleep(2)

# Move hand to closed position
joint_states = pack_hand_1
rospy.loginfo("Moving hand to pack position")
hand_commander.move_to_joint_value_target_unsafe(joint_states, 2.0, True)
rospy.sleep(2)

joint_states = pack_hand_2
hand_commander.move_to_joint_value_target_unsafe(joint_states, 1.0, True)
rospy.sleep(1)

joint_states = pack_hand_3
hand_commander.move_to_joint_value_target_unsafe(joint_states, 1.0, True)
rospy.sleep(1)


