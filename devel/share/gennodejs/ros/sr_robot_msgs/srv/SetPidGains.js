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

class SetPidGainsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.p = null;
      this.i = null;
      this.d = null;
      this.i_clamp = null;
      this.max_force = null;
      this.deadband = null;
      this.friction_deadband = null;
    }
    else {
      if (initObj.hasOwnProperty('p')) {
        this.p = initObj.p
      }
      else {
        this.p = 0.0;
      }
      if (initObj.hasOwnProperty('i')) {
        this.i = initObj.i
      }
      else {
        this.i = 0.0;
      }
      if (initObj.hasOwnProperty('d')) {
        this.d = initObj.d
      }
      else {
        this.d = 0.0;
      }
      if (initObj.hasOwnProperty('i_clamp')) {
        this.i_clamp = initObj.i_clamp
      }
      else {
        this.i_clamp = 0.0;
      }
      if (initObj.hasOwnProperty('max_force')) {
        this.max_force = initObj.max_force
      }
      else {
        this.max_force = 0.0;
      }
      if (initObj.hasOwnProperty('deadband')) {
        this.deadband = initObj.deadband
      }
      else {
        this.deadband = 0.0;
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
    // Serializes a message object of type SetPidGainsRequest
    // Serialize message field [p]
    bufferOffset = _serializer.float64(obj.p, buffer, bufferOffset);
    // Serialize message field [i]
    bufferOffset = _serializer.float64(obj.i, buffer, bufferOffset);
    // Serialize message field [d]
    bufferOffset = _serializer.float64(obj.d, buffer, bufferOffset);
    // Serialize message field [i_clamp]
    bufferOffset = _serializer.float64(obj.i_clamp, buffer, bufferOffset);
    // Serialize message field [max_force]
    bufferOffset = _serializer.float64(obj.max_force, buffer, bufferOffset);
    // Serialize message field [deadband]
    bufferOffset = _serializer.float64(obj.deadband, buffer, bufferOffset);
    // Serialize message field [friction_deadband]
    bufferOffset = _serializer.int32(obj.friction_deadband, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetPidGainsRequest
    let len;
    let data = new SetPidGainsRequest(null);
    // Deserialize message field [p]
    data.p = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [i]
    data.i = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [d]
    data.d = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [i_clamp]
    data.i_clamp = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [max_force]
    data.max_force = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [deadband]
    data.deadband = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [friction_deadband]
    data.friction_deadband = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 52;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/SetPidGainsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f9c5176e998bba30344c4892f975be3a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 p
    float64 i
    float64 d
    float64 i_clamp
    float64 max_force
    float64 deadband
    int32 friction_deadband
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetPidGainsRequest(null);
    if (msg.p !== undefined) {
      resolved.p = msg.p;
    }
    else {
      resolved.p = 0.0
    }

    if (msg.i !== undefined) {
      resolved.i = msg.i;
    }
    else {
      resolved.i = 0.0
    }

    if (msg.d !== undefined) {
      resolved.d = msg.d;
    }
    else {
      resolved.d = 0.0
    }

    if (msg.i_clamp !== undefined) {
      resolved.i_clamp = msg.i_clamp;
    }
    else {
      resolved.i_clamp = 0.0
    }

    if (msg.max_force !== undefined) {
      resolved.max_force = msg.max_force;
    }
    else {
      resolved.max_force = 0.0
    }

    if (msg.deadband !== undefined) {
      resolved.deadband = msg.deadband;
    }
    else {
      resolved.deadband = 0.0
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

class SetPidGainsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetPidGainsResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetPidGainsResponse
    let len;
    let data = new SetPidGainsResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/SetPidGainsResponse';
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
    const resolved = new SetPidGainsResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: SetPidGainsRequest,
  Response: SetPidGainsResponse,
  md5sum() { return 'f9c5176e998bba30344c4892f975be3a'; },
  datatype() { return 'sr_robot_msgs/SetPidGains'; }
};
