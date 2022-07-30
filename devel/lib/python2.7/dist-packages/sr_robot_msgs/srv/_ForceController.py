# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from sr_robot_msgs/ForceControllerRequest.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class ForceControllerRequest(genpy.Message):
  _md5sum = "ed276d9ce996f859e20d6bd1f9b633f5"
  _type = "sr_robot_msgs/ForceControllerRequest"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """int16 maxpwm
int16 sgleftref
int16 sgrightref
int16 f
int16 p
int16 i
int16 d
int16 imax
int16 deadband
int16 sign
int16 torque_limit
int16 torque_limiter_gain
"""
  __slots__ = ['maxpwm','sgleftref','sgrightref','f','p','i','d','imax','deadband','sign','torque_limit','torque_limiter_gain']
  _slot_types = ['int16','int16','int16','int16','int16','int16','int16','int16','int16','int16','int16','int16']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       maxpwm,sgleftref,sgrightref,f,p,i,d,imax,deadband,sign,torque_limit,torque_limiter_gain

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ForceControllerRequest, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.maxpwm is None:
        self.maxpwm = 0
      if self.sgleftref is None:
        self.sgleftref = 0
      if self.sgrightref is None:
        self.sgrightref = 0
      if self.f is None:
        self.f = 0
      if self.p is None:
        self.p = 0
      if self.i is None:
        self.i = 0
      if self.d is None:
        self.d = 0
      if self.imax is None:
        self.imax = 0
      if self.deadband is None:
        self.deadband = 0
      if self.sign is None:
        self.sign = 0
      if self.torque_limit is None:
        self.torque_limit = 0
      if self.torque_limiter_gain is None:
        self.torque_limiter_gain = 0
    else:
      self.maxpwm = 0
      self.sgleftref = 0
      self.sgrightref = 0
      self.f = 0
      self.p = 0
      self.i = 0
      self.d = 0
      self.imax = 0
      self.deadband = 0
      self.sign = 0
      self.torque_limit = 0
      self.torque_limiter_gain = 0

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
      buff.write(_get_struct_12h().pack(_x.maxpwm, _x.sgleftref, _x.sgrightref, _x.f, _x.p, _x.i, _x.d, _x.imax, _x.deadband, _x.sign, _x.torque_limit, _x.torque_limiter_gain))
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
      _x = self
      start = end
      end += 24
      (_x.maxpwm, _x.sgleftref, _x.sgrightref, _x.f, _x.p, _x.i, _x.d, _x.imax, _x.deadband, _x.sign, _x.torque_limit, _x.torque_limiter_gain,) = _get_struct_12h().unpack(str[start:end])
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
      buff.write(_get_struct_12h().pack(_x.maxpwm, _x.sgleftref, _x.sgrightref, _x.f, _x.p, _x.i, _x.d, _x.imax, _x.deadband, _x.sign, _x.torque_limit, _x.torque_limiter_gain))
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
      _x = self
      start = end
      end += 24
      (_x.maxpwm, _x.sgleftref, _x.sgrightref, _x.f, _x.p, _x.i, _x.d, _x.imax, _x.deadband, _x.sign, _x.torque_limit, _x.torque_limiter_gain,) = _get_struct_12h().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_12h = None
def _get_struct_12h():
    global _struct_12h
    if _struct_12h is None:
        _struct_12h = struct.Struct("<12h")
    return _struct_12h
# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from sr_robot_msgs/ForceControllerResponse.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class ForceControllerResponse(genpy.Message):
  _md5sum = "d3b1a74026985b10664594fe60a8c3eb"
  _type = "sr_robot_msgs/ForceControllerResponse"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """bool configured
"""
  __slots__ = ['configured']
  _slot_types = ['bool']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       configured

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ForceControllerResponse, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.configured is None:
        self.configured = False
    else:
      self.configured = False

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
      _x = self.configured
      buff.write(_get_struct_B().pack(_x))
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
      end += 1
      (self.configured,) = _get_struct_B().unpack(str[start:end])
      self.configured = bool(self.configured)
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
      _x = self.configured
      buff.write(_get_struct_B().pack(_x))
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
      end += 1
      (self.configured,) = _get_struct_B().unpack(str[start:end])
      self.configured = bool(self.configured)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_B = None
def _get_struct_B():
    global _struct_B
    if _struct_B is None:
        _struct_B = struct.Struct("<B")
    return _struct_B
class ForceController(object):
  _type          = 'sr_robot_msgs/ForceController'
  _md5sum = '196995b160417ed9330477132c6b834a'
  _request_class  = ForceControllerRequest
  _response_class = ForceControllerResponse
