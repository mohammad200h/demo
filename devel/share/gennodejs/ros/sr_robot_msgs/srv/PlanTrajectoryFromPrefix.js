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

class PlanTrajectoryFromPrefixRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.prefix = null;
    }
    else {
      if (initObj.hasOwnProperty('prefix')) {
        this.prefix = initObj.prefix
      }
      else {
        this.prefix = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PlanTrajectoryFromPrefixRequest
    // Serialize message field [prefix]
    bufferOffset = _serializer.string(obj.prefix, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlanTrajectoryFromPrefixRequest
    let len;
    let data = new PlanTrajectoryFromPrefixRequest(null);
    // Deserialize message field [prefix]
    data.prefix = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.prefix.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/PlanTrajectoryFromPrefixRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8a471f61d96890d8f43bc26d6b147ee7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string prefix
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PlanTrajectoryFromPrefixRequest(null);
    if (msg.prefix !== undefined) {
      resolved.prefix = msg.prefix;
    }
    else {
      resolved.prefix = ''
    }

    return resolved;
    }
};

class PlanTrajectoryFromPrefixResponse {
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
    // Serializes a message object of type PlanTrajectoryFromPrefixResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlanTrajectoryFromPrefixResponse
    let len;
    let data = new PlanTrajectoryFromPrefixResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/PlanTrajectoryFromPrefixResponse';
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
    const resolved = new PlanTrajectoryFromPrefixResponse(null);
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
  Request: PlanTrajectoryFromPrefixRequest,
  Response: PlanTrajectoryFromPrefixResponse,
  md5sum() { return '2311a2368ccb73aeef583bd78e497f75'; },
  datatype() { return 'sr_robot_msgs/PlanTrajectoryFromPrefix'; }
};
