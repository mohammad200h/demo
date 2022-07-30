// Auto-generated. Do not edit!

// (in-package sr_robot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let cartesian_position = require('./cartesian_position.js');

//-----------------------------------------------------------

class cartesian_data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cartesian_positions_length = null;
      this.cartesian_positions = null;
    }
    else {
      if (initObj.hasOwnProperty('cartesian_positions_length')) {
        this.cartesian_positions_length = initObj.cartesian_positions_length
      }
      else {
        this.cartesian_positions_length = 0;
      }
      if (initObj.hasOwnProperty('cartesian_positions')) {
        this.cartesian_positions = initObj.cartesian_positions
      }
      else {
        this.cartesian_positions = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type cartesian_data
    // Serialize message field [cartesian_positions_length]
    bufferOffset = _serializer.int8(obj.cartesian_positions_length, buffer, bufferOffset);
    // Serialize message field [cartesian_positions]
    // Serialize the length for message field [cartesian_positions]
    bufferOffset = _serializer.uint32(obj.cartesian_positions.length, buffer, bufferOffset);
    obj.cartesian_positions.forEach((val) => {
      bufferOffset = cartesian_position.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type cartesian_data
    let len;
    let data = new cartesian_data(null);
    // Deserialize message field [cartesian_positions_length]
    data.cartesian_positions_length = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [cartesian_positions]
    // Deserialize array length for message field [cartesian_positions]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.cartesian_positions = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.cartesian_positions[i] = cartesian_position.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.cartesian_positions.forEach((val) => {
      length += cartesian_position.getMessageSize(val);
    });
    return length + 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/cartesian_data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0efe699b2863e30a84ffabfdca8dfb19';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8                 cartesian_positions_length
    cartesian_position[] cartesian_positions
    
    ================================================================================
    MSG: sr_robot_msgs/cartesian_position
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
    const resolved = new cartesian_data(null);
    if (msg.cartesian_positions_length !== undefined) {
      resolved.cartesian_positions_length = msg.cartesian_positions_length;
    }
    else {
      resolved.cartesian_positions_length = 0
    }

    if (msg.cartesian_positions !== undefined) {
      resolved.cartesian_positions = new Array(msg.cartesian_positions.length);
      for (let i = 0; i < resolved.cartesian_positions.length; ++i) {
        resolved.cartesian_positions[i] = cartesian_position.Resolve(msg.cartesian_positions[i]);
      }
    }
    else {
      resolved.cartesian_positions = []
    }

    return resolved;
    }
};

module.exports = cartesian_data;
