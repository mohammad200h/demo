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

class MidProxData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.middle = null;
      this.proximal = null;
    }
    else {
      if (initObj.hasOwnProperty('middle')) {
        this.middle = initObj.middle
      }
      else {
        this.middle = new Array(4).fill(0);
      }
      if (initObj.hasOwnProperty('proximal')) {
        this.proximal = initObj.proximal
      }
      else {
        this.proximal = new Array(4).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MidProxData
    // Check that the constant length array field [middle] has the right length
    if (obj.middle.length !== 4) {
      throw new Error('Unable to serialize array field middle - length must be 4')
    }
    // Serialize message field [middle]
    bufferOffset = _arraySerializer.uint16(obj.middle, buffer, bufferOffset, 4);
    // Check that the constant length array field [proximal] has the right length
    if (obj.proximal.length !== 4) {
      throw new Error('Unable to serialize array field proximal - length must be 4')
    }
    // Serialize message field [proximal]
    bufferOffset = _arraySerializer.uint16(obj.proximal, buffer, bufferOffset, 4);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MidProxData
    let len;
    let data = new MidProxData(null);
    // Deserialize message field [middle]
    data.middle = _arrayDeserializer.uint16(buffer, bufferOffset, 4)
    // Deserialize message field [proximal]
    data.proximal = _arrayDeserializer.uint16(buffer, bufferOffset, 4)
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/MidProxData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8ae5331748e57fcbdb20b7e2f086fcbf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16[4] middle
    uint16[4] proximal
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MidProxData(null);
    if (msg.middle !== undefined) {
      resolved.middle = msg.middle;
    }
    else {
      resolved.middle = new Array(4).fill(0)
    }

    if (msg.proximal !== undefined) {
      resolved.proximal = msg.proximal;
    }
    else {
      resolved.proximal = new Array(4).fill(0)
    }

    return resolved;
    }
};

module.exports = MidProxData;
