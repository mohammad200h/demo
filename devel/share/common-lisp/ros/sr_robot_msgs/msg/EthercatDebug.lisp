; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude EthercatDebug.msg.html

(cl:defclass <EthercatDebug> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (sensors
    :reader sensors
    :initarg :sensors
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (motor_data_type
    :reader motor_data_type
    :initarg :motor_data_type
    :type sr_robot_msgs-msg:FromMotorDataType
    :initform (cl:make-instance 'sr_robot_msgs-msg:FromMotorDataType))
   (which_motors
    :reader which_motors
    :initarg :which_motors
    :type cl:fixnum
    :initform 0)
   (which_motor_data_arrived
    :reader which_motor_data_arrived
    :initarg :which_motor_data_arrived
    :type cl:integer
    :initform 0)
   (which_motor_data_had_errors
    :reader which_motor_data_had_errors
    :initarg :which_motor_data_had_errors
    :type cl:integer
    :initform 0)
   (motor_data_packet_torque
    :reader motor_data_packet_torque
    :initarg :motor_data_packet_torque
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (motor_data_packet_misc
    :reader motor_data_packet_misc
    :initarg :motor_data_packet_misc
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (tactile_data_type
    :reader tactile_data_type
    :initarg :tactile_data_type
    :type cl:integer
    :initform 0)
   (tactile_data_valid
    :reader tactile_data_valid
    :initarg :tactile_data_valid
    :type cl:fixnum
    :initform 0)
   (tactile
    :reader tactile
    :initarg :tactile
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (idle_time_us
    :reader idle_time_us
    :initarg :idle_time_us
    :type cl:fixnum
    :initform 0))
)

(cl:defclass EthercatDebug (<EthercatDebug>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EthercatDebug>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EthercatDebug)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<EthercatDebug> is deprecated: use sr_robot_msgs-msg:EthercatDebug instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EthercatDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:header-val is deprecated.  Use sr_robot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'sensors-val :lambda-list '(m))
(cl:defmethod sensors-val ((m <EthercatDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:sensors-val is deprecated.  Use sr_robot_msgs-msg:sensors instead.")
  (sensors m))

(cl:ensure-generic-function 'motor_data_type-val :lambda-list '(m))
(cl:defmethod motor_data_type-val ((m <EthercatDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:motor_data_type-val is deprecated.  Use sr_robot_msgs-msg:motor_data_type instead.")
  (motor_data_type m))

(cl:ensure-generic-function 'which_motors-val :lambda-list '(m))
(cl:defmethod which_motors-val ((m <EthercatDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:which_motors-val is deprecated.  Use sr_robot_msgs-msg:which_motors instead.")
  (which_motors m))

(cl:ensure-generic-function 'which_motor_data_arrived-val :lambda-list '(m))
(cl:defmethod which_motor_data_arrived-val ((m <EthercatDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:which_motor_data_arrived-val is deprecated.  Use sr_robot_msgs-msg:which_motor_data_arrived instead.")
  (which_motor_data_arrived m))

(cl:ensure-generic-function 'which_motor_data_had_errors-val :lambda-list '(m))
(cl:defmethod which_motor_data_had_errors-val ((m <EthercatDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:which_motor_data_had_errors-val is deprecated.  Use sr_robot_msgs-msg:which_motor_data_had_errors instead.")
  (which_motor_data_had_errors m))

(cl:ensure-generic-function 'motor_data_packet_torque-val :lambda-list '(m))
(cl:defmethod motor_data_packet_torque-val ((m <EthercatDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:motor_data_packet_torque-val is deprecated.  Use sr_robot_msgs-msg:motor_data_packet_torque instead.")
  (motor_data_packet_torque m))

(cl:ensure-generic-function 'motor_data_packet_misc-val :lambda-list '(m))
(cl:defmethod motor_data_packet_misc-val ((m <EthercatDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:motor_data_packet_misc-val is deprecated.  Use sr_robot_msgs-msg:motor_data_packet_misc instead.")
  (motor_data_packet_misc m))

(cl:ensure-generic-function 'tactile_data_type-val :lambda-list '(m))
(cl:defmethod tactile_data_type-val ((m <EthercatDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:tactile_data_type-val is deprecated.  Use sr_robot_msgs-msg:tactile_data_type instead.")
  (tactile_data_type m))

(cl:ensure-generic-function 'tactile_data_valid-val :lambda-list '(m))
(cl:defmethod tactile_data_valid-val ((m <EthercatDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:tactile_data_valid-val is deprecated.  Use sr_robot_msgs-msg:tactile_data_valid instead.")
  (tactile_data_valid m))

(cl:ensure-generic-function 'tactile-val :lambda-list '(m))
(cl:defmethod tactile-val ((m <EthercatDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:tactile-val is deprecated.  Use sr_robot_msgs-msg:tactile instead.")
  (tactile m))

(cl:ensure-generic-function 'idle_time_us-val :lambda-list '(m))
(cl:defmethod idle_time_us-val ((m <EthercatDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:idle_time_us-val is deprecated.  Use sr_robot_msgs-msg:idle_time_us instead.")
  (idle_time_us m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EthercatDebug>) ostream)
  "Serializes a message object of type '<EthercatDebug>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sensors))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'sensors))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'motor_data_type) ostream)
  (cl:let* ((signed (cl:slot-value msg 'which_motors)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'which_motor_data_arrived)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'which_motor_data_had_errors)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'motor_data_packet_torque))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'motor_data_packet_torque))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'motor_data_packet_misc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'motor_data_packet_misc))
  (cl:let* ((signed (cl:slot-value msg 'tactile_data_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'tactile_data_valid)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'tactile))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'tactile))
  (cl:let* ((signed (cl:slot-value msg 'idle_time_us)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EthercatDebug>) istream)
  "Deserializes a message object of type '<EthercatDebug>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'sensors) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sensors)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'motor_data_type) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'which_motors) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'which_motor_data_arrived) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'which_motor_data_had_errors) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'motor_data_packet_torque) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'motor_data_packet_torque)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'motor_data_packet_misc) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'motor_data_packet_misc)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tactile_data_type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tactile_data_valid) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'tactile) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'tactile)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'idle_time_us) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EthercatDebug>)))
  "Returns string type for a message object of type '<EthercatDebug>"
  "sr_robot_msgs/EthercatDebug")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EthercatDebug)))
  "Returns string type for a message object of type 'EthercatDebug"
  "sr_robot_msgs/EthercatDebug")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EthercatDebug>)))
  "Returns md5sum for a message object of type '<EthercatDebug>"
  "ed9e30784a7d4571ecf4d526e7ff529f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EthercatDebug)))
  "Returns md5sum for a message object of type 'EthercatDebug"
  "ed9e30784a7d4571ecf4d526e7ff529f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EthercatDebug>)))
  "Returns full string definition for message of type '<EthercatDebug>"
  (cl:format cl:nil "Header               header~%~%int16[]              sensors~%FromMotorDataType    motor_data_type~%int16                which_motors~%int32                which_motor_data_arrived~%int32                which_motor_data_had_errors~%int16[]              motor_data_packet_torque~%int16[]              motor_data_packet_misc~%int32                tactile_data_type~%int16                tactile_data_valid~%int16[]              tactile~%int16                idle_time_us~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sr_robot_msgs/FromMotorDataType~%int16 data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EthercatDebug)))
  "Returns full string definition for message of type 'EthercatDebug"
  (cl:format cl:nil "Header               header~%~%int16[]              sensors~%FromMotorDataType    motor_data_type~%int16                which_motors~%int32                which_motor_data_arrived~%int32                which_motor_data_had_errors~%int16[]              motor_data_packet_torque~%int16[]              motor_data_packet_misc~%int32                tactile_data_type~%int16                tactile_data_valid~%int16[]              tactile~%int16                idle_time_us~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sr_robot_msgs/FromMotorDataType~%int16 data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EthercatDebug>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sensors) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'motor_data_type))
     2
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'motor_data_packet_torque) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'motor_data_packet_misc) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4
     2
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'tactile) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EthercatDebug>))
  "Converts a ROS message object to a list"
  (cl:list 'EthercatDebug
    (cl:cons ':header (header msg))
    (cl:cons ':sensors (sensors msg))
    (cl:cons ':motor_data_type (motor_data_type msg))
    (cl:cons ':which_motors (which_motors msg))
    (cl:cons ':which_motor_data_arrived (which_motor_data_arrived msg))
    (cl:cons ':which_motor_data_had_errors (which_motor_data_had_errors msg))
    (cl:cons ':motor_data_packet_torque (motor_data_packet_torque msg))
    (cl:cons ':motor_data_packet_misc (motor_data_packet_misc msg))
    (cl:cons ':tactile_data_type (tactile_data_type msg))
    (cl:cons ':tactile_data_valid (tactile_data_valid msg))
    (cl:cons ':tactile (tactile msg))
    (cl:cons ':idle_time_us (idle_time_us msg))
))
