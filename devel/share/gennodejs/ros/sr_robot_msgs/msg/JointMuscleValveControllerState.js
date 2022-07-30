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

class JointMuscleValveControllerState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.set_valve_muscle_0 = null;
      this.set_valve_muscle_1 = null;
      this.set_duration_muscle_0 = null;
      this.set_duration_muscle_1 = null;
      this.current_valve_muscle_0 = null;
      this.current_valve_muscle_1 = null;
      this.current_duration_muscle_0 = null;
      this.current_duration_muscle_1 = null;
      this.packed_valve = null;
      this.muscle_pressure_0 = null;
      this.muscle_pressure_1 = null;
      this.time_step = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('set_valve_muscle_0')) {
        this.set_valve_muscle_0 = initObj.set_valve_muscle_0
      }
      else {
        this.set_valve_muscle_0 = 0;
      }
      if (initObj.hasOwnProperty('set_valve_muscle_1')) {
        this.set_valve_muscle_1 = initObj.set_valve_muscle_1
      }
      else {
        this.set_valve_muscle_1 = 0;
      }
      if (initObj.hasOwnProperty('set_duration_muscle_0')) {
        this.set_duration_muscle_0 = initObj.set_duration_muscle_0
      }
      else {
        this.set_duration_muscle_0 = 0;
      }
      if (initObj.hasOwnProperty('set_duration_muscle_1')) {
        this.set_duration_muscle_1 = initObj.set_duration_muscle_1
      }
      else {
        this.set_duration_muscle_1 = 0;
      }
      if (initObj.hasOwnProperty('current_valve_muscle_0')) {
        this.current_valve_muscle_0 = initObj.current_valve_muscle_0
      }
      else {
        this.current_valve_muscle_0 = 0;
      }
      if (initObj.hasOwnProperty('current_valve_muscle_1')) {
        this.current_valve_muscle_1 = initObj.current_valve_muscle_1
      }
      else {
        this.current_valve_muscle_1 = 0;
      }
      if (initObj.hasOwnProperty('current_duration_muscle_0')) {
        this.current_duration_muscle_0 = initObj.current_duration_muscle_0
      }
      else {
        this.current_duration_muscle_0 = 0;
      }
      if (initObj.hasOwnProperty('current_duration_muscle_1')) {
        this.current_duration_muscle_1 = initObj.current_duration_muscle_1
      }
      else {
        this.current_duration_muscle_1 = 0;
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
      if (initObj.hasOwnProperty('time_step')) {
        this.time_step = initObj.time_step
      }
      else {
        this.time_step = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JointMuscleValveControllerState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [set_valve_muscle_0]
    bufferOffset = _serializer.int8(obj.set_valve_muscle_0, buffer, bufferOffset);
    // Serialize message field [set_valve_muscle_1]
    bufferOffset = _serializer.int8(obj.set_valve_muscle_1, buffer, bufferOffset);
    // Serialize message field [set_duration_muscle_0]
    bufferOffset = _serializer.uint64(obj.set_duration_muscle_0, buffer, bufferOffset);
    // Serialize message field [set_duration_muscle_1]
    bufferOffset = _serializer.uint64(obj.set_duration_muscle_1, buffer, bufferOffset);
    // Serialize message field [current_valve_muscle_0]
    bufferOffset = _serializer.int8(obj.current_valve_muscle_0, buffer, bufferOffset);
    // Serialize message field [current_valve_muscle_1]
    bufferOffset = _serializer.int8(obj.current_valve_muscle_1, buffer, bufferOffset);
    // Serialize message field [current_duration_muscle_0]
    bufferOffset = _serializer.uint64(obj.current_duration_muscle_0, buffer, bufferOffset);
    // Serialize message field [current_duration_muscle_1]
    bufferOffset = _serializer.uint64(obj.current_duration_muscle_1, buffer, bufferOffset);
    // Serialize message field [packed_valve]
    bufferOffset = _serializer.float64(obj.packed_valve, buffer, bufferOffset);
    // Serialize message field [muscle_pressure_0]
    bufferOffset = _serializer.uint16(obj.muscle_pressure_0, buffer, bufferOffset);
    // Serialize message field [muscle_pressure_1]
    bufferOffset = _serializer.uint16(obj.muscle_pressure_1, buffer, bufferOffset);
    // Serialize message field [time_step]
    bufferOffset = _serializer.float64(obj.time_step, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JointMuscleValveControllerState
    let len;
    let data = new JointMuscleValveControllerState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [set_valve_muscle_0]
    data.set_valve_muscle_0 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [set_valve_muscle_1]
    data.set_valve_muscle_1 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [set_duration_muscle_0]
    data.set_duration_muscle_0 = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [set_duration_muscle_1]
    data.set_duration_muscle_1 = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [current_valve_muscle_0]
    data.current_valve_muscle_0 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [current_valve_muscle_1]
    data.current_valve_muscle_1 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [current_duration_muscle_0]
    data.current_duration_muscle_0 = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [current_duration_muscle_1]
    data.current_duration_muscle_1 = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [packed_valve]
    data.packed_valve = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [muscle_pressure_0]
    data.muscle_pressure_0 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [muscle_pressure_1]
    data.muscle_pressure_1 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [time_step]
    data.time_step = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/JointMuscleValveControllerState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fc22942516cdb4d514558e60d7263d35';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    int8 set_valve_muscle_0
    int8 set_valve_muscle_1
    uint64 set_duration_muscle_0
    uint64 set_duration_muscle_1
    int8 current_valve_muscle_0
    int8 current_valve_muscle_1
    uint64 current_duration_muscle_0
    uint64 current_duration_muscle_1
    float64 packed_valve
    uint16 muscle_pressure_0
    uint16 muscle_pressure_1
    float64 time_step
    
    
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
    const resolved = new JointMuscleValveControllerState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.set_valve_muscle_0 !== undefined) {
      resolved.set_valve_muscle_0 = msg.set_valve_muscle_0;
    }
    else {
      resolved.set_valve_muscle_0 = 0
    }

    if (msg.set_valve_muscle_1 !== undefined) {
      resolved.set_valve_muscle_1 = msg.set_valve_muscle_1;
    }
    else {
      resolved.set_valve_muscle_1 = 0
    }

    if (msg.set_duration_muscle_0 !== undefined) {
      resolved.set_duration_muscle_0 = msg.set_duration_muscle_0;
    }
    else {
      resolved.set_duration_muscle_0 = 0
    }

    if (msg.set_duration_muscle_1 !== undefined) {
      resolved.set_duration_muscle_1 = msg.set_duration_muscle_1;
    }
    else {
      resolved.set_duration_muscle_1 = 0
    }

    if (msg.current_valve_muscle_0 !== undefined) {
      resolved.current_valve_muscle_0 = msg.current_valve_muscle_0;
    }
    else {
      resolved.current_valve_muscle_0 = 0
    }

    if (msg.current_valve_muscle_1 !== undefined) {
      resolved.current_valve_muscle_1 = msg.current_valve_muscle_1;
    }
    else {
      resolved.current_valve_muscle_1 = 0
    }

    if (msg.current_duration_muscle_0 !== undefined) {
      resolved.current_duration_muscle_0 = msg.current_duration_muscle_0;
    }
    else {
      resolved.current_duration_muscle_0 = 0
    }

    if (msg.current_duration_muscle_1 !== undefined) {
      resolved.current_duration_muscle_1 = msg.current_duration_muscle_1;
    }
    else {
      resolved.current_duration_muscle_1 = 0
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

    if (msg.time_step !== undefined) {
      resolved.time_step = msg.time_step;
    }
    else {
      resolved.time_step = 0.0
    }

    return resolved;
    }
};

module.exports = JointMuscleValveControllerState;
