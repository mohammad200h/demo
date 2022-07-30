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

class UBI0 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.distal = null;
    }
    else {
      if (initObj.hasOwnProperty('distal')) {
        this.distal = initObj.distal
      }
      else {
        this.distal = new Array(12).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type UBI0
    // Check that the constant length array field [distal] has the right length
    if (obj.distal.length !== 12) {
      throw new Error('Unable to serialize array field distal - length must be 12')
    }
    // Serialize message field [distal]
    bufferOffset = _arraySerializer.uint16(obj.distal, buffer, bufferOffset, 12);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type UBI0
    let len;
    let data = new UBI0(null);
    // Deserialize message field [distal]
    data.distal = _arrayDeserializer.uint16(buffer, bufferOffset, 12)
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/UBI0';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f8ba754182dd029f486767184963c485';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16[12] distal
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new UBI0(null);
    if (msg.distal !== undefined) {
      resolved.distal = msg.distal;
    }
    else {
      resolved.distal = new Array(12).fill(0)
    }

    return resolved;
    }
};

module.exports = UBI0;
