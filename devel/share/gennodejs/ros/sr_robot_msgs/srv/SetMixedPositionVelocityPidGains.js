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

class SetMixedPositionVelocityPidGainsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.position_p = null;
      this.position_i = null;
      this.position_d = null;
      this.position_i_clamp = null;
      this.min_velocity = null;
      this.max_velocity = null;
      this.position_deadband = null;
      this.velocity_p = null;
      this.velocity_i = null;
      this.velocity_d = null;
      this.velocity_i_clamp = null;
      this.max_force = null;
      this.friction_deadband = null;
    }
    else {
      if (initObj.hasOwnProperty('position_p')) {
        this.position_p = initObj.position_p
      }
      else {
        this.position_p = 0.0;
      }
      if (initObj.hasOwnProperty('position_i')) {
        this.position_i = initObj.position_i
      }
      else {
        this.position_i = 0.0;
      }
      if (initObj.hasOwnProperty('position_d')) {
        this.position_d = initObj.position_d
      }
      else {
        this.position_d = 0.0;
      }
      if (initObj.hasOwnProperty('position_i_clamp')) {
        this.position_i_clamp = initObj.position_i_clamp
      }
      else {
        this.position_i_clamp = 0.0;
      }
      if (initObj.hasOwnProperty('min_velocity')) {
        this.min_velocity = initObj.min_velocity
      }
      else {
        this.min_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('max_velocity')) {
        this.max_velocity = initObj.max_velocity
      }
      else {
        this.max_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('position_deadband')) {
        this.position_deadband = initObj.position_deadband
      }
      else {
        this.position_deadband = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_p')) {
        this.velocity_p = initObj.velocity_p
      }
      else {
        this.velocity_p = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_i')) {
        this.velocity_i = initObj.velocity_i
      }
      else {
        this.velocity_i = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_d')) {
        this.velocity_d = initObj.velocity_d
      }
      else {
        this.velocity_d = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_i_clamp')) {
        this.velocity_i_clamp = initObj.velocity_i_clamp
      }
      else {
        this.velocity_i_clamp = 0.0;
      }
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
    // Serializes a message object of type SetMixedPositionVelocityPidGainsRequest
    // Serialize message field [position_p]
    bufferOffset = _serializer.float64(obj.position_p, buffer, bufferOffset);
    // Serialize message field [position_i]
    bufferOffset = _serializer.float64(obj.position_i, buffer, bufferOffset);
    // Serialize message field [position_d]
    bufferOffset = _serializer.float64(obj.position_d, buffer, bufferOffset);
    // Serialize message field [position_i_clamp]
    bufferOffset = _serializer.float64(obj.position_i_clamp, buffer, bufferOffset);
    // Serialize message field [min_velocity]
    bufferOffset = _serializer.float64(obj.min_velocity, buffer, bufferOffset);
    // Serialize message field [max_velocity]
    bufferOffset = _serializer.float64(obj.max_velocity, buffer, bufferOffset);
    // Serialize message field [position_deadband]
    bufferOffset = _serializer.float64(obj.position_deadband, buffer, bufferOffset);
    // Serialize message field [velocity_p]
    bufferOffset = _serializer.float64(obj.velocity_p, buffer, bufferOffset);
    // Serialize message field [velocity_i]
    bufferOffset = _serializer.float64(obj.velocity_i, buffer, bufferOffset);
    // Serialize message field [velocity_d]
    bufferOffset = _serializer.float64(obj.velocity_d, buffer, bufferOffset);
    // Serialize message field [velocity_i_clamp]
    bufferOffset = _serializer.float64(obj.velocity_i_clamp, buffer, bufferOffset);
    // Serialize message field [max_force]
    bufferOffset = _serializer.float64(obj.max_force, buffer, bufferOffset);
    // Serialize message field [friction_deadband]
    bufferOffset = _serializer.int32(obj.friction_deadband, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetMixedPositionVelocityPidGainsRequest
    let len;
    let data = new SetMixedPositionVelocityPidGainsRequest(null);
    // Deserialize message field [position_p]
    data.position_p = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [position_i]
    data.position_i = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [position_d]
    data.position_d = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [position_i_clamp]
    data.position_i_clamp = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [min_velocity]
    data.min_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [max_velocity]
    data.max_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [position_deadband]
    data.position_deadband = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity_p]
    data.velocity_p = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity_i]
    data.velocity_i = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity_d]
    data.velocity_d = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity_i_clamp]
    data.velocity_i_clamp = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [max_force]
    data.max_force = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [friction_deadband]
    data.friction_deadband = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 100;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/SetMixedPositionVelocityPidGainsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ff95ce4d442c9454d3d943f0c999da89';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 position_p
    float64 position_i
    float64 position_d
    float64 position_i_clamp
    float64 min_velocity
    float64 max_velocity
    float64 position_deadband
    
    float64 velocity_p
    float64 velocity_i
    float64 velocity_d
    float64 velocity_i_clamp
    float64 max_force
    
    int32 friction_deadband
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetMixedPositionVelocityPidGainsRequest(null);
    if (msg.position_p !== undefined) {
      resolved.position_p = msg.position_p;
    }
    else {
      resolved.position_p = 0.0
    }

    if (msg.position_i !== undefined) {
      resolved.position_i = msg.position_i;
    }
    else {
      resolved.position_i = 0.0
    }

    if (msg.position_d !== undefined) {
      resolved.position_d = msg.position_d;
    }
    else {
      resolved.position_d = 0.0
    }

    if (msg.position_i_clamp !== undefined) {
      resolved.position_i_clamp = msg.position_i_clamp;
    }
    else {
      resolved.position_i_clamp = 0.0
    }

    if (msg.min_velocity !== undefined) {
      resolved.min_velocity = msg.min_velocity;
    }
    else {
      resolved.min_velocity = 0.0
    }

    if (msg.max_velocity !== undefined) {
      resolved.max_velocity = msg.max_velocity;
    }
    else {
      resolved.max_velocity = 0.0
    }

    if (msg.position_deadband !== undefined) {
      resolved.position_deadband = msg.position_deadband;
    }
    else {
      resolved.position_deadband = 0.0
    }

    if (msg.velocity_p !== undefined) {
      resolved.velocity_p = msg.velocity_p;
    }
    else {
      resolved.velocity_p = 0.0
    }

    if (msg.velocity_i !== undefined) {
      resolved.velocity_i = msg.velocity_i;
    }
    else {
      resolved.velocity_i = 0.0
    }

    if (msg.velocity_d !== undefined) {
      resolved.velocity_d = msg.velocity_d;
    }
    else {
      resolved.velocity_d = 0.0
    }

    if (msg.velocity_i_clamp !== undefined) {
      resolved.velocity_i_clamp = msg.velocity_i_clamp;
    }
    else {
      resolved.velocity_i_clamp = 0.0
    }

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

class SetMixedPositionVelocityPidGainsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetMixedPositionVelocityPidGainsResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetMixedPositionVelocityPidGainsResponse
    let len;
    let data = new SetMixedPositionVelocityPidGainsResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/SetMixedPositionVelocityPidGainsResponse';
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
    const resolved = new SetMixedPositionVelocityPidGainsResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: SetMixedPositionVelocityPidGainsRequest,
  Response: SetMixedPositionVelocityPidGainsResponse,
  md5sum() { return 'ff95ce4d442c9454d3d943f0c999da89'; },
  datatype() { return 'sr_robot_msgs/SetMixedPositionVelocityPidGains'; }
};
