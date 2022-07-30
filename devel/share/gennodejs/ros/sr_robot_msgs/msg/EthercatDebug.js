// Auto-generated. Do not edit!

// (in-package sr_robot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let FromMotorDataType = require('./FromMotorDataType.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class EthercatDebug {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.sensors = null;
      this.motor_data_type = null;
      this.which_motors = null;
      this.which_motor_data_arrived = null;
      this.which_motor_data_had_errors = null;
      this.motor_data_packet_torque = null;
      this.motor_data_packet_misc = null;
      this.tactile_data_type = null;
      this.tactile_data_valid = null;
      this.tactile = null;
      this.idle_time_us = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('sensors')) {
        this.sensors = initObj.sensors
      }
      else {
        this.sensors = [];
      }
      if (initObj.hasOwnProperty('motor_data_type')) {
        this.motor_data_type = initObj.motor_data_type
      }
      else {
        this.motor_data_type = new FromMotorDataType();
      }
      if (initObj.hasOwnProperty('which_motors')) {
        this.which_motors = initObj.which_motors
      }
      else {
        this.which_motors = 0;
      }
      if (initObj.hasOwnProperty('which_motor_data_arrived')) {
        this.which_motor_data_arrived = initObj.which_motor_data_arrived
      }
      else {
        this.which_motor_data_arrived = 0;
      }
      if (initObj.hasOwnProperty('which_motor_data_had_errors')) {
        this.which_motor_data_had_errors = initObj.which_motor_data_had_errors
      }
      else {
        this.which_motor_data_had_errors = 0;
      }
      if (initObj.hasOwnProperty('motor_data_packet_torque')) {
        this.motor_data_packet_torque = initObj.motor_data_packet_torque
      }
      else {
        this.motor_data_packet_torque = [];
      }
      if (initObj.hasOwnProperty('motor_data_packet_misc')) {
        this.motor_data_packet_misc = initObj.motor_data_packet_misc
      }
      else {
        this.motor_data_packet_misc = [];
      }
      if (initObj.hasOwnProperty('tactile_data_type')) {
        this.tactile_data_type = initObj.tactile_data_type
      }
      else {
        this.tactile_data_type = 0;
      }
      if (initObj.hasOwnProperty('tactile_data_valid')) {
        this.tactile_data_valid = initObj.tactile_data_valid
      }
      else {
        this.tactile_data_valid = 0;
      }
      if (initObj.hasOwnProperty('tactile')) {
        this.tactile = initObj.tactile
      }
      else {
        this.tactile = [];
      }
      if (initObj.hasOwnProperty('idle_time_us')) {
        this.idle_time_us = initObj.idle_time_us
      }
      else {
        this.idle_time_us = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EthercatDebug
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [sensors]
    bufferOffset = _arraySerializer.int16(obj.sensors, buffer, bufferOffset, null);
    // Serialize message field [motor_data_type]
    bufferOffset = FromMotorDataType.serialize(obj.motor_data_type, buffer, bufferOffset);
    // Serialize message field [which_motors]
    bufferOffset = _serializer.int16(obj.which_motors, buffer, bufferOffset);
    // Serialize message field [which_motor_data_arrived]
    bufferOffset = _serializer.int32(obj.which_motor_data_arrived, buffer, bufferOffset);
    // Serialize message field [which_motor_data_had_errors]
    bufferOffset = _serializer.int32(obj.which_motor_data_had_errors, buffer, bufferOffset);
    // Serialize message field [motor_data_packet_torque]
    bufferOffset = _arraySerializer.int16(obj.motor_data_packet_torque, buffer, bufferOffset, null);
    // Serialize message field [motor_data_packet_misc]
    bufferOffset = _arraySerializer.int16(obj.motor_data_packet_misc, buffer, bufferOffset, null);
    // Serialize message field [tactile_data_type]
    bufferOffset = _serializer.int32(obj.tactile_data_type, buffer, bufferOffset);
    // Serialize message field [tactile_data_valid]
    bufferOffset = _serializer.int16(obj.tactile_data_valid, buffer, bufferOffset);
    // Serialize message field [tactile]
    bufferOffset = _arraySerializer.int16(obj.tactile, buffer, bufferOffset, null);
    // Serialize message field [idle_time_us]
    bufferOffset = _serializer.int16(obj.idle_time_us, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EthercatDebug
    let len;
    let data = new EthercatDebug(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [sensors]
    data.sensors = _arrayDeserializer.int16(buffer, bufferOffset, null)
    // Deserialize message field [motor_data_type]
    data.motor_data_type = FromMotorDataType.deserialize(buffer, bufferOffset);
    // Deserialize message field [which_motors]
    data.which_motors = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [which_motor_data_arrived]
    data.which_motor_data_arrived = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [which_motor_data_had_errors]
    data.which_motor_data_had_errors = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [motor_data_packet_torque]
    data.motor_data_packet_torque = _arrayDeserializer.int16(buffer, bufferOffset, null)
    // Deserialize message field [motor_data_packet_misc]
    data.motor_data_packet_misc = _arrayDeserializer.int16(buffer, bufferOffset, null)
    // Deserialize message field [tactile_data_type]
    data.tactile_data_type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [tactile_data_valid]
    data.tactile_data_valid = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [tactile]
    data.tactile = _arrayDeserializer.int16(buffer, bufferOffset, null)
    // Deserialize message field [idle_time_us]
    data.idle_time_us = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 2 * object.sensors.length;
    length += 2 * object.motor_data_packet_torque.length;
    length += 2 * object.motor_data_packet_misc.length;
    length += 2 * object.tactile.length;
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/EthercatDebug';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ed9e30784a7d4571ecf4d526e7ff529f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header               header
    
    int16[]              sensors
    FromMotorDataType    motor_data_type
    int16                which_motors
    int32                which_motor_data_arrived
    int32                which_motor_data_had_errors
    int16[]              motor_data_packet_torque
    int16[]              motor_data_packet_misc
    int32                tactile_data_type
    int16                tactile_data_valid
    int16[]              tactile
    int16                idle_time_us
    
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
    
    ================================================================================
    MSG: sr_robot_msgs/FromMotorDataType
    int16 data
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EthercatDebug(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.sensors !== undefined) {
      resolved.sensors = msg.sensors;
    }
    else {
      resolved.sensors = []
    }

    if (msg.motor_data_type !== undefined) {
      resolved.motor_data_type = FromMotorDataType.Resolve(msg.motor_data_type)
    }
    else {
      resolved.motor_data_type = new FromMotorDataType()
    }

    if (msg.which_motors !== undefined) {
      resolved.which_motors = msg.which_motors;
    }
    else {
      resolved.which_motors = 0
    }

    if (msg.which_motor_data_arrived !== undefined) {
      resolved.which_motor_data_arrived = msg.which_motor_data_arrived;
    }
    else {
      resolved.which_motor_data_arrived = 0
    }

    if (msg.which_motor_data_had_errors !== undefined) {
      resolved.which_motor_data_had_errors = msg.which_motor_data_had_errors;
    }
    else {
      resolved.which_motor_data_had_errors = 0
    }

    if (msg.motor_data_packet_torque !== undefined) {
      resolved.motor_data_packet_torque = msg.motor_data_packet_torque;
    }
    else {
      resolved.motor_data_packet_torque = []
    }

    if (msg.motor_data_packet_misc !== undefined) {
      resolved.motor_data_packet_misc = msg.motor_data_packet_misc;
    }
    else {
      resolved.motor_data_packet_misc = []
    }

    if (msg.tactile_data_type !== undefined) {
      resolved.tactile_data_type = msg.tactile_data_type;
    }
    else {
      resolved.tactile_data_type = 0
    }

    if (msg.tactile_data_valid !== undefined) {
      resolved.tactile_data_valid = msg.tactile_data_valid;
    }
    else {
      resolved.tactile_data_valid = 0
    }

    if (msg.tactile !== undefined) {
      resolved.tactile = msg.tactile;
    }
    else {
      resolved.tactile = []
    }

    if (msg.idle_time_us !== undefined) {
      resolved.idle_time_us = msg.idle_time_us;
    }
    else {
      resolved.idle_time_us = 0
    }

    return resolved;
    }
};

module.exports = EthercatDebug;
