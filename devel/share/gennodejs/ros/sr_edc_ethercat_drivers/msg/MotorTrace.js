// Auto-generated. Do not edit!

// (in-package sr_edc_ethercat_drivers.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ActuatorInfo = require('./ActuatorInfo.js');
let MotorTraceSample = require('./MotorTraceSample.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class MotorTrace {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.reason = null;
      this.actuator_info = null;
      this.samples = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('reason')) {
        this.reason = initObj.reason
      }
      else {
        this.reason = '';
      }
      if (initObj.hasOwnProperty('actuator_info')) {
        this.actuator_info = initObj.actuator_info
      }
      else {
        this.actuator_info = new ActuatorInfo();
      }
      if (initObj.hasOwnProperty('samples')) {
        this.samples = initObj.samples
      }
      else {
        this.samples = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MotorTrace
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [reason]
    bufferOffset = _serializer.string(obj.reason, buffer, bufferOffset);
    // Serialize message field [actuator_info]
    bufferOffset = ActuatorInfo.serialize(obj.actuator_info, buffer, bufferOffset);
    // Serialize message field [samples]
    // Serialize the length for message field [samples]
    bufferOffset = _serializer.uint32(obj.samples.length, buffer, bufferOffset);
    obj.samples.forEach((val) => {
      bufferOffset = MotorTraceSample.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MotorTrace
    let len;
    let data = new MotorTrace(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [reason]
    data.reason = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [actuator_info]
    data.actuator_info = ActuatorInfo.deserialize(buffer, bufferOffset);
    // Deserialize message field [samples]
    // Deserialize array length for message field [samples]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.samples = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.samples[i] = MotorTraceSample.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.reason.length;
    length += ActuatorInfo.getMessageSize(object.actuator_info);
    length += 104 * object.samples.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_edc_ethercat_drivers/MotorTrace';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd06300e55fe6989d2795bc4072205fe1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    string reason
    sr_edc_ethercat_drivers/ActuatorInfo actuator_info
    sr_edc_ethercat_drivers/MotorTraceSample[] samples
    
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
    MSG: sr_edc_ethercat_drivers/ActuatorInfo
    string name
    float64 slow_motor_current_limit
    float64 quick_motor_current_limit
    float64 duty_limit
    float64 max_duty
    ================================================================================
    MSG: sr_edc_ethercat_drivers/MotorTraceSample
    float64 commanded_effort
    float64 slow_effort_limit
    float64 quick_effort_limit
    float64 motor_current
    float64 motor_supply_voltage
    float64 hbridge_duty
    float64 temperature
    float64 force_sensor_1
    float64 force_sensor_2
    float64 force_sensor_3
    float64 motor_velocity
    float64 velocity
    float64 position
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MotorTrace(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.reason !== undefined) {
      resolved.reason = msg.reason;
    }
    else {
      resolved.reason = ''
    }

    if (msg.actuator_info !== undefined) {
      resolved.actuator_info = ActuatorInfo.Resolve(msg.actuator_info)
    }
    else {
      resolved.actuator_info = new ActuatorInfo()
    }

    if (msg.samples !== undefined) {
      resolved.samples = new Array(msg.samples.length);
      for (let i = 0; i < resolved.samples.length; ++i) {
        resolved.samples[i] = MotorTraceSample.Resolve(msg.samples[i]);
      }
    }
    else {
      resolved.samples = []
    }

    return resolved;
    }
};

module.exports = MotorTrace;
