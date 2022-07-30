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

class JointMusclePositionControllerState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.set_point = null;
      this.process_value = null;
      this.process_value_dot = null;
      this.error = null;
      this.time_step = null;
      this.pseudo_command = null;
      this.valve_muscle_0 = null;
      this.valve_muscle_1 = null;
      this.packed_valve = null;
      this.muscle_pressure_0 = null;
      this.muscle_pressure_1 = null;
      this.p = null;
      this.i = null;
      this.d = null;
      this.i_clamp = null;
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
      if (initObj.hasOwnProperty('pseudo_command')) {
        this.pseudo_command = initObj.pseudo_command
      }
      else {
        this.pseudo_command = 0.0;
      }
      if (initObj.hasOwnProperty('valve_muscle_0')) {
        this.valve_muscle_0 = initObj.valve_muscle_0
      }
      else {
        this.valve_muscle_0 = 0;
      }
      if (initObj.hasOwnProperty('valve_muscle_1')) {
        this.valve_muscle_1 = initObj.valve_muscle_1
      }
      else {
        this.valve_muscle_1 = 0;
      }
      if (initObj.hasOwnProperty('packed_valve')) {
        this.packed_valve = initObj.packed_valve
      }
      else {
        this.packed_valve = 0.0;
      }
      if (initObj.hasOwnProperty('muscle_pressure_0')) {
        this.muscle_pressure_0 = initObj.muscle_pressure_0
      }
      else {
        this.muscle_pressure_0 = 0;
      }
      if (initObj.hasOwnProperty('muscle_pressure_1')) {
        this.muscle_pressure_1 = initObj.muscle_pressure_1
      }
      else {
        this.muscle_pressure_1 = 0;
      }
      if (initObj.hasOwnProperty('p')) {
        this.p = initObj.p
      }
      else {
        this.p = 0.0;
      }
      if (initObj.hasOwnProperty('i')) {
        this.i = initObj.i
      }
      else {
        this.i = 0.0;
      }
      if (initObj.hasOwnProperty('d')) {
        this.d = initObj.d
      }
      else {
        this.d = 0.0;
      }
      if (initObj.hasOwnProperty('i_clamp')) {
        this.i_clamp = initObj.i_clamp
      }
      else {
        this.i_clamp = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JointMusclePositionControllerState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [set_point]
    bufferOffset = _serializer.float64(obj.set_point, buffer, bufferOffset);
    // Serialize message field [process_value]
    bufferOffset = _serializer.float64(obj.process_value, buffer, bufferOffset);
    // Serialize message field [process_value_dot]
    bufferOffset = _serializer.float64(obj.process_value_dot, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _serializer.float64(obj.error, buffer, bufferOffset);
    // Serialize message field [time_step]
    bufferOffset = _serializer.float64(obj.time_step, buffer, bufferOffset);
    // Serialize message field [pseudo_command]
    bufferOffset = _serializer.float64(obj.pseudo_command, buffer, bufferOffset);
    // Serialize message field [valve_muscle_0]
    bufferOffset = _serializer.int8(obj.valve_muscle_0, buffer, bufferOffset);
    // Serialize message field [valve_muscle_1]
    bufferOffset = _serializer.int8(obj.valve_muscle_1, buffer, bufferOffset);
    // Serialize message field [packed_valve]
    bufferOffset = _serializer.float64(obj.packed_valve, buffer, bufferOffset);
    // Serialize message field [muscle_pressure_0]
    bufferOffset = _serializer.uint16(obj.muscle_pressure_0, buffer, bufferOffset);
    // Serialize message field [muscle_pressure_1]
    bufferOffset = _serializer.uint16(obj.muscle_pressure_1, buffer, bufferOffset);
    // Serialize message field [p]
    bufferOffset = _serializer.float64(obj.p, buffer, bufferOffset);
    // Serialize message field [i]
    bufferOffset = _serializer.float64(obj.i, buffer, bufferOffset);
    // Serialize message field [d]
    bufferOffset = _serializer.float64(obj.d, buffer, bufferOffset);
    // Serialize message field [i_clamp]
    bufferOffset = _serializer.float64(obj.i_clamp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JointMusclePositionControllerState
    let len;
    let data = new JointMusclePositionControllerState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [set_point]
    data.set_point = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [process_value]
    data.process_value = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [process_value_dot]
    data.process_value_dot = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [error]
    data.error = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [time_step]
    data.time_step = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pseudo_command]
    data.pseudo_command = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [valve_muscle_0]
    data.valve_muscle_0 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [valve_muscle_1]
    data.valve_muscle_1 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [packed_valve]
    data.packed_valve = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [muscle_pressure_0]
    data.muscle_pressure_0 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [muscle_pressure_1]
    data.muscle_pressure_1 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [p]
    data.p = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [i]
    data.i = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [d]
    data.d = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [i_clamp]
    data.i_clamp = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 94;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/JointMusclePositionControllerState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5a9f3e4da940842d5d2d35e00e1cd647';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float64 set_point
    float64 process_value
    float64 process_value_dot
    float64 error
    float64 time_step
    float64 pseudo_command
    int8 valve_muscle_0
    int8 valve_muscle_1
    float64 packed_valve
    uint16 muscle_pressure_0
    uint16 muscle_pressure_1
    float64 p
    float64 i
    float64 d
    float64 i_clamp
    
    
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
    const resolved = new JointMusclePositionControllerState(null);
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

    if (msg.pseudo_command !== undefined) {
      resolved.pseudo_command = msg.pseudo_command;
    }
    else {
      resolved.pseudo_command = 0.0
    }

    if (msg.valve_muscle_0 !== undefined) {
      resolved.valve_muscle_0 = msg.valve_muscle_0;
    }
    else {
      resolved.valve_muscle_0 = 0
    }

    if (msg.valve_muscle_1 !== undefined) {
      resolved.valve_muscle_1 = msg.valve_muscle_1;
    }
    else {
      resolved.valve_muscle_1 = 0
    }

    if (msg.packed_valve !== undefined) {
      resolved.packed_valve = msg.packed_valve;
    }
    else {
      resolved.packed_valve = 0.0
    }

    if (msg.muscle_pressure_0 !== undefined) {
      resolved.muscle_pressure_0 = msg.muscle_pressure_0;
    }
    else {
      resolved.muscle_pressure_0 = 0
    }

    if (msg.muscle_pressure_1 !== undefined) {
      resolved.muscle_pressure_1 = msg.muscle_pressure_1;
    }
    else {
      resolved.muscle_pressure_1 = 0
    }

    if (msg.p !== undefined) {
      resolved.p = msg.p;
    }
    else {
      resolved.p = 0.0
    }

    if (msg.i !== undefined) {
      resolved.i = msg.i;
    }
    else {
      resolved.i = 0.0
    }

    if (msg.d !== undefined) {
      resolved.d = msg.d;
    }
    else {
      resolved.d = 0.0
    }

    if (msg.i_clamp !== undefined) {
      resolved.i_clamp = msg.i_clamp;
    }
    else {
      resolved.i_clamp = 0.0
    }

    return resolved;
    }
};

module.exports = JointMusclePositionControllerState;
