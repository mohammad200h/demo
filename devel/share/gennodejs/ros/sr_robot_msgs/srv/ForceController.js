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

class ForceControllerRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.maxpwm = null;
      this.sgleftref = null;
      this.sgrightref = null;
      this.f = null;
      this.p = null;
      this.i = null;
      this.d = null;
      this.imax = null;
      this.deadband = null;
      this.sign = null;
      this.torque_limit = null;
      this.torque_limiter_gain = null;
    }
    else {
      if (initObj.hasOwnProperty('maxpwm')) {
        this.maxpwm = initObj.maxpwm
      }
      else {
        this.maxpwm = 0;
      }
      if (initObj.hasOwnProperty('sgleftref')) {
        this.sgleftref = initObj.sgleftref
      }
      else {
        this.sgleftref = 0;
      }
      if (initObj.hasOwnProperty('sgrightref')) {
        this.sgrightref = initObj.sgrightref
      }
      else {
        this.sgrightref = 0;
      }
      if (initObj.hasOwnProperty('f')) {
        this.f = initObj.f
      }
      else {
        this.f = 0;
      }
      if (initObj.hasOwnProperty('p')) {
        this.p = initObj.p
      }
      else {
        this.p = 0;
      }
      if (initObj.hasOwnProperty('i')) {
        this.i = initObj.i
      }
      else {
        this.i = 0;
      }
      if (initObj.hasOwnProperty('d')) {
        this.d = initObj.d
      }
      else {
        this.d = 0;
      }
      if (initObj.hasOwnProperty('imax')) {
        this.imax = initObj.imax
      }
      else {
        this.imax = 0;
      }
      if (initObj.hasOwnProperty('deadband')) {
        this.deadband = initObj.deadband
      }
      else {
        this.deadband = 0;
      }
      if (initObj.hasOwnProperty('sign')) {
        this.sign = initObj.sign
      }
      else {
        this.sign = 0;
      }
      if (initObj.hasOwnProperty('torque_limit')) {
        this.torque_limit = initObj.torque_limit
      }
      else {
        this.torque_limit = 0;
      }
      if (initObj.hasOwnProperty('torque_limiter_gain')) {
        this.torque_limiter_gain = initObj.torque_limiter_gain
      }
      else {
        this.torque_limiter_gain = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ForceControllerRequest
    // Serialize message field [maxpwm]
    bufferOffset = _serializer.int16(obj.maxpwm, buffer, bufferOffset);
    // Serialize message field [sgleftref]
    bufferOffset = _serializer.int16(obj.sgleftref, buffer, bufferOffset);
    // Serialize message field [sgrightref]
    bufferOffset = _serializer.int16(obj.sgrightref, buffer, bufferOffset);
    // Serialize message field [f]
    bufferOffset = _serializer.int16(obj.f, buffer, bufferOffset);
    // Serialize message field [p]
    bufferOffset = _serializer.int16(obj.p, buffer, bufferOffset);
    // Serialize message field [i]
    bufferOffset = _serializer.int16(obj.i, buffer, bufferOffset);
    // Serialize message field [d]
    bufferOffset = _serializer.int16(obj.d, buffer, bufferOffset);
    // Serialize message field [imax]
    bufferOffset = _serializer.int16(obj.imax, buffer, bufferOffset);
    // Serialize message field [deadband]
    bufferOffset = _serializer.int16(obj.deadband, buffer, bufferOffset);
    // Serialize message field [sign]
    bufferOffset = _serializer.int16(obj.sign, buffer, bufferOffset);
    // Serialize message field [torque_limit]
    bufferOffset = _serializer.int16(obj.torque_limit, buffer, bufferOffset);
    // Serialize message field [torque_limiter_gain]
    bufferOffset = _serializer.int16(obj.torque_limiter_gain, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ForceControllerRequest
    let len;
    let data = new ForceControllerRequest(null);
    // Deserialize message field [maxpwm]
    data.maxpwm = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [sgleftref]
    data.sgleftref = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [sgrightref]
    data.sgrightref = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [f]
    data.f = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [p]
    data.p = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [i]
    data.i = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [d]
    data.d = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [imax]
    data.imax = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [deadband]
    data.deadband = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [sign]
    data.sign = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [torque_limit]
    data.torque_limit = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [torque_limiter_gain]
    data.torque_limiter_gain = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/ForceControllerRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ed276d9ce996f859e20d6bd1f9b633f5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 maxpwm
    int16 sgleftref
    int16 sgrightref
    int16 f
    int16 p
    int16 i
    int16 d
    int16 imax
    int16 deadband
    int16 sign
    int16 torque_limit
    int16 torque_limiter_gain
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ForceControllerRequest(null);
    if (msg.maxpwm !== undefined) {
      resolved.maxpwm = msg.maxpwm;
    }
    else {
      resolved.maxpwm = 0
    }

    if (msg.sgleftref !== undefined) {
      resolved.sgleftref = msg.sgleftref;
    }
    else {
      resolved.sgleftref = 0
    }

    if (msg.sgrightref !== undefined) {
      resolved.sgrightref = msg.sgrightref;
    }
    else {
      resolved.sgrightref = 0
    }

    if (msg.f !== undefined) {
      resolved.f = msg.f;
    }
    else {
      resolved.f = 0
    }

    if (msg.p !== undefined) {
      resolved.p = msg.p;
    }
    else {
      resolved.p = 0
    }

    if (msg.i !== undefined) {
      resolved.i = msg.i;
    }
    else {
      resolved.i = 0
    }

    if (msg.d !== undefined) {
      resolved.d = msg.d;
    }
    else {
      resolved.d = 0
    }

    if (msg.imax !== undefined) {
      resolved.imax = msg.imax;
    }
    else {
      resolved.imax = 0
    }

    if (msg.deadband !== undefined) {
      resolved.deadband = msg.deadband;
    }
    else {
      resolved.deadband = 0
    }

    if (msg.sign !== undefined) {
      resolved.sign = msg.sign;
    }
    else {
      resolved.sign = 0
    }

    if (msg.torque_limit !== undefined) {
      resolved.torque_limit = msg.torque_limit;
    }
    else {
      resolved.torque_limit = 0
    }

    if (msg.torque_limiter_gain !== undefined) {
      resolved.torque_limiter_gain = msg.torque_limiter_gain;
    }
    else {
      resolved.torque_limiter_gain = 0
    }

    return resolved;
    }
};

class ForceControllerResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.configured = null;
    }
    else {
      if (initObj.hasOwnProperty('configured')) {
        this.configured = initObj.configured
      }
      else {
        this.configured = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ForceControllerResponse
    // Serialize message field [configured]
    bufferOffset = _serializer.bool(obj.configured, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ForceControllerResponse
    let len;
    let data = new ForceControllerResponse(null);
    // Deserialize message field [configured]
    data.configured = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/ForceControllerResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd3b1a74026985b10664594fe60a8c3eb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool configured
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ForceControllerResponse(null);
    if (msg.configured !== undefined) {
      resolved.configured = msg.configured;
    }
    else {
      resolved.configured = false
    }

    return resolved;
    }
};

module.exports = {
  Request: ForceControllerRequest,
  Response: ForceControllerResponse,
  md5sum() { return '196995b160417ed9330477132c6b834a'; },
  datatype() { return 'sr_robot_msgs/ForceController'; }
};
