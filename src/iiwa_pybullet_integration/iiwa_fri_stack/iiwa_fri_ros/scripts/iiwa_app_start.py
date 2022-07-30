#!/usr/bin/env python
import socket
import time
import sys
import rospy


def msg_generator(time, count, input_name, input_value):
    return '{};{};{};{}'.format(time, count, input_name, input_value)


def get_msg_time():
    return int(time.time() * 1000.0)


def start_iiwa(ip='172.31.1.149'):
    # Address of the KLI
    iiwa_ip_address = ip

    # Hard coded
    send_port = 30300

    iiwa_send_address = (iiwa_ip_address, int(send_port))

    # Create a socket
    send_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

    count = 1

    try:
        # Creat msg to start app
        msg = msg_generator(get_msg_time(), count, 'App_Start', 'true')
        count += 1
        print 'Sending: {}'.format(msg)

        send_sock.sendto(msg, iiwa_send_address)

    finally:
        send_sock.close()


if __name__ == "__main__":
    rospy.init_node('external_start', sys.argv, anonymous=True)
    start_iiwa(sys.argv[1])

