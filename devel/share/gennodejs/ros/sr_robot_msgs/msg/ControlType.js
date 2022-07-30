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

class ControlType {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.control_type = null;
    }
    else {
      if (initObj.hasOwnProperty('control_type')) {
        this.control_type = initObj.control_type
      }
      else {
        this.control_type = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ControlType
    // Serialize message field [control_type]
    bufferOffset = _serializer.int16(obj.control_type, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ControlType
    let len;
    let data = new ControlType(null);
    // Deserialize message field [control_type]
    data.control_type = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/ControlType';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b998c8b3b8aa0f2f53f0eaa45ee462bd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 control_type
    
    int16 PWM=0
    int16 FORCE=1
    
    #used to query which control type we're using. won't change the control type
    int16 QUERY=-1
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ControlType(null);
    if (msg.control_type !== undefined) {
      resolved.control_type = msg.control_type;
    }
    else {
      resolved.control_type = 0
    }

    return resolved;
    }
};

// Constants for message
ControlType.Constants = {
  PWM: 0,
  FORCE: 1,
  QUERY: -1,
}

module.exports = ControlType;
