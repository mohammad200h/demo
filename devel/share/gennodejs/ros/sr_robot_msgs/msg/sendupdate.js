// Auto-generated. Do not edit!

// (in-package sr_robot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let joint = require('./joint.js');

//-----------------------------------------------------------

class sendupdate {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sendupdate_length = null;
      this.sendupdate_list = null;
    }
    else {
      if (initObj.hasOwnProperty('sendupdate_length')) {
        this.sendupdate_length = initObj.sendupdate_length
      }
      else {
        this.sendupdate_length = 0;
      }
      if (initObj.hasOwnProperty('sendupdate_list')) {
        this.sendupdate_list = initObj.sendupdate_list
      }
      else {
        this.sendupdate_list = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type sendupdate
    // Serialize message field [sendupdate_length]
    bufferOffset = _serializer.int8(obj.sendupdate_length, buffer, bufferOffset);
    // Serialize message field [sendupdate_list]
    // Serialize the length for message field [sendupdate_list]
    bufferOffset = _serializer.uint32(obj.sendupdate_list.length, buffer, bufferOffset);
    obj.sendupdate_list.forEach((val) => {
      bufferOffset = joint.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sendupdate
    let len;
    let data = new sendupdate(null);
    // Deserialize message field [sendupdate_length]
    data.sendupdate_length = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [sendupdate_list]
    // Deserialize array length for message field [sendupdate_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.sendupdate_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.sendupdate_list[i] = joint.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.sendupdate_list.forEach((val) => {
      length += joint.getMessageSize(val);
    });
    return length + 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/sendupdate';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '43a45fe046127fe123dc7e38e3ffdc36';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new sendupdate(null);
    if (msg.sendupdate_length !== undefined) {
      resolved.sendupdate_length = msg.sendupdate_length;
    }
    else {
      resolved.sendupdate_length = 0
    }

    if (msg.sendupdate_list !== undefined) {
      resolved.sendupdate_list = new Array(msg.sendupdate_list.length);
      for (let i = 0; i < resolved.sendupdate_list.length; ++i) {
        resolved.sendupdate_list[i] = joint.Resolve(msg.sendupdate_list[i]);
      }
    }
    else {
      resolved.sendupdate_list = []
    }

    return resolved;
    }
};

module.exports = sendupdate;
