|     Service       |  Status  |
| ----------------- | -------- |
| Documentation     | [![Documentation Status](https://readthedocs.org/projects/shadow-robot-ethercat-driver/badge/?version=latest)](http://shadow-robot-ethercat-driver.readthedocs.org) |
| Code style checks | [![Circle CI](https://circleci.com/gh/shadow-robot/sr-ros-interface-ethercat.svg?style=shield)](https://circleci.com/gh/shadow-robot/sr-ros-interface-ethercat) |
| Unit tests        | [![Build Status](https://travis-ci.org/shadow-robot/sr-ros-interface-ethercat.svg)](https://travis-ci.org/shadow-robot/sr-ros-interface-ethercat) |
| Install tests     | [![Build Status](https://semaphoreci.com/api/v1/projects/8797e7d4-058b-4f0f-bc34-9a1f8c23e31d/539067/shields_badge.svg)](https://semaphoreci.com/shadow-robot/sr-ros-interface-ethercat) |
| Code Coverage     | [![codecov.io](https://img.shields.io/codecov/c/github/shadow-robot/sr-ros-interface-ethercat/indigo-devel.svg)](http://codecov.io/github/shadow-robot/sr-ros-interface-ethercat?branch=indigo-devel) |

# Shadow Robot - EtherCAT driver

This stack focuses on the drivers for our [etherCAT hand](http://www.shadowrobot.com/products/).

**Warning: be careful when starting the hand. Make sure you're using the proper config files or you might damage the hardware. If in doubt contact us!**

## Launching the Hand Driver

- `sr_edc.launch` Launches a single hand

- `sr_edc_bimanual.launch` Launches 2 hands (as part of the same bimanual robot)


### Use

#### Direct use

For a single hand, with default parameters:

```bash
roslaunch sr_edc_launch sr_edc.launch
```

For a bimanual system you will need to specify at least the serial numbers for the right and left hand:

```bash
roslaunch sr_edc_launch sr_edc_bimanual.launch rh_serial:=1234 lh_serial:=1235
```

#### Use from another launchfile

E.g. for a bimanual system:

```xml
<launch>
  <include file="$(find sr_edc_launch)/sr_edc_bimanual.launch" >
    <arg name="rh_serial" value="1234" />
    <arg name="lh_serial" value="1235" />
    <arg name="eth_port" value="eth0_eth1" />
    <arg name="robot_description" value="$(find sr_description)/robots/bimanual_shadowhand_motor.urdf.xacro" />
  </include>
</launch>
```

E.g. for a single hand system:

```xml
<launch>
  <include file="$(find sr_edc_launch)/sr_edc.launch" >
    <arg name="eth_port" value="eth1" />
    <arg name="robot_description" value="$(find sr_description)/robots/shadowhand_motor_biotac.urdf.xacro" />
  </include>
</launch>
```

#### Available arguments for sr_edc_bimanual.launch

- `eth_port`: The ethernet port/s that will be used to search for etherCAT devices (shadow hands or other devices like RoNeX). More than one port can be provided in this argument, using underscore as a separator.

```
roslaunch sr_edc_launch sr_edc_bimanual.launch rh_serial:=1234 lh_serial:=1235 eth_port:=eth0_eth1
```

- `debug`: Set to true for debugging
- `calibration_controllers`: Set to 0 if we don't want to run calibration controllers (e.g. for the muscle hand)
- `robot_description`: Xacro file containing the robot description we want to load
- `pwm_control`: The control mode PWM (true) or torque (false)
- `rh_serial`: The ethercat serial number for the right hand
- `rh_id`: The id for the right hand. It needs to be the same (but without trailing underscore) as the prefix used in the hand model.
- `lh_serial`: The ethercat serial number for the left hand
- `lh_id`: The id for the left hand. It needs to be the same (but without trailing underscore) as the prefix used in the hand model.

#### Available arguments for sr_edc.launch

- `eth_port`: The ethernet port/s that will be used to search for etherCAT devices (shadow hands or other devices like RoNeX). More than one port can be provided in this argument, using underscore as a separator.
- `debug`: Set to true for debugging
- `calibration_controllers`: Set to 0 if we don't want to run calibration controllers (e.g. for the muscle hand)
- `robot_description`: Xacro file containing the robot description we want to load
- `pwm_control`: The control mode PWM (true) or torque (false)
