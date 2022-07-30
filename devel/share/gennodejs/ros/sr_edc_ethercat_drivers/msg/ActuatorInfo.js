// Auto-generated. Do not edit!

// (in-package sr_edc_ethercat_drivers.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ActuatorInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.slow_motor_current_limit = null;
      this.quick_motor_current_limit = null;
      this.duty_limit = null;
      this.max_duty = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('slow_motor_current_limit')) {
        this.slow_motor_current_limit = initObj.slow_motor_current_limit
      }
      else {
        this.slow_motor_current_limit = 0.0;
      }
      if (initObj.hasOwnProperty('quick_motor_current_limit')) {
        this.quick_motor_current_limit = initObj.quick_motor_current_limit
      }
      else {
        this.quick_motor_current_limit = 0.0;
      }
      if (initObj.hasOwnProperty('duty_limit')) {
        this.duty_limit = initObj.duty_limit
      }
      else {
        this.duty_limit = 0.0;
      }
      if (initObj.hasOwnProperty('max_duty')) {
        this.max_duty = initObj.max_duty
      }
      else {
        this.max_duty = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ActuatorInfo
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [slow_motor_current_limit]
    bufferOffset = _serializer.float64(obj.slow_motor_current_limit, buffer, bufferOffset);
    // Serialize message field [quick_motor_current_limit]
    bufferOffset = _serializer.float64(obj.quick_motor_current_limit, buffer, bufferOffset);
    // Serialize message field [duty_limit]
    bufferOffset = _serializer.float64(obj.duty_limit, buffer, bufferOffset);
    // Serialize message field [max_duty]
    bufferOffset = _serializer.float64(obj.max_duty, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ActuatorInfo
    let len;
    let data = new ActuatorInfo(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [slow_motor_current_limit]
    data.slow_motor_current_limit = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [quick_motor_current_limit]
    data.quick_motor_current_limit = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [duty_limit]
    data.duty_limit = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [max_duty]
    data.max_duty = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.name.length;
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_edc_ethercat_drivers/ActuatorInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b69309b2980b8b35e7e2b52bad59330a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name
    float64 slow_motor_current_limit
    float64 quick_motor_current_limit
    float64 duty_limit
    float64 max_duty
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ActuatorInfo(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.slow_motor_current_limit !== undefined) {
      resolved.slow_motor_current_limit = msg.slow_motor_current_limit;
    }
    else {
      resolved.slow_motor_current_limit = 0.0
    }

    if (msg.quick_motor_current_limit !== undefined) {
      resolved.quick_motor_current_limit = msg.quick_motor_current_limit;
    }
    else {
      resolved.quick_motor_current_limit = 0.0
    }

    if (msg.duty_limit !== undefined) {
      resolved.duty_limit = msg.duty_limit;
    }
    else {
      resolved.duty_limit = 0.0
    }

    if (msg.max_duty !== undefined) {
      resolved.max_duty = msg.max_duty;
    }
    else {
      resolved.max_duty = 0.0
    }

    return resolved;
    }
};

module.exports = ActuatorInfo;
