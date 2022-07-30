// Auto-generated. Do not edit!

// (in-package sr_robot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class joint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_name = null;
      this.joint_position = null;
      this.joint_target = null;
      this.joint_torque = null;
      this.joint_temperature = null;
      this.joint_current = null;
      this.error_flag = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_name')) {
        this.joint_name = initObj.joint_name
      }
      else {
        this.joint_name = '';
      }
      if (initObj.hasOwnProperty('joint_position')) {
        this.joint_position = initObj.joint_position
      }
      else {
        this.joint_position = 0.0;
      }
      if (initObj.hasOwnProperty('joint_target')) {
        this.joint_target = initObj.joint_target
      }
      else {
        this.joint_target = 0.0;
      }
      if (initObj.hasOwnProperty('joint_torque')) {
        this.joint_torque = initObj.joint_torque
      }
      else {
        this.joint_torque = 0.0;
      }
      if (initObj.hasOwnProperty('joint_temperature')) {
        this.joint_temperature = initObj.joint_temperature
      }
      else {
        this.joint_temperature = 0.0;
      }
      if (initObj.hasOwnProperty('joint_current')) {
        this.joint_current = initObj.joint_current
      }
      else {
        this.joint_current = 0.0;
      }
      if (initObj.hasOwnProperty('error_flag')) {
        this.error_flag = initObj.error_flag
      }
      else {
        this.error_flag = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type joint
    // Serialize message field [joint_name]
    bufferOffset = _serializer.string(obj.joint_name, buffer, bufferOffset);
    // Serialize message field [joint_position]
    bufferOffset = _serializer.float64(obj.joint_position, buffer, bufferOffset);
    // Serialize message field [joint_target]
    bufferOffset = _serializer.float64(obj.joint_target, buffer, bufferOffset);
    // Serialize message field [joint_torque]
    bufferOffset = _serializer.float64(obj.joint_torque, buffer, bufferOffset);
    // Serialize message field [joint_temperature]
    bufferOffset = _serializer.float64(obj.joint_temperature, buffer, bufferOffset);
    // Serialize message field [joint_current]
    bufferOffset = _serializer.float64(obj.joint_current, buffer, bufferOffset);
    // Serialize message field [error_flag]
    bufferOffset = _serializer.string(obj.error_flag, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type joint
    let len;
    let data = new joint(null);
    // Deserialize message field [joint_name]
    data.joint_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [joint_position]
    data.joint_position = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [joint_target]
    data.joint_target = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [joint_torque]
    data.joint_torque = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [joint_temperature]
    data.joint_temperature = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [joint_current]
    data.joint_current = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [error_flag]
    data.error_flag = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.joint_name.length;
    length += object.error_flag.length;
    return length + 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/joint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4f0c5e71dfc214020935c3116ed47d6f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new joint(null);
    if (msg.joint_name !== undefined) {
      resolved.joint_name = msg.joint_name;
    }
    else {
      resolved.joint_name = ''
    }

    if (msg.joint_position !== undefined) {
      resolved.joint_position = msg.joint_position;
    }
    else {
      resolved.joint_position = 0.0
    }

    if (msg.joint_target !== undefined) {
      resolved.joint_target = msg.joint_target;
    }
    else {
      resolved.joint_target = 0.0
    }

    if (msg.joint_torque !== undefined) {
      resolved.joint_torque = msg.joint_torque;
    }
    else {
      resolved.joint_torque = 0.0
    }

    if (msg.joint_temperature !== undefined) {
      resolved.joint_temperature = msg.joint_temperature;
    }
    else {
      resolved.joint_temperature = 0.0
    }

    if (msg.joint_current !== undefined) {
      resolved.joint_current = msg.joint_current;
    }
    else {
      resolved.joint_current = 0.0
    }

    if (msg.error_flag !== undefined) {
      resolved.error_flag = msg.error_flag;
    }
    else {
      resolved.error_flag = ''
    }

    return resolved;
    }
};

module.exports = joint;
