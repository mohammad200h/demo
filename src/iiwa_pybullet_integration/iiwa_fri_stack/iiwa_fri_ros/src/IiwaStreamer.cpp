//
// Created by george on 25/09/17.
//
/**

The following license terms and conditions apply, unless a redistribution
agreement or other license is obtained by KUKA Roboter GmbH, Augsburg, Germany.

SCOPE

The software �KUKA Sunrise.Connectivity FRI Client SDK� is targeted to work in
conjunction with the �KUKA Sunrise.Connectivity FastRobotInterface� toolkit.
In the following, the term �software� refers to all material directly
belonging to the provided SDK �Software development kit�, particularly source
code, libraries, binaries, manuals and technical documentation.

COPYRIGHT

All Rights Reserved
Copyright (C)  2014-2016
KUKA Roboter GmbH
Augsburg, Germany

LICENSE

Redistribution and use of the software in source and binary forms, with or
without modification, are permitted provided that the following conditions are
met:
a) The software is used in conjunction with KUKA products only.
b) Redistributions of source code must retain the above copyright notice, this
list of conditions and the disclaimer.
c) Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the disclaimer in the documentation and/or other
materials provided with the distribution. Altered source code of the
redistribution must be made available upon request with the distribution.
d) Modification and contributions to the original software provided by KUKA
must be clearly marked and the authorship must be stated.
e) Neither the name of KUKA nor the trademarks owned by KUKA may be used to
endorse or promote products derived from this software without specific prior
written permission.

DISCLAIMER OF WARRANTY

The Software is provided "AS IS" and "WITH ALL FAULTS," without warranty of
any kind, including without limitation the warranties of merchantability,
fitness for a particular purpose and non-infringement.
KUKA makes no warranty that the Software is free of defects or is suitable for
any particular purpose. In no event shall KUKA be responsible for loss or
damages arising from the installation or use of the Software, including but
not limited to any indirect, punitive, special, incidental or consequential
damages of any character including, without limitation, damages for loss of
goodwill, work stoppage, computer nh.param("port", portfailure or malfunction, or any and all other
commercial damages or losses.
The entire risk to the quality and performance of the Software is not borne by
KUKA. Should the Software prove defective, KUKA is not liable for the entire
cost of any service and repair.



\file
\version {1.11}
*/
#include <cstdlib>
#include <cstdio>
#include <cstring> // strstr
#include <fri_client_sdk/friUdpConnection.h>
#include <fri_client_sdk/friClientApplication.h>
#include <iiwa_fri_ros/IiwaFRIStreamer.h>


int main (int argc, char** argv)
{
    ros::init(argc, argv, "fri_controller");
    ros::NodeHandle nh;

    ros::AsyncSpinner spinner(1);
    spinner.start();

    std::string hostname;
    int port;

    nh.getParam("hostname", hostname);
    ROS_INFO("Hostname: %s", hostname.c_str());

    nh.getParam("port", port);
    ROS_INFO("Port: %i", port);

    if(hostname.length() == 0){
        ROS_ERROR("Requires a hostname to be passed as a ros param");
        return 1;
    }

    auto state = std::make_shared<IiwaState>();
    IiwaFRIStreamer client(state);
    IiwaHWInterface robot(nh, state);

    robot.start();

    controller_manager::ControllerManager cm(&robot, nh);

    /***************************************************************************/
    /*                                                                         */
    /*   Standard application structure                                        */
    /*   Configuration                                                         */
    /*                                                                         */
    /***************************************************************************/

    // create new udp connection
    KUKA::FRI::UdpConnection connection;


    // pass connection and client to a new FRI client application
    KUKA::FRI::ClientApplication app(connection, client);

    ROS_INFO_STREAM("Connecting to ip: " << hostname.c_str() << " on port " << port);

    // connect client application to KUKA Sunrise controller
    app.connect(port, hostname.c_str());

    /***************************************************************************/
    /*                                                                         */
    /*   Standard application structure                                        */
    /*   Execution mainloop                                                    */
    /*                                                                         */
    /***************************************************************************/
    ros::Time current_time, previous_time = ros::Time::now();
    ros::Duration elapsed_time;

    // repeatedly call the step routine to receive and process FRI packets
    bool success = true;
    while (success && !ros::isShuttingDown())
    {
        current_time = ros::Time::now();
        elapsed_time = ros::Duration(current_time - previous_time);
        previous_time = current_time;

        robot.read(elapsed_time);
        cm.update(current_time, elapsed_time);
        robot.write(elapsed_time);

        success = app.step();
    }

    /***************************************************************************/
    /*                                                                         */
    /*   Standard application structure                                        */
    /*   Dispose                 -->                                              */
    /*                                                                         */
    /***************************************************************************/

    // disconnect from controller
    app.disconnect();
    spinner.stop();

    return 1;
}

