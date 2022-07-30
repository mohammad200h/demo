// Auto-generated. Do not edit!

// (in-package sr_robot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sendupdate = require('./sendupdate.js');
let contrlr = require('./contrlr.js');

//-----------------------------------------------------------

class command {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.command_type = null;
      this.sendupdate_command = null;
      this.contrlr_command = null;
    }
    else {
      if (initObj.hasOwnProperty('command_type')) {
        this.command_type = initObj.command_type
      }
      else {
        this.command_type = 0;
      }
      if (initObj.hasOwnProperty('sendupdate_command')) {
        this.sendupdate_command = initObj.sendupdate_command
      }
      else {
        this.sendupdate_command = new sendupdate();
      }
      if (initObj.hasOwnProperty('contrlr_command')) {
        this.contrlr_command = initObj.contrlr_command
      }
      else {
        this.contrlr_command = new contrlr();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type command
    // Serialize message field [command_type]
    bufferOffset = _serializer.int8(obj.command_type, buffer, bufferOffset);
    // Serialize message field [sendupdate_command]
    bufferOffset = sendupdate.serialize(obj.sendupdate_command, buffer, bufferOffset);
    // Serialize message field [contrlr_command]
    bufferOffset = contrlr.serialize(obj.contrlr_command, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type command
    let len;
    let data = new command(null);
    // Deserialize message field [command_type]
    data.command_type = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [sendupdate_command]
    data.sendupdate_command = sendupdate.deserialize(buffer, bufferOffset);
    // Deserialize message field [contrlr_command]
    data.contrlr_command = contrlr.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += sendupdate.getMessageSize(object.sendupdate_command);
    length += contrlr.getMessageSize(object.contrlr_command);
    return length + 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/command';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2c927cc3decc25060b43219a05beb823';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # sendupdate is 1
    # contrlr is 2
    int8 command_type
    
    sendupdate sendupdate_command
    contrlr contrlr_command
    
    ================================================================================
    MSG: sr_robot_msgs/sendupdate
    int8 sendupdate_length
    joint[] sendupdate_list
    
    
    ================================================================================
    MSG: sr_robot_msgs/joint
    string  joint_name
    float64 joint_position
    float64 joint_target
    float64 joint_torque
    float64 joint_temperature
    float64 joint_current
    string  error_flag
    
    ================================================================================
    MSG: sr_robot_msgs/contrlr
    # the contrlr name (e.g. smart_motor_ff2)
    string   contrlr_name
    
    # specify here a list of parameter_name:value
    # e.g. p:10 sets the p value of the controller to 10
    # the possible parameters are:
    #int16  p
    #int16  i
    #int16  d
    #int16  imax
    #int16  target
    #int16  sensor
    #int16  valve 
    #int16  deadband
    #int16  offset
    #int16  shift
    #int16  max
    #
    ## parameters for the motors
    #int16  motor_maxforce
    #int16  motor_safeforce
    #int16  force_p
    #int16  force_i
    #int16  force_d
    #int16  force_imax
    #int16  force_out_shift
    #int16  force_deadband
    #int16  force_offset
    #int16  sensor_imax
    #int16  sensor_deadband
    #int16  sensor_offset
    #int16  max_temperature
    #int16  max_current
    
    string[] list_of_parameters
    
    # the size of the list_of_parameters you are sending
    uint8 	 length_of_list
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new command(null);
    if (msg.command_type !== undefined) {
      resolved.command_type = msg.command_type;
    }
    else {
      resolved.command_type = 0
    }

    if (msg.sendupdate_command !== undefined) {
      resolved.sendupdate_command = sendupdate.Resolve(msg.sendupdate_command)
    }
    else {
      resolved.sendupdate_command = new sendupdate()
    }

    if (msg.contrlr_command !== undefined) {
      resolved.contrlr_command = contrlr.Resolve(msg.contrlr_command)
    }
    else {
      resolved.contrlr_command = new contrlr()
    }

    return resolved;
    }
};

module.exports = command;
