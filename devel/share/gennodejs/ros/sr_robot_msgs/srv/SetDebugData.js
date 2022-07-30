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

class SetDebugDataRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.motor_index = null;
      this.motor_data_type = null;
      this.publisher_index = null;
    }
    else {
      if (initObj.hasOwnProperty('motor_index')) {
        this.motor_index = initObj.motor_index
      }
      else {
        this.motor_index = 0;
      }
      if (initObj.hasOwnProperty('motor_data_type')) {
        this.motor_data_type = initObj.motor_data_type
      }
      else {
        this.motor_data_type = 0;
      }
      if (initObj.hasOwnProperty('publisher_index')) {
        this.publisher_index = initObj.publisher_index
      }
      else {
        this.publisher_index = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetDebugDataRequest
    // Serialize message field [motor_index]
    bufferOffset = _serializer.int16(obj.motor_index, buffer, bufferOffset);
    // Serialize message field [motor_data_type]
    bufferOffset = _serializer.int16(obj.motor_data_type, buffer, bufferOffset);
    // Serialize message field [publisher_index]
    bufferOffset = _serializer.int16(obj.publisher_index, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetDebugDataRequest
    let len;
    let data = new SetDebugDataRequest(null);
    // Deserialize message field [motor_index]
    data.motor_index = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [motor_data_type]
    data.motor_data_type = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [publisher_index]
    data.publisher_index = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 6;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/SetDebugDataRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9f31db3c8e178b58a93d06e8bde6a17a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    
    
    int16 motor_index
    int16 motor_data_type
    int16 publisher_index
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetDebugDataRequest(null);
    if (msg.motor_index !== undefined) {
      resolved.motor_index = msg.motor_index;
    }
    else {
      resolved.motor_index = 0
    }

    if (msg.motor_data_type !== undefined) {
      resolved.motor_data_type = msg.motor_data_type;
    }
    else {
      resolved.motor_data_type = 0
    }

    if (msg.publisher_index !== undefined) {
      resolved.publisher_index = msg.publisher_index;
    }
    else {
      resolved.publisher_index = 0
    }

    return resolved;
    }
};

class SetDebugDataResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetDebugDataResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetDebugDataResponse
    let len;
    let data = new SetDebugDataResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/SetDebugDataResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetDebugDataResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: SetDebugDataRequest,
  Response: SetDebugDataResponse,
  md5sum() { return '7e92428f248882f525037fe3b24dbbf1'; },
  datatype() { return 'sr_robot_msgs/SetDebugData'; }
};
