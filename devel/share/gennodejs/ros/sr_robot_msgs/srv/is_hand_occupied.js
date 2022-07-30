// Auto-generated. Do not edit!

// (in-package sr_robot_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class is_hand_occupiedRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type is_hand_occupiedRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type is_hand_occupiedRequest
    let len;
    let data = new is_hand_occupiedRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/is_hand_occupiedRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new is_hand_occupiedRequest(null);
    return resolved;
    }
};

class is_hand_occupiedResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.hand_occupied = null;
    }
    else {
      if (initObj.hasOwnProperty('hand_occupied')) {
        this.hand_occupied = initObj.hand_occupied
      }
      else {
        this.hand_occupied = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type is_hand_occupiedResponse
    // Serialize message field [hand_occupied]
    bufferOffset = _serializer.bool(obj.hand_occupied, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type is_hand_occupiedResponse
    let len;
    let data = new is_hand_occupiedResponse(null);
    // Deserialize message field [hand_occupied]
    data.hand_occupied = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/is_hand_occupiedResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '62624a9d19535f7a135d1ce1fc0d0450';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool hand_occupied
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new is_hand_occupiedResponse(null);
    if (msg.hand_occupied !== undefined) {
      resolved.hand_occupied = msg.hand_occupied;
    }
    else {
      resolved.hand_occupied = false
    }

    return resolved;
    }
};

module.exports = {
  Request: is_hand_occupiedRequest,
  Response: is_hand_occupiedResponse,
  md5sum() { return '62624a9d19535f7a135d1ce1fc0d0450'; },
  datatype() { return 'sr_robot_msgs/is_hand_occupied'; }
};
