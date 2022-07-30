// Auto-generated. Do not edit!

// (in-package sr_robot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ShadowContactStateStamped {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.tangential_force = null;
      this.contact_position = null;
      this.contact_normal = null;
      this.Fnormal = null;
      this.Ltorque = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('tangential_force')) {
        this.tangential_force = initObj.tangential_force
      }
      else {
        this.tangential_force = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('contact_position')) {
        this.contact_position = initObj.contact_position
      }
      else {
        this.contact_position = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('contact_normal')) {
        this.contact_normal = initObj.contact_normal
      }
      else {
        this.contact_normal = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('Fnormal')) {
        this.Fnormal = initObj.Fnormal
      }
      else {
        this.Fnormal = 0.0;
      }
      if (initObj.hasOwnProperty('Ltorque')) {
        this.Ltorque = initObj.Ltorque
      }
      else {
        this.Ltorque = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ShadowContactStateStamped
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [tangential_force]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.tangential_force, buffer, bufferOffset);
    // Serialize message field [contact_position]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.contact_position, buffer, bufferOffset);
    // Serialize message field [contact_normal]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.contact_normal, buffer, bufferOffset);
    // Serialize message field [Fnormal]
    bufferOffset = _serializer.float64(obj.Fnormal, buffer, bufferOffset);
    // Serialize message field [Ltorque]
    bufferOffset = _serializer.float64(obj.Ltorque, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ShadowContactStateStamped
    let len;
    let data = new ShadowContactStateStamped(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [tangential_force]
    data.tangential_force = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [contact_position]
    data.contact_position = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [contact_normal]
    data.contact_normal = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [Fnormal]
    data.Fnormal = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Ltorque]
    data.Ltorque = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 88;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/ShadowContactStateStamped';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a0f0d461efe98dfada1d88584c069890';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # All 3D vectors are referenced in the fingertip core center
    
    Header header					# stamp
    geometry_msgs/Vector3 tangential_force  	# tangential force (local shear force)
    geometry_msgs/Point  contact_position		# contact position
    geometry_msgs/Vector3 contact_normal      	# contact normal
    float64 Fnormal					# amplitude of normal force (along normal)
    float64 Ltorque					# amplitude of local torque (around normal)
    
    
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
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ShadowContactStateStamped(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.tangential_force !== undefined) {
      resolved.tangential_force = geometry_msgs.msg.Vector3.Resolve(msg.tangential_force)
    }
    else {
      resolved.tangential_force = new geometry_msgs.msg.Vector3()
    }

    if (msg.contact_position !== undefined) {
      resolved.contact_position = geometry_msgs.msg.Point.Resolve(msg.contact_position)
    }
    else {
      resolved.contact_position = new geometry_msgs.msg.Point()
    }

    if (msg.contact_normal !== undefined) {
      resolved.contact_normal = geometry_msgs.msg.Vector3.Resolve(msg.contact_normal)
    }
    else {
      resolved.contact_normal = new geometry_msgs.msg.Vector3()
    }

    if (msg.Fnormal !== undefined) {
      resolved.Fnormal = msg.Fnormal;
    }
    else {
      resolved.Fnormal = 0.0
    }

    if (msg.Ltorque !== undefined) {
      resolved.Ltorque = msg.Ltorque;
    }
    else {
      resolved.Ltorque = 0.0
    }

    return resolved;
    }
};

module.exports = ShadowContactStateStamped;
