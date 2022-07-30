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

class Biotac {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pac0 = null;
      this.pac1 = null;
      this.pdc = null;
      this.tac = null;
      this.tdc = null;
      this.electrodes = null;
    }
    else {
      if (initObj.hasOwnProperty('pac0')) {
        this.pac0 = initObj.pac0
      }
      else {
        this.pac0 = 0;
      }
      if (initObj.hasOwnProperty('pac1')) {
        this.pac1 = initObj.pac1
      }
      else {
        this.pac1 = 0;
      }
      if (initObj.hasOwnProperty('pdc')) {
        this.pdc = initObj.pdc
      }
      else {
        this.pdc = 0;
      }
      if (initObj.hasOwnProperty('tac')) {
        this.tac = initObj.tac
      }
      else {
        this.tac = 0;
      }
      if (initObj.hasOwnProperty('tdc')) {
        this.tdc = initObj.tdc
      }
      else {
        this.tdc = 0;
      }
      if (initObj.hasOwnProperty('electrodes')) {
        this.electrodes = initObj.electrodes
      }
      else {
        this.electrodes = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Biotac
    // Serialize message field [pac0]
    bufferOffset = _serializer.int16(obj.pac0, buffer, bufferOffset);
    // Serialize message field [pac1]
    bufferOffset = _serializer.int16(obj.pac1, buffer, bufferOffset);
    // Serialize message field [pdc]
    bufferOffset = _serializer.int16(obj.pdc, buffer, bufferOffset);
    // Serialize message field [tac]
    bufferOffset = _serializer.int16(obj.tac, buffer, bufferOffset);
    // Serialize message field [tdc]
    bufferOffset = _serializer.int16(obj.tdc, buffer, bufferOffset);
    // Serialize message field [electrodes]
    bufferOffset = _arraySerializer.int16(obj.electrodes, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Biotac
    let len;
    let data = new Biotac(null);
    // Deserialize message field [pac0]
    data.pac0 = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [pac1]
    data.pac1 = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [pdc]
    data.pdc = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [tac]
    data.tac = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [tdc]
    data.tdc = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [electrodes]
    data.electrodes = _arrayDeserializer.int16(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 2 * object.electrodes.length;
    return length + 14;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/Biotac';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8b5e6266fcf2902d0393e32e002093df';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 pac0
    int16 pac1
    int16 pdc
    
    int16 tac
    int16 tdc
    
    int16[] electrodes
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Biotac(null);
    if (msg.pac0 !== undefined) {
      resolved.pac0 = msg.pac0;
    }
    else {
      resolved.pac0 = 0
    }

    if (msg.pac1 !== undefined) {
      resolved.pac1 = msg.pac1;
    }
    else {
      resolved.pac1 = 0
    }

    if (msg.pdc !== undefined) {
      resolved.pdc = msg.pdc;
    }
    else {
      resolved.pdc = 0
    }

    if (msg.tac !== undefined) {
      resolved.tac = msg.tac;
    }
    else {
      resolved.tac = 0
    }

    if (msg.tdc !== undefined) {
      resolved.tdc = msg.tdc;
    }
    else {
      resolved.tdc = 0
    }

    if (msg.electrodes !== undefined) {
      resolved.electrodes = msg.electrodes;
    }
    else {
      resolved.electrodes = []
    }

    return resolved;
    }
};

module.exports = Biotac;
