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

class SimpleMotorFlasherRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.firmware = null;
      this.motor_id = null;
    }
    else {
      if (initObj.hasOwnProperty('firmware')) {
        this.firmware = initObj.firmware
      }
      else {
        this.firmware = '';
      }
      if (initObj.hasOwnProperty('motor_id')) {
        this.motor_id = initObj.motor_id
      }
      else {
        this.motor_id = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SimpleMotorFlasherRequest
    // Serialize message field [firmware]
    bufferOffset = _serializer.string(obj.firmware, buffer, bufferOffset);
    // Serialize message field [motor_id]
    bufferOffset = _serializer.int8(obj.motor_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SimpleMotorFlasherRequest
    let len;
    let data = new SimpleMotorFlasherRequest(null);
    // Deserialize message field [firmware]
    data.firmware = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [motor_id]
    data.motor_id = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.firmware.length;
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/SimpleMotorFlasherRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '95979d9c30a49ed16e3ab17fe0edb157';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string firmware
    int8 motor_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SimpleMotorFlasherRequest(null);
    if (msg.firmware !== undefined) {
      resolved.firmware = msg.firmware;
    }
    else {
      resolved.firmware = ''
    }

    if (msg.motor_id !== undefined) {
      resolved.motor_id = msg.motor_id;
    }
    else {
      resolved.motor_id = 0
    }

    return resolved;
    }
};

class SimpleMotorFlasherResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.value = null;
    }
    else {
      if (initObj.hasOwnProperty('value')) {
        this.value = initObj.value
      }
      else {
        this.value = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SimpleMotorFlasherResponse
    // Serialize message field [value]
    bufferOffset = _serializer.int32(obj.value, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SimpleMotorFlasherResponse
    let len;
    let data = new SimpleMotorFlasherResponse(null);
    // Deserialize message field [value]
    data.value = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/SimpleMotorFlasherResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '57a3be4812415ba24758cca00aebf53f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 value
    
    int32 SUCCESS = 0
    int32 FAIL = 1
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SimpleMotorFlasherResponse(null);
    if (msg.value !== undefined) {
      resolved.value = msg.value;
    }
    else {
      resolved.value = 0
    }

    return resolved;
    }
};

// Constants for message
SimpleMotorFlasherResponse.Constants = {
  SUCCESS: 0,
  FAIL: 1,
}

module.exports = {
  Request: SimpleMotorFlasherRequest,
  Response: SimpleMotorFlasherResponse,
  md5sum() { return 'b5e4cd4b44ed54dd8f018caf24a9e0c1'; },
  datatype() { return 'sr_robot_msgs/SimpleMotorFlasher'; }
};
