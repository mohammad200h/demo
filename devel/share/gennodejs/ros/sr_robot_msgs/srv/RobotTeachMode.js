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

class RobotTeachModeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.teach_mode = null;
      this.robot = null;
    }
    else {
      if (initObj.hasOwnProperty('teach_mode')) {
        this.teach_mode = initObj.teach_mode
      }
      else {
        this.teach_mode = 0;
      }
      if (initObj.hasOwnProperty('robot')) {
        this.robot = initObj.robot
      }
      else {
        this.robot = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotTeachModeRequest
    // Serialize message field [teach_mode]
    bufferOffset = _serializer.uint32(obj.teach_mode, buffer, bufferOffset);
    // Serialize message field [robot]
    bufferOffset = _serializer.string(obj.robot, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotTeachModeRequest
    let len;
    let data = new RobotTeachModeRequest(null);
    // Deserialize message field [teach_mode]
    data.teach_mode = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [robot]
    data.robot = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.robot.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/RobotTeachModeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7048255afae70ddeae934765817d38c1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    uint32 TRAJECTORY_MODE=0
    
    uint32 TEACH_MODE=1
    
    uint32 POSITION_MODE=2
    
    
    uint32 teach_mode
    string robot
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotTeachModeRequest(null);
    if (msg.teach_mode !== undefined) {
      resolved.teach_mode = msg.teach_mode;
    }
    else {
      resolved.teach_mode = 0
    }

    if (msg.robot !== undefined) {
      resolved.robot = msg.robot;
    }
    else {
      resolved.robot = ''
    }

    return resolved;
    }
};

// Constants for message
RobotTeachModeRequest.Constants = {
  TRAJECTORY_MODE: 0,
  TEACH_MODE: 1,
  POSITION_MODE: 2,
}

class RobotTeachModeResponse {
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
    // Serializes a message object of type RobotTeachModeResponse
    // Serialize message field [result]
    bufferOffset = _serializer.int32(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotTeachModeResponse
    let len;
    let data = new RobotTeachModeResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_robot_msgs/RobotTeachModeResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2a770f51372374e47c2a806eb57ca87c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    int32 ERROR=-1
    int32 SUCCESS=0
    
    
    int32 result
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotTeachModeResponse(null);
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
RobotTeachModeResponse.Constants = {
  ERROR: -1,
  SUCCESS: 0,
}

module.exports = {
  Request: RobotTeachModeRequest,
  Response: RobotTeachModeResponse,
  md5sum() { return 'c6613d1d4bc3ca4c55986e93b2eaff93'; },
  datatype() { return 'sr_robot_msgs/RobotTeachMode'; }
};
