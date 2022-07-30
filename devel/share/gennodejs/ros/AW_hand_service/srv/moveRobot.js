// Auto-generated. Do not edit!

// (in-package AW_hand_service.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class moveRobotRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.obj_x = null;
      this.obj_y = null;
      this.obj_z = null;
    }
    else {
      if (initObj.hasOwnProperty('obj_x')) {
        this.obj_x = initObj.obj_x
      }
      else {
        this.obj_x = 0.0;
      }
      if (initObj.hasOwnProperty('obj_y')) {
        this.obj_y = initObj.obj_y
      }
      else {
        this.obj_y = 0.0;
      }
      if (initObj.hasOwnProperty('obj_z')) {
        this.obj_z = initObj.obj_z
      }
      else {
        this.obj_z = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type moveRobotRequest
    // Serialize message field [obj_x]
    bufferOffset = _serializer.float64(obj.obj_x, buffer, bufferOffset);
    // Serialize message field [obj_y]
    bufferOffset = _serializer.float64(obj.obj_y, buffer, bufferOffset);
    // Serialize message field [obj_z]
    bufferOffset = _serializer.float64(obj.obj_z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type moveRobotRequest
    let len;
    let data = new moveRobotRequest(null);
    // Deserialize message field [obj_x]
    data.obj_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [obj_y]
    data.obj_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [obj_z]
    data.obj_z = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'AW_hand_service/moveRobotRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0ee63385c214e38ca46f0e8b25b9b4dc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 obj_x
    float64 obj_y
    float64 obj_z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new moveRobotRequest(null);
    if (msg.obj_x !== undefined) {
      resolved.obj_x = msg.obj_x;
    }
    else {
      resolved.obj_x = 0.0
    }

    if (msg.obj_y !== undefined) {
      resolved.obj_y = msg.obj_y;
    }
    else {
      resolved.obj_y = 0.0
    }

    if (msg.obj_z !== undefined) {
      resolved.obj_z = msg.obj_z;
    }
    else {
      resolved.obj_z = 0.0
    }

    return resolved;
    }
};

class moveRobotResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.plan_executed = null;
      this.RobotJoints = null;
    }
    else {
      if (initObj.hasOwnProperty('plan_executed')) {
        this.plan_executed = initObj.plan_executed
      }
      else {
        this.plan_executed = false;
      }
      if (initObj.hasOwnProperty('RobotJoints')) {
        this.RobotJoints = initObj.RobotJoints
      }
      else {
        this.RobotJoints = new sensor_msgs.msg.JointState();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type moveRobotResponse
    // Serialize message field [plan_executed]
    bufferOffset = _serializer.bool(obj.plan_executed, buffer, bufferOffset);
    // Serialize message field [RobotJoints]
    bufferOffset = sensor_msgs.msg.JointState.serialize(obj.RobotJoints, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type moveRobotResponse
    let len;
    let data = new moveRobotResponse(null);
    // Deserialize message field [plan_executed]
    data.plan_executed = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [RobotJoints]
    data.RobotJoints = sensor_msgs.msg.JointState.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += sensor_msgs.msg.JointState.getMessageSize(object.RobotJoints);
    return length + 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'AW_hand_service/moveRobotResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ef054588ce2c2347bd55042c03a54d2f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool plan_executed
    sensor_msgs/JointState RobotJoints
    
    
    
    ================================================================================
    MSG: sensor_msgs/JointState
    # This is a message that holds data to describe the state of a set of torque controlled joints. 
    #
    # The state of each joint (revolute or prismatic) is defined by:
    #  * the position of the joint (rad or m),
    #  * the velocity of the joint (rad/s or m/s) and 
    #  * the effort that is applied in the joint (Nm or N).
    #
    # Each joint is uniquely identified by its name
    # The header specifies the time at which the joint states were recorded. All the joint states
    # in one message have to be recorded at the same time.
    #
    # This message consists of a multiple arrays, one for each part of the joint state. 
    # The goal is to make each of the fields optional. When e.g. your joints have no
    # effort associated with them, you can leave the effort array empty. 
    #
    # All arrays in this message should have the same size, or be empty.
    # This is the only way to uniquely associate the joint name with the correct
    # states.
    
    
    Header header
    
    string[] name
    float64[] position
    float64[] velocity
    float64[] effort
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    # 0: no frame
    # 1: global frame
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new moveRobotResponse(null);
    if (msg.plan_executed !== undefined) {
      resolved.plan_executed = msg.plan_executed;
    }
    else {
      resolved.plan_executed = false
    }

    if (msg.RobotJoints !== undefined) {
      resolved.RobotJoints = sensor_msgs.msg.JointState.Resolve(msg.RobotJoints)
    }
    else {
      resolved.RobotJoints = new sensor_msgs.msg.JointState()
    }

    return resolved;
    }
};

module.exports = {
  Request: moveRobotRequest,
  Response: moveRobotResponse,
  md5sum() { return 'a379339920dab0da344b2dbd1b8b7fc8'; },
  datatype() { return 'AW_hand_service/moveRobot'; }
};
