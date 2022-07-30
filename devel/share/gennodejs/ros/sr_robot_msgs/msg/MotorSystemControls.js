// Auto-generated. Do not edit!

// (in-package sr_robot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class MotorSystemControls {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.motor_id = null;
      this.enable_backlash_compensation = null;
      this.increase_sgl_tracking = null;
      this.decrease_sgl_tracking = null;
      this.increase_sgr_tracking = null;
      this.decrease_sgr_tracking = null;
      this.initiate_jiggling = null;
      this.write_config_to_eeprom = null;
    }
    else {
      if (initObj.hasOwnProperty('motor_id')) {
        this.motor_id = initObj.motor_id
      }
      else {
        this.motor_id = 0;
      }
      if (initObj.hasOwnProperty('enable_backlash_compensation')) {
        this.enable_backlash_compensation = initObj.enable_backlash_compensation
      }
      else {
        this.enable_backlash_compensation = false;
      }
      if (initObj.hasOwnProperty('increase_sgl_tracking')) {
        this.increase_sgl_tracking = initObj.increase_sgl_tracking
      }
      else {
        this.increase_sgl_tracking = false;
      }
      if (initObj.hasOwnProperty('decrease_sgl_tracking')) {
        this.decrease_sgl_tracking = initObj.decrease_sgl_tracking
      }
      else {
        this.decrease_sgl_tracking = false;
      }
      if (initObj.hasOwnProperty('increase_sgr_tracking')) {
        this.increase_sgr_tracking = initObj.increase_sgr_tracking
      }
      else {
        this.increase_sgr_tracking = false;
      }
      if (initObj.hasOwnProperty('decrease_sgr_tracking')) {
        this.decrease_sgr_tracking = initObj.decrease_sgr_tracking
      }
      else {
        this.decrease_sgr_tracking = false;
      }
      if (initObj.hasOwnProperty('initiate_jiggling')) {
        this.initiate_jiggling = initObj.initiate_jiggling
      }
      else {
        this.initiate_jiggling = false;
      }
      if (initObj.hasOwnProperty('write_config_to_eeprom')) {
        this.write_config_to_eeprom = initObj.write_config_to_eeprom
      }
      else {
        this.write_config_to_eeprom = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MotorSystemControls
    // Serialize message field [motor_id]
    bufferOffset = _serializer.int8(obj.motor_id, buffer, bufferOffset);
    // Serialize message field [enable_backlash_compensation]
    bufferOffset = _serializer.bool(obj.enable_backlash_compensation, buffer, bufferOffset);
    // Serialize message field [increase_sgl_tracking]
    bufferOffset = _serializer.bool(obj.increase_sgl_tracking, buffer, bufferOffset);
    // Serialize message field [decrease_sgl_tracking]
    bufferOffset = _serializer.bool(obj.decrease_sgl_tracking, buffer, bufferOffset);
    // Serialize message field [increase_sgr_tracking]
    bufferOffset = _serializer.bool(obj.increase_sgr_tracking, buffer, bufferOffset);
    // Serialize message field [decrease_sgr_tracking]
    bufferOffset = _serializer.bool(obj.decrease_sgr_tracking, buffer, bufferOffset);
    // Serialize message field [initiate_jiggling]
    bufferOffset = _serializer.bool(obj.initiate_jiggling, buffer, bufferOffset);
    // Serialize message field [write_config_to_eeprom]
    bufferOffset = _serializer.bool(obj.write_config_to_eeprom, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MotorSystemControls
    let len;
    let data = new MotorSystemControls(null);
    // Deserialize message field [motor_id]
    data.motor_id = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [enable_backlash_compensation]
    data.enable_backlash_compensation = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [increase_sgl_tracking]
    data.increase_sgl_tracking = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [decrease_sgl_tracking]
    data.decrease_sgl_tracking = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [increase_sgr_tracking]
    data.increase_sgr_tracking = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [decrease_sgr_tracking]
    data.decrease_sgr_tracking = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [initiate_jiggling]
    data.initiate_jiggling = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [write_config_to_eeprom]
    data.write_config_to_eeprom = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/MotorSystemControls';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0686822f46acfde0133711bd613a20f1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 motor_id                     # the id of the motor you want to control
    
    bool enable_backlash_compensation # switch on/off backlash compensation at the motor level
    bool increase_sgl_tracking        # increment the tracking value for the left gauge
    bool decrease_sgl_tracking        # decrement the tracking value for the left gauge
    bool increase_sgr_tracking        # increment the tracking value for the right gauge
    bool decrease_sgr_tracking        # decrement the tracking value for the right gauge
    bool initiate_jiggling            # starts jiggling the given motor
    bool write_config_to_eeprom       # write the current configuration to the eeprom
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MotorSystemControls(null);
    if (msg.motor_id !== undefined) {
      resolved.motor_id = msg.motor_id;
    }
    else {
      resolved.motor_id = 0
    }

    if (msg.enable_backlash_compensation !== undefined) {
      resolved.enable_backlash_compensation = msg.enable_backlash_compensation;
    }
    else {
      resolved.enable_backlash_compensation = false
    }

    if (msg.increase_sgl_tracking !== undefined) {
      resolved.increase_sgl_tracking = msg.increase_sgl_tracking;
    }
    else {
      resolved.increase_sgl_tracking = false
    }

    if (msg.decrease_sgl_tracking !== undefined) {
      resolved.decrease_sgl_tracking = msg.decrease_sgl_tracking;
    }
    else {
      resolved.decrease_sgl_tracking = false
    }

    if (msg.increase_sgr_tracking !== undefined) {
      resolved.increase_sgr_tracking = msg.increase_sgr_tracking;
    }
    else {
      resolved.increase_sgr_tracking = false
    }

    if (msg.decrease_sgr_tracking !== undefined) {
      resolved.decrease_sgr_tracking = msg.decrease_sgr_tracking;
    }
    else {
      resolved.decrease_sgr_tracking = false
    }

    if (msg.initiate_jiggling !== undefined) {
      resolved.initiate_jiggling = msg.initiate_jiggling;
    }
    else {
      resolved.initiate_jiggling = false
    }

    if (msg.write_config_to_eeprom !== undefined) {
      resolved.write_config_to_eeprom = msg.write_config_to_eeprom;
    }
    else {
      resolved.write_config_to_eeprom = false
    }

    return resolved;
    }
};

module.exports = MotorSystemControls;
