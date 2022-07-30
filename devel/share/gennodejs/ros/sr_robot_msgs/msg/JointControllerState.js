// Auto-generated. Do not edit!

// (in-package sr_robot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class JointControllerState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.set_point = null;
      this.process_value = null;
      this.process_value_dot = null;
      this.commanded_velocity = null;
      this.error = null;
      this.time_step = null;
      this.command = null;
      this.measured_effort = null;
      this.friction_compensation = null;
      this.position_p = null;
      this.position_i = null;
      this.position_d = null;
      this.position_i_clamp = null;
      this.velocity_p = null;
      this.velocity_i = null;
      this.velocity_d = null;
      this.velocity_i_clamp = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('set_point')) {
        this.set_point = initObj.set_point
      }
      else {
        this.set_point = 0.0;
      }
      if (initObj.hasOwnProperty('process_value')) {
        this.process_value = initObj.process_value
      }
      else {
        this.process_value = 0.0;
      }
      if (initObj.hasOwnProperty('process_value_dot')) {
        this.process_value_dot = initObj.process_value_dot
      }
      else {
        this.process_value_dot = 0.0;
      }
      if (initObj.hasOwnProperty('commanded_velocity')) {
        this.commanded_velocity = initObj.commanded_velocity
      }
      else {
        this.commanded_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('error')) {
        this.error = initObj.error
      }
      else {
        this.error = 0.0;
      }
      if (initObj.hasOwnProperty('time_step')) {
        this.time_step = initObj.time_step
      }
      else {
        this.time_step = 0.0;
      }
      if (initObj.hasOwnProperty('command')) {
        this.command = initObj.command
      }
      else {
        this.command = 0.0;
      }
      if (initObj.hasOwnProperty('measured_effort')) {
        this.measured_effort = initObj.measured_effort
      }
      else {
        this.measured_effort = 0.0;
      }
      if (initObj.hasOwnProperty('friction_compensation')) {
        this.friction_compensation = initObj.friction_compensation
      }
      else {
        this.friction_compensation = 0.0;
      }
      if (initObj.hasOwnProperty('position_p')) {
        this.position_p = initObj.position_p
      }
      else {
        this.position_p = 0.0;
      }
      if (initObj.hasOwnProperty('position_i')) {
        this.position_i = initObj.position_i
      }
      else {
        this.position_i = 0.0;
      }
      if (initObj.hasOwnProperty('position_d')) {
        this.position_d = initObj.position_d
      }
      else {
        this.position_d = 0.0;
      }
      if (initObj.hasOwnProperty('position_i_clamp')) {
        this.position_i_clamp = initObj.position_i_clamp
      }
      else {
        this.position_i_clamp = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_p')) {
        this.velocity_p = initObj.velocity_p
      }
      else {
        this.velocity_p = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_i')) {
        this.velocity_i = initObj.velocity_i
      }
      else {
        this.velocity_i = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_d')) {
        this.velocity_d = initObj.velocity_d
      }
      else {
        this.velocity_d = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_i_clamp')) {
        this.velocity_i_clamp = initObj.velocity_i_clamp
      }
      else {
        this.velocity_i_clamp = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JointControllerState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [set_point]
    bufferOffset = _serializer.float64(obj.set_point, buffer, bufferOffset);
    // Serialize message field [process_value]
    bufferOffset = _serializer.float64(obj.process_value, buffer, bufferOffset);
    // Serialize message field [process_value_dot]
    bufferOffset = _serializer.float64(obj.process_value_dot, buffer, bufferOffset);
    // Serialize message field [commanded_velocity]
    bufferOffset = _serializer.float64(obj.commanded_velocity, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _serializer.float64(obj.error, buffer, bufferOffset);
    // Serialize message field [time_step]
    bufferOffset = _serializer.float64(obj.time_step, buffer, bufferOffset);
    // Serialize message field [command]
    bufferOffset = _serializer.float64(obj.command, buffer, bufferOffset);
    // Serialize message field [measured_effort]
    bufferOffset = _serializer.float64(obj.measured_effort, buffer, bufferOffset);
    // Serialize message field [friction_compensation]
    bufferOffset = _serializer.float64(obj.friction_compensation, buffer, bufferOffset);
    // Serialize message field [position_p]
    bufferOffset = _serializer.float64(obj.position_p, buffer, bufferOffset);
    // Serialize message field [position_i]
    bufferOffset = _serializer.float64(obj.position_i, buffer, bufferOffset);
    // Serialize message field [position_d]
    bufferOffset = _serializer.float64(obj.position_d, buffer, bufferOffset);
    // Serialize message field [position_i_clamp]
    bufferOffset = _serializer.float64(obj.position_i_clamp, buffer, bufferOffset);
    // Serialize message field [velocity_p]
    bufferOffset = _serializer.float64(obj.velocity_p, buffer, bufferOffset);
    // Serialize message field [velocity_i]
    bufferOffset = _serializer.float64(obj.velocity_i, buffer, bufferOffset);
    // Serialize message field [velocity_d]
    bufferOffset = _serializer.float64(obj.velocity_d, buffer, bufferOffset);
    // Serialize message field [velocity_i_clamp]
    bufferOffset = _serializer.float64(obj.velocity_i_clamp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JointControllerState
    let len;
    let data = new JointControllerState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [set_point]
    data.set_point = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [process_value]
    data.process_value = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [process_value_dot]
    data.process_value_dot = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [commanded_velocity]
    data.commanded_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [error]
    data.error = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [time_step]
    data.time_step = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [command]
    data.command = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [measured_effort]
    data.measured_effort = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [friction_compensation]
    data.friction_compensation = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [position_p]
    data.position_p = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [position_i]
    data.position_i = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [position_d]
    data.position_d = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [position_i_clamp]
    data.position_i_clamp = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity_p]
    data.velocity_p = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity_i]
    data.velocity_i = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity_d]
    data.velocity_d = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity_i_clamp]
    data.velocity_i_clamp = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 136;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/JointControllerState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6d5ccb5452fd11516b5e350fcf60090e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float64 set_point
    float64 process_value
    float64 process_value_dot
    float64 commanded_velocity
    float64 error
    float64 time_step
    float64 command
    float64 measured_effort
    float64 friction_compensation
    float64 position_p
    float64 position_i
    float64 position_d
    float64 position_i_clamp
    float64 velocity_p
    float64 velocity_i
    float64 velocity_d
    float64 velocity_i_clamp
    
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
    const resolved = new JointControllerState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.set_point !== undefined) {
      resolved.set_point = msg.set_point;
    }
    else {
      resolved.set_point = 0.0
    }

    if (msg.process_value !== undefined) {
      resolved.process_value = msg.process_value;
    }
    else {
      resolved.process_value = 0.0
    }

    if (msg.process_value_dot !== undefined) {
      resolved.process_value_dot = msg.process_value_dot;
    }
    else {
      resolved.process_value_dot = 0.0
    }

    if (msg.commanded_velocity !== undefined) {
      resolved.commanded_velocity = msg.commanded_velocity;
    }
    else {
      resolved.commanded_velocity = 0.0
    }

    if (msg.error !== undefined) {
      resolved.error = msg.error;
    }
    else {
      resolved.error = 0.0
    }

    if (msg.time_step !== undefined) {
      resolved.time_step = msg.time_step;
    }
    else {
      resolved.time_step = 0.0
    }

    if (msg.command !== undefined) {
      resolved.command = msg.command;
    }
    else {
      resolved.command = 0.0
    }

    if (msg.measured_effort !== undefined) {
      resolved.measured_effort = msg.measured_effort;
    }
    else {
      resolved.measured_effort = 0.0
    }

    if (msg.friction_compensation !== undefined) {
      resolved.friction_compensation = msg.friction_compensation;
    }
    else {
      resolved.friction_compensation = 0.0
    }

    if (msg.position_p !== undefined) {
      resolved.position_p = msg.position_p;
    }
    else {
      resolved.position_p = 0.0
    }

    if (msg.position_i !== undefined) {
      resolved.position_i = msg.position_i;
    }
    else {
      resolved.position_i = 0.0
    }

    if (msg.position_d !== undefined) {
      resolved.position_d = msg.position_d;
    }
    else {
      resolved.position_d = 0.0
    }

    if (msg.position_i_clamp !== undefined) {
      resolved.position_i_clamp = msg.position_i_clamp;
    }
    else {
      resolved.position_i_clamp = 0.0
    }

    if (msg.velocity_p !== undefined) {
      resolved.velocity_p = msg.velocity_p;
    }
    else {
      resolved.velocity_p = 0.0
    }

    if (msg.velocity_i !== undefined) {
      resolved.velocity_i = msg.velocity_i;
    }
    else {
      resolved.velocity_i = 0.0
    }

    if (msg.velocity_d !== undefined) {
      resolved.velocity_d = msg.velocity_d;
    }
    else {
      resolved.velocity_d = 0.0
    }

    if (msg.velocity_i_clamp !== undefined) {
      resolved.velocity_i_clamp = msg.velocity_i_clamp;
    }
    else {
      resolved.velocity_i_clamp = 0.0
    }

    return resolved;
    }
};

module.exports = JointControllerState;
