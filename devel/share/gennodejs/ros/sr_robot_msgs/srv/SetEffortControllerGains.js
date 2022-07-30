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

class SetEffortControllerGainsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.max_force = null;
      this.friction_deadband = null;
    }
    else {
      if (initObj.hasOwnProperty('max_force')) {
        this.max_force = initObj.max_force
      }
      else {
        this.max_force = 0.0;
      }
      if (initObj.hasOwnProperty('friction_deadband')) {
        this.friction_deadband = initObj.friction_deadband
      }
      else {
        this.friction_deadband = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetEffortControllerGainsRequest
    // Serialize message field [max_force]
    bufferOffset = _serializer.float64(obj.max_force, buffer, bufferOffset);
    // Serialize message field [friction_deadband]
    bufferOffset = _serializer.int32(obj.friction_deadband, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetEffortControllerGainsRequest
    let len;
    let data = new SetEffortControllerGainsRequest(null);
    // Deserialize message field [max_force]
    data.max_force = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [friction_deadband]
    data.friction_deadband = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/SetEffortControllerGainsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '96397d148b84b1d0a8fe84ee1744fece';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 max_force
    int32 friction_deadband
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetEffortControllerGainsRequest(null);
    if (msg.max_force !== undefined) {
      resolved.max_force = msg.max_force;
    }
    else {
      resolved.max_force = 0.0
    }

    if (msg.friction_deadband !== undefined) {
      resolved.friction_deadband = msg.friction_deadband;
    }
    else {
      resolved.friction_deadband = 0
    }

    return resolved;
    }
};

class SetEffortControllerGainsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetEffortControllerGainsResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetEffortControllerGainsResponse
    let len;
    let data = new SetEffortControllerGainsResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/SetEffortControllerGainsResponse';
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
    const resolved = new SetEffortControllerGainsResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: SetEffortControllerGainsRequest,
  Response: SetEffortControllerGainsResponse,
  md5sum() { return '96397d148b84b1d0a8fe84ee1744fece'; },
  datatype() { return 'sr_robot_msgs/SetEffortControllerGains'; }
};
