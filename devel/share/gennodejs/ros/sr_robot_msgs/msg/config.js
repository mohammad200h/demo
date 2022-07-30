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

class config {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.node_name = null;
      this.list_of_parameters = null;
      this.length_of_list = null;
    }
    else {
      if (initObj.hasOwnProperty('node_name')) {
        this.node_name = initObj.node_name
      }
      else {
        this.node_name = '';
      }
      if (initObj.hasOwnProperty('list_of_parameters')) {
        this.list_of_parameters = initObj.list_of_parameters
      }
      else {
        this.list_of_parameters = [];
      }
      if (initObj.hasOwnProperty('length_of_list')) {
        this.length_of_list = initObj.length_of_list
      }
      else {
        this.length_of_list = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type config
    // Serialize message field [node_name]
    bufferOffset = _serializer.string(obj.node_name, buffer, bufferOffset);
    // Serialize message field [list_of_parameters]
    bufferOffset = _arraySerializer.string(obj.list_of_parameters, buffer, bufferOffset, null);
    // Serialize message field [length_of_list]
    bufferOffset = _serializer.uint8(obj.length_of_list, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type config
    let len;
    let data = new config(null);
    // Deserialize message field [node_name]
    data.node_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [list_of_parameters]
    data.list_of_parameters = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [length_of_list]
    data.length_of_list = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.node_name.length;
    object.list_of_parameters.forEach((val) => {
      length += 4 + val.length;
    });
    return length + 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/config';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'aad3efafb735fbac1153457b0e7c6e24';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # modify the config of a node
    # e.g. change the transmission rate
    string   node_name
    string[] list_of_parameters
    uint8    length_of_list
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new config(null);
    if (msg.node_name !== undefined) {
      resolved.node_name = msg.node_name;
    }
    else {
      resolved.node_name = ''
    }

    if (msg.list_of_parameters !== undefined) {
      resolved.list_of_parameters = msg.list_of_parameters;
    }
    else {
      resolved.list_of_parameters = []
    }

    if (msg.length_of_list !== undefined) {
      resolved.length_of_list = msg.length_of_list;
    }
    else {
      resolved.length_of_list = 0
    }

    return resolved;
    }
};

module.exports = config;
