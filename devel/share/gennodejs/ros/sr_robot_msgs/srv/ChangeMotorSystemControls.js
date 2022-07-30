// Auto-generated. Do not edit!

// (in-package sr_robot_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let MotorSystemControls = require('../msg/MotorSystemControls.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class ChangeMotorSystemControlsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.motor_system_controls = null;
    }
    else {
      if (initObj.hasOwnProperty('motor_system_controls')) {
        this.motor_system_controls = initObj.motor_system_controls
      }
      else {
        this.motor_system_controls = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ChangeMotorSystemControlsRequest
    // Serialize message field [motor_system_controls]
    // Serialize the length for message field [motor_system_controls]
    bufferOffset = _serializer.uint32(obj.motor_system_controls.length, buffer, bufferOffset);
    obj.motor_system_controls.forEach((val) => {
      bufferOffset = MotorSystemControls.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ChangeMotorSystemControlsRequest
    let len;
    let data = new ChangeMotorSystemControlsRequest(null);
    // Deserialize message field [motor_system_controls]
    // Deserialize array length for message field [motor_system_controls]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.motor_system_controls = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.motor_system_controls[i] = MotorSystemControls.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.motor_system_controls.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/ChangeMotorSystemControlsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6458c2239125c960f4d1ef4d23696a1e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    MotorSystemControls[] motor_system_controls
    
    ================================================================================
    MSG: sr_robot_msgs/MotorSystemControls
    int8 motor_id                     # the id of the motor you want to control
    
    bool enable_backlash_compensation # switch on/off backlash compensation at the motor level
    bool increase_sgl_tracking        # increment the tracking value for the left gauge
    bool decrease_sgl_tracking        # decrement the tracking value for the left gauge
    bool increase_sgr_tracking        # increment the tracking value for the right gauge
    bool decrease_sgr_tracking        # decrement the tracking value for the right gauge
    bool initiate_jiggling            # starts jiggling the given motor
    bool write_config_to_eeprom       # write the current configuration to the eeprom
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ChangeMotorSystemControlsRequest(null);
    if (msg.motor_system_controls !== undefined) {
      resolved.motor_system_controls = new Array(msg.motor_system_controls.length);
      for (let i = 0; i < resolved.motor_system_controls.length; ++i) {
        resolved.motor_system_controls[i] = MotorSystemControls.Resolve(msg.motor_system_controls[i]);
      }
    }
    else {
      resolved.motor_system_controls = []
    }

    return resolved;
    }
};

class ChangeMotorSystemControlsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ChangeMotorSystemControlsResponse
    // Serialize message field [result]
    bufferOffset = _serializer.int8(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ChangeMotorSystemControlsResponse
    let len;
    let data = new ChangeMotorSystemControlsResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/ChangeMotorSystemControlsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5dade9e97a517a3f230ed76028e54c71';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 result
    
    int8 SUCCESS=0
    int8 MOTOR_ID_OUT_OF_RANGE=-1
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ChangeMotorSystemControlsResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = 0
    }

    return resolved;
    }
};

// Constants for message
ChangeMotorSystemControlsResponse.Constants = {
  SUCCESS: 0,
  MOTOR_ID_OUT_OF_RANGE: -1,
}

module.exports = {
  Request: ChangeMotorSystemControlsRequest,
  Response: ChangeMotorSystemControlsResponse,
  md5sum() { return 'd953bca2f568403b8e2c3f41c87d9ac4'; },
  datatype() { return 'sr_robot_msgs/ChangeMotorSystemControls'; }
};
