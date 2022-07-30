# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from sr_robot_msgs/JointControllerState.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import std_msgs.msg

class JointControllerState(genpy.Message):
  _md5sum = "6d5ccb5452fd11516b5e350fcf60090e"
  _type = "sr_robot_msgs/JointControllerState"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """Header header
float64 set_point
float64 process_value
float64 process_value_dot
float64 commanded_velocity
float64 error
float64 time_step
float64 command
float64 measured_effort
float64 friction_compensation
float64 position_p
float64 position_i
float64 position_d
float64 position_i_clamp
float64 velocity_p
float64 velocity_i
float64 velocity_d
float64 velocity_i_clamp

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
  __slots__ = ['header','set_point','process_value','process_value_dot','commanded_velocity','error','time_step','command','measured_effort','friction_compensation','position_p','position_i','position_d','position_i_clamp','velocity_p','velocity_i','velocity_d','velocity_i_clamp']
  _slot_types = ['std_msgs/Header','float64','float64','float64','float64','float64','float64','float64','float64','float64','float64','float64','float64','float64','float64','float64','float64','float64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,set_point,process_value,process_value_dot,commanded_velocity,error,time_step,command,measured_effort,friction_compensation,position_p,position_i,position_d,position_i_clamp,velocity_p,velocity_i,velocity_d,velocity_i_clamp

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(JointControllerState, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.set_point is None:
        self.set_point = 0.
      if self.process_value is None:
        self.process_value = 0.
      if self.process_value_dot is None:
        self.process_value_dot = 0.
      if self.commanded_velocity is None:
        self.commanded_velocity = 0.
      if self.error is None:
        self.error = 0.
      if self.time_step is None:
        self.time_step = 0.
      if self.command is None:
        self.command = 0.
      if self.measured_effort is None:
        self.measured_effort = 0.
      if self.friction_compensation is None:
        self.friction_compensation = 0.
      if self.position_p is None:
        self.position_p = 0.
      if self.position_i is None:
        self.position_i = 0.
      if self.position_d is None:
        self.position_d = 0.
      if self.position_i_clamp is None:
        self.position_i_clamp = 0.
      if self.velocity_p is None:
        self.velocity_p = 0.
      if self.velocity_i is None:
        self.velocity_i = 0.
      if self.velocity_d is None:
        self.velocity_d = 0.
      if self.velocity_i_clamp is None:
        self.velocity_i_clamp = 0.
    else:
      self.header = std_msgs.msg.Header()
      self.set_point = 0.
      self.process_value = 0.
      self.process_value_dot = 0.
      self.commanded_velocity = 0.
      self.error = 0.
      self.time_step = 0.
      self.command = 0.
      self.measured_effort = 0.
      self.friction_compensation = 0.
      self.position_p = 0.
      self.position_i = 0.
      self.position_d = 0.
      self.position_i_clamp = 0.
      self.velocity_p = 0.
      self.velocity_i = 0.
      self.velocity_d = 0.
      self.velocity_i_clamp = 0.

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
      buff.write(_get_struct_17d().pack(_x.set_point, _x.process_value, _x.process_value_dot, _x.commanded_velocity, _x.error, _x.time_step, _x.command, _x.measured_effort, _x.friction_compensation, _x.position_p, _x.position_i, _x.position_d, _x.position_i_clamp, _x.velocity_p, _x.velocity_i, _x.velocity_d, _x.velocity_i_clamp))
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
      end += 136
      (_x.set_point, _x.process_value, _x.process_value_dot, _x.commanded_velocity, _x.error, _x.time_step, _x.command, _x.measured_effort, _x.friction_compensation, _x.position_p, _x.position_i, _x.position_d, _x.position_i_clamp, _x.velocity_p, _x.velocity_i, _x.velocity_d, _x.velocity_i_clamp,) = _get_struct_17d().unpack(str[start:end])
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
      buff.write(_get_struct_17d().pack(_x.set_point, _x.process_value, _x.process_value_dot, _x.commanded_velocity, _x.error, _x.time_step, _x.command, _x.measured_effort, _x.friction_compensation, _x.position_p, _x.position_i, _x.position_d, _x.position_i_clamp, _x.velocity_p, _x.velocity_i, _x.velocity_d, _x.velocity_i_clamp))
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
      end += 136
      (_x.set_point, _x.process_value, _x.process_value_dot, _x.commanded_velocity, _x.error, _x.time_step, _x.command, _x.measured_effort, _x.friction_compensation, _x.position_p, _x.position_i, _x.position_d, _x.position_i_clamp, _x.velocity_p, _x.velocity_i, _x.velocity_d, _x.velocity_i_clamp,) = _get_struct_17d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_17d = None
def _get_struct_17d():
    global _struct_17d
    if _struct_17d is None:
        _struct_17d = struct.Struct("<17d")
    return _struct_17d
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
