// Auto-generated. Do not edit!

// (in-package sr_robot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let MidProxData = require('./MidProxData.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class MidProxDataAll {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.sensors = null;
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
        this.sensors = new Array(5).fill(new MidProxData());
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MidProxDataAll
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Check that the constant length array field [sensors] has the right length
    if (obj.sensors.length !== 5) {
      throw new Error('Unable to serialize array field sensors - length must be 5')
    }
    // Serialize message field [sensors]
    obj.sensors.forEach((val) => {
      bufferOffset = MidProxData.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MidProxDataAll
    let len;
    let data = new MidProxDataAll(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [sensors]
    len = 5;
    data.sensors = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.sensors[i] = MidProxData.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 80;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/MidProxDataAll';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1e9012ec0a19b9d9e5a6680de1b6d873';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    MidProxData[5] sensors
    
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
    MSG: sr_robot_msgs/MidProxData
    uint16[4] middle
    uint16[4] proximal
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MidProxDataAll(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.sensors !== undefined) {
      resolved.sensors = new Array(5)
      for (let i = 0; i < resolved.sensors.length; ++i) {
        if (msg.sensors.length > i) {
          resolved.sensors[i] = MidProxData.Resolve(msg.sensors[i]);
        }
        else {
          resolved.sensors[i] = new MidProxData();
        }
      }
    }
    else {
      resolved.sensors = new Array(5).fill(new MidProxData())
    }

    return resolved;
    }
};

module.exports = MidProxDataAll;
