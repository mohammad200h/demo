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

class SetImuScaleRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.scale = null;
    }
    else {
      if (initObj.hasOwnProperty('scale')) {
        this.scale = initObj.scale
      }
      else {
        this.scale = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetImuScaleRequest
    // Serialize message field [scale]
    bufferOffset = _serializer.int8(obj.scale, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetImuScaleRequest
    let len;
    let data = new SetImuScaleRequest(null);
    // Deserialize message field [scale]
    data.scale = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/SetImuScaleRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f39b7f810a4fc89f40be566bb3e21265';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 scale
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetImuScaleRequest(null);
    if (msg.scale !== undefined) {
      resolved.scale = msg.scale;
    }
    else {
      resolved.scale = 0
    }

    return resolved;
    }
};

class SetImuScaleResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetImuScaleResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetImuScaleResponse
    let len;
    let data = new SetImuScaleResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/SetImuScaleResponse';
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
    const resolved = new SetImuScaleResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: SetImuScaleRequest,
  Response: SetImuScaleResponse,
  md5sum() { return 'f39b7f810a4fc89f40be566bb3e21265'; },
  datatype() { return 'sr_robot_msgs/SetImuScale'; }
};
