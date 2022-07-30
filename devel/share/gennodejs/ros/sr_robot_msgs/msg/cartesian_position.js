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

class cartesian_position {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.tip_name = null;
      this.tip_pos_x = null;
      this.tip_pos_y = null;
      this.tip_pos_z = null;
      this.tip_orientation_rho = null;
      this.tip_orientation_theta = null;
      this.tip_orientation_sigma = null;
    }
    else {
      if (initObj.hasOwnProperty('tip_name')) {
        this.tip_name = initObj.tip_name
      }
      else {
        this.tip_name = '';
      }
      if (initObj.hasOwnProperty('tip_pos_x')) {
        this.tip_pos_x = initObj.tip_pos_x
      }
      else {
        this.tip_pos_x = 0.0;
      }
      if (initObj.hasOwnProperty('tip_pos_y')) {
        this.tip_pos_y = initObj.tip_pos_y
      }
      else {
        this.tip_pos_y = 0.0;
      }
      if (initObj.hasOwnProperty('tip_pos_z')) {
        this.tip_pos_z = initObj.tip_pos_z
      }
      else {
        this.tip_pos_z = 0.0;
      }
      if (initObj.hasOwnProperty('tip_orientation_rho')) {
        this.tip_orientation_rho = initObj.tip_orientation_rho
      }
      else {
        this.tip_orientation_rho = 0.0;
      }
      if (initObj.hasOwnProperty('tip_orientation_theta')) {
        this.tip_orientation_theta = initObj.tip_orientation_theta
      }
      else {
        this.tip_orientation_theta = 0.0;
      }
      if (initObj.hasOwnProperty('tip_orientation_sigma')) {
        this.tip_orientation_sigma = initObj.tip_orientation_sigma
      }
      else {
        this.tip_orientation_sigma = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type cartesian_position
    // Serialize message field [tip_name]
    bufferOffset = _serializer.string(obj.tip_name, buffer, bufferOffset);
    // Serialize message field [tip_pos_x]
    bufferOffset = _serializer.float32(obj.tip_pos_x, buffer, bufferOffset);
    // Serialize message field [tip_pos_y]
    bufferOffset = _serializer.float32(obj.tip_pos_y, buffer, bufferOffset);
    // Serialize message field [tip_pos_z]
    bufferOffset = _serializer.float32(obj.tip_pos_z, buffer, bufferOffset);
    // Serialize message field [tip_orientation_rho]
    bufferOffset = _serializer.float32(obj.tip_orientation_rho, buffer, bufferOffset);
    // Serialize message field [tip_orientation_theta]
    bufferOffset = _serializer.float32(obj.tip_orientation_theta, buffer, bufferOffset);
    // Serialize message field [tip_orientation_sigma]
    bufferOffset = _serializer.float32(obj.tip_orientation_sigma, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type cartesian_position
    let len;
    let data = new cartesian_position(null);
    // Deserialize message field [tip_name]
    data.tip_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [tip_pos_x]
    data.tip_pos_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [tip_pos_y]
    data.tip_pos_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [tip_pos_z]
    data.tip_pos_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [tip_orientation_rho]
    data.tip_orientation_rho = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [tip_orientation_theta]
    data.tip_orientation_theta = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [tip_orientation_sigma]
    data.tip_orientation_sigma = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.tip_name.length;
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/cartesian_position';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cfc3f1750a36a668eb93288ed1128f42';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string  tip_name
    float32 tip_pos_x
    float32 tip_pos_y
    float32 tip_pos_z
    float32 tip_orientation_rho
    float32 tip_orientation_theta
    float32 tip_orientation_sigma
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new cartesian_position(null);
    if (msg.tip_name !== undefined) {
      resolved.tip_name = msg.tip_name;
    }
    else {
      resolved.tip_name = ''
    }

    if (msg.tip_pos_x !== undefined) {
      resolved.tip_pos_x = msg.tip_pos_x;
    }
    else {
      resolved.tip_pos_x = 0.0
    }

    if (msg.tip_pos_y !== undefined) {
      resolved.tip_pos_y = msg.tip_pos_y;
    }
    else {
      resolved.tip_pos_y = 0.0
    }

    if (msg.tip_pos_z !== undefined) {
      resolved.tip_pos_z = msg.tip_pos_z;
    }
    else {
      resolved.tip_pos_z = 0.0
    }

    if (msg.tip_orientation_rho !== undefined) {
      resolved.tip_orientation_rho = msg.tip_orientation_rho;
    }
    else {
      resolved.tip_orientation_rho = 0.0
    }

    if (msg.tip_orientation_theta !== undefined) {
      resolved.tip_orientation_theta = msg.tip_orientation_theta;
    }
    else {
      resolved.tip_orientation_theta = 0.0
    }

    if (msg.tip_orientation_sigma !== undefined) {
      resolved.tip_orientation_sigma = msg.tip_orientation_sigma;
    }
    else {
      resolved.tip_orientation_sigma = 0.0
    }

    return resolved;
    }
};

module.exports = cartesian_position;
