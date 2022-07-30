; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude AuxSpiData.msg.html

(cl:defclass <AuxSpiData> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (sensors
    :reader sensors
    :initarg :sensors
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 16 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass AuxSpiData (<AuxSpiData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AuxSpiData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AuxSpiData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<AuxSpiData> is deprecated: use sr_robot_msgs-msg:AuxSpiData instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AuxSpiData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:header-val is deprecated.  Use sr_robot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'sensors-val :lambda-list '(m))
(cl:defmethod sensors-val ((m <AuxSpiData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:sensors-val is deprecated.  Use sr_robot_msgs-msg:sensors instead.")
  (sensors m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AuxSpiData>) ostream)
  "Serializes a message object of type '<AuxSpiData>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'sensors))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AuxSpiData>) istream)
  "Deserializes a message object of type '<AuxSpiData>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:setf (cl:slot-value msg 'sensors) (cl:make-array 16))
  (cl:let ((vals (cl:slot-value msg 'sensors)))
    (cl:dotimes (i 16)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AuxSpiData>)))
  "Returns string type for a message object of type '<AuxSpiData>"
  "sr_robot_msgs/AuxSpiData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AuxSpiData)))
  "Returns string type for a message object of type 'AuxSpiData"
  "sr_robot_msgs/AuxSpiData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AuxSpiData>)))
  "Returns md5sum for a message object of type '<AuxSpiData>"
  "0be98a0e10e956b06a48167fcb32ca84")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AuxSpiData)))
  "Returns md5sum for a message object of type 'AuxSpiData"
  "0be98a0e10e956b06a48167fcb32ca84")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AuxSpiData>)))
  "Returns full string definition for message of type '<AuxSpiData>"
  (cl:format cl:nil "Header header~%uint16[16] sensors~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AuxSpiData)))
  "Returns full string definition for message of type 'AuxSpiData"
  (cl:format cl:nil "Header header~%uint16[16] sensors~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AuxSpiData>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'sensors) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AuxSpiData>))
  "Converts a ROS message object to a list"
  (cl:list 'AuxSpiData
    (cl:cons ':header (header msg))
    (cl:cons ':sensors (sensors msg))
))
