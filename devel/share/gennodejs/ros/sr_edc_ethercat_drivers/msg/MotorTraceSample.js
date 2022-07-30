// Auto-generated. Do not edit!

// (in-package sr_edc_ethercat_drivers.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class MotorTraceSample {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.commanded_effort = null;
      this.slow_effort_limit = null;
      this.quick_effort_limit = null;
      this.motor_current = null;
      this.motor_supply_voltage = null;
      this.hbridge_duty = null;
      this.temperature = null;
      this.force_sensor_1 = null;
      this.force_sensor_2 = null;
      this.force_sensor_3 = null;
      this.motor_velocity = null;
      this.velocity = null;
      this.position = null;
    }
    else {
      if (initObj.hasOwnProperty('commanded_effort')) {
        this.commanded_effort = initObj.commanded_effort
      }
      else {
        this.commanded_effort = 0.0;
      }
      if (initObj.hasOwnProperty('slow_effort_limit')) {
        this.slow_effort_limit = initObj.slow_effort_limit
      }
      else {
        this.slow_effort_limit = 0.0;
      }
      if (initObj.hasOwnProperty('quick_effort_limit')) {
        this.quick_effort_limit = initObj.quick_effort_limit
      }
      else {
        this.quick_effort_limit = 0.0;
      }
      if (initObj.hasOwnProperty('motor_current')) {
        this.motor_current = initObj.motor_current
      }
      else {
        this.motor_current = 0.0;
      }
      if (initObj.hasOwnProperty('motor_supply_voltage')) {
        this.motor_supply_voltage = initObj.motor_supply_voltage
      }
      else {
        this.motor_supply_voltage = 0.0;
      }
      if (initObj.hasOwnProperty('hbridge_duty')) {
        this.hbridge_duty = initObj.hbridge_duty
      }
      else {
        this.hbridge_duty = 0.0;
      }
      if (initObj.hasOwnProperty('temperature')) {
        this.temperature = initObj.temperature
      }
      else {
        this.temperature = 0.0;
      }
      if (initObj.hasOwnProperty('force_sensor_1')) {
        this.force_sensor_1 = initObj.force_sensor_1
      }
      else {
        this.force_sensor_1 = 0.0;
      }
      if (initObj.hasOwnProperty('force_sensor_2')) {
        this.force_sensor_2 = initObj.force_sensor_2
      }
      else {
        this.force_sensor_2 = 0.0;
      }
      if (initObj.hasOwnProperty('force_sensor_3')) {
        this.force_sensor_3 = initObj.force_sensor_3
      }
      else {
        this.force_sensor_3 = 0.0;
      }
      if (initObj.hasOwnProperty('motor_velocity')) {
        this.motor_velocity = initObj.motor_velocity
      }
      else {
        this.motor_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = 0.0;
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MotorTraceSample
    // Serialize message field [commanded_effort]
    bufferOffset = _serializer.float64(obj.commanded_effort, buffer, bufferOffset);
    // Serialize message field [slow_effort_limit]
    bufferOffset = _serializer.float64(obj.slow_effort_limit, buffer, bufferOffset);
    // Serialize message field [quick_effort_limit]
    bufferOffset = _serializer.float64(obj.quick_effort_limit, buffer, bufferOffset);
    // Serialize message field [motor_current]
    bufferOffset = _serializer.float64(obj.motor_current, buffer, bufferOffset);
    // Serialize message field [motor_supply_voltage]
    bufferOffset = _serializer.float64(obj.motor_supply_voltage, buffer, bufferOffset);
    // Serialize message field [hbridge_duty]
    bufferOffset = _serializer.float64(obj.hbridge_duty, buffer, bufferOffset);
    // Serialize message field [temperature]
    bufferOffset = _serializer.float64(obj.temperature, buffer, bufferOffset);
    // Serialize message field [force_sensor_1]
    bufferOffset = _serializer.float64(obj.force_sensor_1, buffer, bufferOffset);
    // Serialize message field [force_sensor_2]
    bufferOffset = _serializer.float64(obj.force_sensor_2, buffer, bufferOffset);
    // Serialize message field [force_sensor_3]
    bufferOffset = _serializer.float64(obj.force_sensor_3, buffer, bufferOffset);
    // Serialize message field [motor_velocity]
    bufferOffset = _serializer.float64(obj.motor_velocity, buffer, bufferOffset);
    // Serialize message field [velocity]
    bufferOffset = _serializer.float64(obj.velocity, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = _serializer.float64(obj.position, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MotorTraceSample
    let len;
    let data = new MotorTraceSample(null);
    // Deserialize message field [commanded_effort]
    data.commanded_effort = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [slow_effort_limit]
    data.slow_effort_limit = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [quick_effort_limit]
    data.quick_effort_limit = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [motor_current]
    data.motor_current = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [motor_supply_voltage]
    data.motor_supply_voltage = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [hbridge_duty]
    data.hbridge_duty = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [temperature]
    data.temperature = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [force_sensor_1]
    data.force_sensor_1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [force_sensor_2]
    data.force_sensor_2 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [force_sensor_3]
    data.force_sensor_3 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [motor_velocity]
    data.motor_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity]
    data.velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 104;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_edc_ethercat_drivers/MotorTraceSample';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f5faf420d7c29e68b1c6bfdff440ffb8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new MotorTraceSample(null);
    if (msg.commanded_effort !== undefined) {
      resolved.commanded_effort = msg.commanded_effort;
    }
    else {
      resolved.commanded_effort = 0.0
    }

    if (msg.slow_effort_limit !== undefined) {
      resolved.slow_effort_limit = msg.slow_effort_limit;
    }
    else {
      resolved.slow_effort_limit = 0.0
    }

    if (msg.quick_effort_limit !== undefined) {
      resolved.quick_effort_limit = msg.quick_effort_limit;
    }
    else {
      resolved.quick_effort_limit = 0.0
    }

    if (msg.motor_current !== undefined) {
      resolved.motor_current = msg.motor_current;
    }
    else {
      resolved.motor_current = 0.0
    }

    if (msg.motor_supply_voltage !== undefined) {
      resolved.motor_supply_voltage = msg.motor_supply_voltage;
    }
    else {
      resolved.motor_supply_voltage = 0.0
    }

    if (msg.hbridge_duty !== undefined) {
      resolved.hbridge_duty = msg.hbridge_duty;
    }
    else {
      resolved.hbridge_duty = 0.0
    }

    if (msg.temperature !== undefined) {
      resolved.temperature = msg.temperature;
    }
    else {
      resolved.temperature = 0.0
    }

    if (msg.force_sensor_1 !== undefined) {
      resolved.force_sensor_1 = msg.force_sensor_1;
    }
    else {
      resolved.force_sensor_1 = 0.0
    }

    if (msg.force_sensor_2 !== undefined) {
      resolved.force_sensor_2 = msg.force_sensor_2;
    }
    else {
      resolved.force_sensor_2 = 0.0
    }

    if (msg.force_sensor_3 !== undefined) {
      resolved.force_sensor_3 = msg.force_sensor_3;
    }
    else {
      resolved.force_sensor_3 = 0.0
    }

    if (msg.motor_velocity !== undefined) {
      resolved.motor_velocity = msg.motor_velocity;
    }
    else {
      resolved.motor_velocity = 0.0
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = msg.velocity;
    }
    else {
      resolved.velocity = 0.0
    }

    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = 0.0
    }

    return resolved;
    }
};

module.exports = MotorTraceSample;
