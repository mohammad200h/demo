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

class contrlr {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.contrlr_name = null;
      this.list_of_parameters = null;
      this.length_of_list = null;
    }
    else {
      if (initObj.hasOwnProperty('contrlr_name')) {
        this.contrlr_name = initObj.contrlr_name
      }
      else {
        this.contrlr_name = '';
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
    // Serializes a message object of type contrlr
    // Serialize message field [contrlr_name]
    bufferOffset = _serializer.string(obj.contrlr_name, buffer, bufferOffset);
    // Serialize message field [list_of_parameters]
    bufferOffset = _arraySerializer.string(obj.list_of_parameters, buffer, bufferOffset, null);
    // Serialize message field [length_of_list]
    bufferOffset = _serializer.uint8(obj.length_of_list, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type contrlr
    let len;
    let data = new contrlr(null);
    // Deserialize message field [contrlr_name]
    data.contrlr_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [list_of_parameters]
    data.list_of_parameters = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [length_of_list]
    data.length_of_list = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.contrlr_name.length;
    object.list_of_parameters.forEach((val) => {
      length += 4 + val.length;
    });
    return length + 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/contrlr';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7b2aa60305c5a9ab0ff05803e4d2ab85';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # the contrlr name (e.g. smart_motor_ff2)
    string   contrlr_name
    
    # specify here a list of parameter_name:value
    # e.g. p:10 sets the p value of the controller to 10
    # the possible parameters are:
    #int16  p
    #int16  i
    #int16  d
    #int16  imax
    #int16  target
    #int16  sensor
    #int16  valve 
    #int16  deadband
    #int16  offset
    #int16  shift
    #int16  max
    #
    ## parameters for the motors
    #int16  motor_maxforce
    #int16  motor_safeforce
    #int16  force_p
    #int16  force_i
    #int16  force_d
    #int16  force_imax
    #int16  force_out_shift
    #int16  force_deadband
    #int16  force_offset
    #int16  sensor_imax
    #int16  sensor_deadband
    #int16  sensor_offset
    #int16  max_temperature
    #int16  max_current
    
    string[] list_of_parameters
    
    # the size of the list_of_parameters you are sending
    uint8 	 length_of_list
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new contrlr(null);
    if (msg.contrlr_name !== undefined) {
      resolved.contrlr_name = msg.contrlr_name;
    }
    else {
      resolved.contrlr_name = ''
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

module.exports = contrlr;
