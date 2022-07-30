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

class joints_data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joints_list_length = null;
      this.joints_list = null;
    }
    else {
      if (initObj.hasOwnProperty('joints_list_length')) {
        this.joints_list_length = initObj.joints_list_length
      }
      else {
        this.joints_list_length = 0;
      }
      if (initObj.hasOwnProperty('joints_list')) {
        this.joints_list = initObj.joints_list
      }
      else {
        this.joints_list = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type joints_data
    // Serialize message field [joints_list_length]
    bufferOffset = _serializer.int8(obj.joints_list_length, buffer, bufferOffset);
    // Serialize message field [joints_list]
    // Serialize the length for message field [joints_list]
    bufferOffset = _serializer.uint32(obj.joints_list.length, buffer, bufferOffset);
    obj.joints_list.forEach((val) => {
      bufferOffset = joint.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type joints_data
    let len;
    let data = new joints_data(null);
    // Deserialize message field [joints_list_length]
    data.joints_list_length = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [joints_list]
    // Deserialize array length for message field [joints_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.joints_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.joints_list[i] = joint.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.joints_list.forEach((val) => {
      length += joint.getMessageSize(val);
    });
    return length + 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/joints_data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a7bd94657f253c468247048a545e88e5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 joints_list_length
    joint[] joints_list
    
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
    const resolved = new joints_data(null);
    if (msg.joints_list_length !== undefined) {
      resolved.joints_list_length = msg.joints_list_length;
    }
    else {
      resolved.joints_list_length = 0
    }

    if (msg.joints_list !== undefined) {
      resolved.joints_list = new Array(msg.joints_list.length);
      for (let i = 0; i < resolved.joints_list.length; ++i) {
        resolved.joints_list[i] = joint.Resolve(msg.joints_list[i]);
      }
    }
    else {
      resolved.joints_list = []
    }

    return resolved;
    }
};

module.exports = joints_data;
