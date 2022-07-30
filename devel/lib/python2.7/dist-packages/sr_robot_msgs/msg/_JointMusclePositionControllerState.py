# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from sr_robot_msgs/JointMusclePositionControllerState.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import std_msgs.msg

class JointMusclePositionControllerState(genpy.Message):
  _md5sum = "5a9f3e4da940842d5d2d35e00e1cd647"
  _type = "sr_robot_msgs/JointMusclePositionControllerState"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """Header header
float64 set_point
float64 process_value
float64 process_value_dot
float64 error
float64 time_step
float64 pseudo_command
int8 valve_muscle_0
int8 valve_muscle_1
float64 packed_valve
uint16 muscle_pressure_0
uint16 muscle_pressure_1
float64 p
float64 i
float64 d
float64 i_clamp


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
"""
  __slots__ = ['header','set_point','process_value','process_value_dot','error','time_step','pseudo_command','valve_muscle_0','valve_muscle_1','packed_valve','muscle_pressure_0','muscle_pressure_1','p','i','d','i_clamp']
  _slot_types = ['std_msgs/Header','float64','float64','float64','float64','float64','float64','int8','int8','float64','uint16','uint16','float64','float64','float64','float64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,set_point,process_value,process_value_dot,error,time_step,pseudo_command,valve_muscle_0,valve_muscle_1,packed_valve,muscle_pressure_0,muscle_pressure_1,p,i,d,i_clamp

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(JointMusclePositionControllerState, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.set_point is None:
        self.set_point = 0.
      if self.process_value is None:
        self.process_value = 0.
      if self.process_value_dot is None:
        self.process_value_dot = 0.
      if self.error is None:
        self.error = 0.
      if self.time_step is None:
        self.time_step = 0.
      if self.pseudo_command is None:
        self.pseudo_command = 0.
      if self.valve_muscle_0 is None:
        self.valve_muscle_0 = 0
      if self.valve_muscle_1 is None:
        self.valve_muscle_1 = 0
      if self.packed_valve is None:
        self.packed_valve = 0.
      if self.muscle_pressure_0 is None:
        self.muscle_pressure_0 = 0
      if self.muscle_pressure_1 is None:
        self.muscle_pressure_1 = 0
      if self.p is None:
        self.p = 0.
      if self.i is None:
        self.i = 0.
      if self.d is None:
        self.d = 0.
      if self.i_clamp is None:
        self.i_clamp = 0.
    else:
      self.header = std_msgs.msg.Header()
      self.set_point = 0.
      self.process_value = 0.
      self.process_value_dot = 0.
      self.error = 0.
      self.time_step = 0.
      self.pseudo_command = 0.
      self.valve_muscle_0 = 0
      self.valve_muscle_1 = 0
      self.packed_valve = 0.
      self.muscle_pressure_0 = 0
      self.muscle_pressure_1 = 0
      self.p = 0.
      self.i = 0.
      self.d = 0.
      self.i_clamp = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_6d2bd2H4d().pack(_x.set_point, _x.process_value, _x.process_value_dot, _x.error, _x.time_step, _x.pseudo_command, _x.valve_muscle_0, _x.valve_muscle_1, _x.packed_valve, _x.muscle_pressure_0, _x.muscle_pressure_1, _x.p, _x.i, _x.d, _x.i_clamp))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 94
      (_x.set_point, _x.process_value, _x.process_value_dot, _x.error, _x.time_step, _x.pseudo_command, _x.valve_muscle_0, _x.valve_muscle_1, _x.packed_valve, _x.muscle_pressure_0, _x.muscle_pressure_1, _x.p, _x.i, _x.d, _x.i_clamp,) = _get_struct_6d2bd2H4d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_6d2bd2H4d().pack(_x.set_point, _x.process_value, _x.process_value_dot, _x.error, _x.time_step, _x.pseudo_command, _x.valve_muscle_0, _x.valve_muscle_1, _x.packed_valve, _x.muscle_pressure_0, _x.muscle_pressure_1, _x.p, _x.i, _x.d, _x.i_clamp))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 94
      (_x.set_point, _x.process_value, _x.process_value_dot, _x.error, _x.time_step, _x.pseudo_command, _x.valve_muscle_0, _x.valve_muscle_1, _x.packed_valve, _x.muscle_pressure_0, _x.muscle_pressure_1, _x.p, _x.i, _x.d, _x.i_clamp,) = _get_struct_6d2bd2H4d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_6d2bd2H4d = None
def _get_struct_6d2bd2H4d():
    global _struct_6d2bd2H4d
    if _struct_6d2bd2H4d is None:
        _struct_6d2bd2H4d = struct.Struct("<6d2bd2H4d")
    return _struct_6d2bd2H4d
