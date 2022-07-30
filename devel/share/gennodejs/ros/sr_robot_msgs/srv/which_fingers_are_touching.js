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

class which_fingers_are_touchingRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.force_thresholds = null;
    }
    else {
      if (initObj.hasOwnProperty('force_thresholds')) {
        this.force_thresholds = initObj.force_thresholds
      }
      else {
        this.force_thresholds = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type which_fingers_are_touchingRequest
    // Serialize message field [force_thresholds]
    bufferOffset = _arraySerializer.float64(obj.force_thresholds, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type which_fingers_are_touchingRequest
    let len;
    let data = new which_fingers_are_touchingRequest(null);
    // Deserialize message field [force_thresholds]
    data.force_thresholds = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.force_thresholds.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/which_fingers_are_touchingRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f0fd736c3daac04fcc02a89421c67ccd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    
    
    float64[] force_thresholds
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new which_fingers_are_touchingRequest(null);
    if (msg.force_thresholds !== undefined) {
      resolved.force_thresholds = msg.force_thresholds;
    }
    else {
      resolved.force_thresholds = []
    }

    return resolved;
    }
};

class which_fingers_are_touchingResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.touch_forces = null;
    }
    else {
      if (initObj.hasOwnProperty('touch_forces')) {
        this.touch_forces = initObj.touch_forces
      }
      else {
        this.touch_forces = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type which_fingers_are_touchingResponse
    // Serialize message field [touch_forces]
    bufferOffset = _arraySerializer.float64(obj.touch_forces, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type which_fingers_are_touchingResponse
    let len;
    let data = new which_fingers_are_touchingResponse(null);
    // Deserialize message field [touch_forces]
    data.touch_forces = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.touch_forces.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/which_fingers_are_touchingResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f9d8b7193733b8133389d5ada08e713d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] touch_forces
    
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new which_fingers_are_touchingResponse(null);
    if (msg.touch_forces !== undefined) {
      resolved.touch_forces = msg.touch_forces;
    }
    else {
      resolved.touch_forces = []
    }

    return resolved;
    }
};

module.exports = {
  Request: which_fingers_are_touchingRequest,
  Response: which_fingers_are_touchingResponse,
  md5sum() { return '5db90fdcbce6b7b34ac0a1f94863f7e2'; },
  datatype() { return 'sr_robot_msgs/which_fingers_are_touching'; }
};
