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

class JointMuscleValveControllerCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cmd_valve_muscle = null;
      this.cmd_duration_ms = null;
    }
    else {
      if (initObj.hasOwnProperty('cmd_valve_muscle')) {
        this.cmd_valve_muscle = initObj.cmd_valve_muscle
      }
      else {
        this.cmd_valve_muscle = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('cmd_duration_ms')) {
        this.cmd_duration_ms = initObj.cmd_duration_ms
      }
      else {
        this.cmd_duration_ms = new Array(2).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JointMuscleValveControllerCommand
    // Check that the constant length array field [cmd_valve_muscle] has the right length
    if (obj.cmd_valve_muscle.length !== 2) {
      throw new Error('Unable to serialize array field cmd_valve_muscle - length must be 2')
    }
    // Serialize message field [cmd_valve_muscle]
    bufferOffset = _arraySerializer.int8(obj.cmd_valve_muscle, buffer, bufferOffset, 2);
    // Check that the constant length array field [cmd_duration_ms] has the right length
    if (obj.cmd_duration_ms.length !== 2) {
      throw new Error('Unable to serialize array field cmd_duration_ms - length must be 2')
    }
    // Serialize message field [cmd_duration_ms]
    bufferOffset = _arraySerializer.uint64(obj.cmd_duration_ms, buffer, bufferOffset, 2);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JointMuscleValveControllerCommand
    let len;
    let data = new JointMuscleValveControllerCommand(null);
    // Deserialize message field [cmd_valve_muscle]
    data.cmd_valve_muscle = _arrayDeserializer.int8(buffer, bufferOffset, 2)
    // Deserialize message field [cmd_duration_ms]
    data.cmd_duration_ms = _arrayDeserializer.uint64(buffer, bufferOffset, 2)
    return data;
  }

  static getMessageSize(object) {
    return 18;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sr_robot_msgs/JointMuscleValveControllerCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1a35a9f185150fc2bca2640471eeb55f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This command will allow the user to specify a separate command for each of the two muscles that control the joint.
    # The user will also specify a duration in ms for that command. During this duration the command will be sent to the hand
    # every ms. 
    # Once this duration period has elapsed, a command of 0 will be sent to the muscle (meaning both the filling and emptying valves for that 
    # muscle remain closed), until a new command is received
    # A duration of 0 means that there is no timeout, so the valve command will be sent to the muscle until a different valve command is received.
    # BE CAREFUL WHEN USING A DURATION OF 0 AS THIS COULD EVENTUALLY DAMAGE THE MUSCLE
    
    # Allowed values for the cmd_valve_muscle are integers from -4 to +4.
    # +4 the filling valve is open during a full ms cycle. Emptying valve is closed
    # +3 the filling valve is open during 0.75 ms and closed during 0.25 ms in a 1 ms cycle. Emptying valve is closed
    # +2 the filling valve is open during 0.5 ms and closed during 0.5 ms in a 1 ms cycle. Emptying valve is closed
    # +1 the filling valve is open during 0.25 ms and closed during 0.75 ms in a 1 ms cycle. Emptying valve is closed
    # 0 both valves (filling and emptying) remain closed in a 1 ms cycle
    # ...
    # -3 the emptying valve is open during 0.75 ms and closed during 0.25 ms in a 1 ms cycle. Filling valve is closed
    # -4 the emptying valve is open during a full ms cycle. Filling valve is closed
    
    int8[2] cmd_valve_muscle
    uint64[2] cmd_duration_ms
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new JointMuscleValveControllerCommand(null);
    if (msg.cmd_valve_muscle !== undefined) {
      resolved.cmd_valve_muscle = msg.cmd_valve_muscle;
    }
    else {
      resolved.cmd_valve_muscle = new Array(2).fill(0)
    }

    if (msg.cmd_duration_ms !== undefined) {
      resolved.cmd_duration_ms = msg.cmd_duration_ms;
    }
    else {
      resolved.cmd_duration_ms = new Array(2).fill(0)
    }

    return resolved;
    }
};

module.exports = JointMuscleValveControllerCommand;
