# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from sr_robot_msgs/MidProxData.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class MidProxData(genpy.Message):
  _md5sum = "8ae5331748e57fcbdb20b7e2f086fcbf"
  _type = "sr_robot_msgs/MidProxData"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """uint16[4] middle
uint16[4] proximal
"""
  __slots__ = ['middle','proximal']
  _slot_types = ['uint16[4]','uint16[4]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       middle,proximal

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(MidProxData, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.middle is None:
        self.middle = [0] * 4
      if self.proximal is None:
        self.proximal = [0] * 4
    else:
      self.middle = [0] * 4
      self.proximal = [0] * 4

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
      buff.write(_get_struct_4H().pack(*self.middle))
      buff.write(_get_struct_4H().pack(*self.proximal))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      start = end
      end += 8
      self.middle = _get_struct_4H().unpack(str[start:end])
      start = end
      end += 8
      self.proximal = _get_struct_4H().unpack(str[start:end])
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
      buff.write(self.middle.tostring())
      buff.write(self.proximal.tostring())
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
      end = 0
      start = end
      end += 8
      self.middle = numpy.frombuffer(str[start:end], dtype=numpy.uint16, count=4)
      start = end
      end += 8
      self.proximal = numpy.frombuffer(str[start:end], dtype=numpy.uint16, count=4)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_4H = None
def _get_struct_4H():
    global _struct_4H
    if _struct_4H is None:
        _struct_4H = struct.Struct("<4H")
    return _struct_4H
