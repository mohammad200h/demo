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

class PlanTrajectoryFromListRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.waypoint_names = null;
    }
    else {
      if (initObj.hasOwnProperty('waypoint_names')) {
        this.waypoint_names = initObj.waypoint_names
      }
      else {
        this.waypoint_names = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PlanTrajectoryFromListRequest
    // Serialize message field [waypoint_names]
    bufferOffset = _arraySerializer.string(obj.waypoint_names, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlanTrajectoryFromListRequest
    let len;
    let data = new PlanTrajectoryFromListRequest(null);
    // Deserialize message field [waypoint_names]
    data.waypoint_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.waypoint_names.forEach((val) => {
      length += 4 + val.length;
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/PlanTrajectoryFromListRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '77f7556176e98ec7415de9c93caf74de';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] waypoint_names
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PlanTrajectoryFromListRequest(null);
    if (msg.waypoint_names !== undefined) {
      resolved.waypoint_names = msg.waypoint_names;
    }
    else {
      resolved.waypoint_names = []
    }

    return resolved;
    }
};

class PlanTrajectoryFromListResponse {
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
    // Serializes a message object of type PlanTrajectoryFromListResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlanTrajectoryFromListResponse
    let len;
    let data = new PlanTrajectoryFromListResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/PlanTrajectoryFromListResponse';
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
    const resolved = new PlanTrajectoryFromListResponse(null);
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
  Request: PlanTrajectoryFromListRequest,
  Response: PlanTrajectoryFromListResponse,
  md5sum() { return '605c45ffa41b85052c4f100368ed2b2d'; },
  datatype() { return 'sr_robot_msgs/PlanTrajectoryFromList'; }
};
