import rospy
import socket
import time


def msg_generator(time, count, input_name, input_value):
    return '{};{};{};{}'.format(time, count, input_name, input_value)

def get_msg_time():
    # return int(round(rospy.Time.now().to_nsec() / 1000000))
    return int(time.time() * 1000.0)

if __name__ == '__main__':

    iiwa_ip_address = '172.31.1.147'
    send_port = 30300

    client_ip_address = '172.31.1.10'
    recv_port = 30333

    iiwa_send_address = (iiwa_ip_address, int(send_port))
    client_recv_address = (client_ip_address, int(recv_port))

    # Create a TCP/IP socket
    send_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    recv_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

    recv_sock.bind(client_recv_address)

    count = 1

    try:
        for i in [1, 2, 3, 4, 5]:
            msg = msg_generator(get_msg_time(), count, 'Get_State', 'true')
            count += 1

            send_sock.send(msg, iiwa_send_address)

            data, server = recv_sock.recvfrom(4096)
            print 'Received msgs: {}\nFrom: {}'.format(data, server)
            time.sleep(1)

        # print 'Wait 5 seconds'
        # time.sleep(5)


    finally:
        send_sock.close()
        recv_sock.close()
