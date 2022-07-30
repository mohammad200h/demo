// Auto-generated. Do not edit!

// (in-package sr_robot_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ControlType = require('../msg/ControlType.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class ChangeControlTypeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.control_type = null;
    }
    else {
      if (initObj.hasOwnProperty('control_type')) {
        this.control_type = initObj.control_type
      }
      else {
        this.control_type = new ControlType();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ChangeControlTypeRequest
    // Serialize message field [control_type]
    bufferOffset = ControlType.serialize(obj.control_type, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ChangeControlTypeRequest
    let len;
    let data = new ChangeControlTypeRequest(null);
    // Deserialize message field [control_type]
    data.control_type = ControlType.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/ChangeControlTypeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '36741247c0d6032654e8e0ef56e7670f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ControlType control_type
    
    ================================================================================
    MSG: sr_robot_msgs/ControlType
    int16 control_type
    
    int16 PWM=0
    int16 FORCE=1
    
    #used to query which control type we're using. won't change the control type
    int16 QUERY=-1
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ChangeControlTypeRequest(null);
    if (msg.control_type !== undefined) {
      resolved.control_type = ControlType.Resolve(msg.control_type)
    }
    else {
      resolved.control_type = new ControlType()
    }

    return resolved;
    }
};

class ChangeControlTypeResponse {
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
        this.result = new ControlType();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ChangeControlTypeResponse
    // Serialize message field [result]
    bufferOffset = ControlType.serialize(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ChangeControlTypeResponse
    let len;
    let data = new ChangeControlTypeResponse(null);
    // Deserialize message field [result]
    data.result = ControlType.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/ChangeControlTypeResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2a6d00c524e195eb671dbbbb7783aee1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ControlType result
    
    ================================================================================
    MSG: sr_robot_msgs/ControlType
    int16 control_type
    
    int16 PWM=0
    int16 FORCE=1
    
    #used to query which control type we're using. won't change the control type
    int16 QUERY=-1
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ChangeControlTypeResponse(null);
    if (msg.result !== undefined) {
      resolved.result = ControlType.Resolve(msg.result)
    }
    else {
      resolved.result = new ControlType()
    }

    return resolved;
    }
};

module.exports = {
  Request: ChangeControlTypeRequest,
  Response: ChangeControlTypeResponse,
  md5sum() { return '14cedf5030b722e2c8df2dc57f9cdb58'; },
  datatype() { return 'sr_robot_msgs/ChangeControlType'; }
};
