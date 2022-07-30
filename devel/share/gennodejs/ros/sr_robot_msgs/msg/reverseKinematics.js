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

class reverseKinematics {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.finger_name = null;
    }
    else {
      if (initObj.hasOwnProperty('finger_name')) {
        this.finger_name = initObj.finger_name
      }
      else {
        this.finger_name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type reverseKinematics
    // Serialize message field [finger_name]
    bufferOffset = _serializer.string(obj.finger_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type reverseKinematics
    let len;
    let data = new reverseKinematics(null);
    // Deserialize message field [finger_name]
    data.finger_name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.finger_name.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/reverseKinematics';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'db455ae8ce3e770363971b1e8e35fac4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string  finger_name
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new reverseKinematics(null);
    if (msg.finger_name !== undefined) {
      resolved.finger_name = msg.finger_name;
    }
    else {
      resolved.finger_name = ''
    }

    return resolved;
    }
};

module.exports = reverseKinematics;
