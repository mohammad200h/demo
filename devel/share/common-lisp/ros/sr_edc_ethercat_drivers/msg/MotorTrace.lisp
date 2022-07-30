; Auto-generated. Do not edit!


(cl:in-package sr_edc_ethercat_drivers-msg)


;//! \htmlinclude MotorTrace.msg.html

(cl:defclass <MotorTrace> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (reason
    :reader reason
    :initarg :reason
    :type cl:string
    :initform "")
   (actuator_info
    :reader actuator_info
    :initarg :actuator_info
    :type sr_edc_ethercat_drivers-msg:ActuatorInfo
    :initform (cl:make-instance 'sr_edc_ethercat_drivers-msg:ActuatorInfo))
   (samples
    :reader samples
    :initarg :samples
    :type (cl:vector sr_edc_ethercat_drivers-msg:MotorTraceSample)
   :initform (cl:make-array 0 :element-type 'sr_edc_ethercat_drivers-msg:MotorTraceSample :initial-element (cl:make-instance 'sr_edc_ethercat_drivers-msg:MotorTraceSample))))
)

(cl:defclass MotorTrace (<MotorTrace>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotorTrace>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotorTrace)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_edc_ethercat_drivers-msg:<MotorTrace> is deprecated: use sr_edc_ethercat_drivers-msg:MotorTrace instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MotorTrace>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:header-val is deprecated.  Use sr_edc_ethercat_drivers-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'reason-val :lambda-list '(m))
(cl:defmethod reason-val ((m <MotorTrace>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:reason-val is deprecated.  Use sr_edc_ethercat_drivers-msg:reason instead.")
  (reason m))

(cl:ensure-generic-function 'actuator_info-val :lambda-list '(m))
(cl:defmethod actuator_info-val ((m <MotorTrace>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:actuator_info-val is deprecated.  Use sr_edc_ethercat_drivers-msg:actuator_info instead.")
  (actuator_info m))

(cl:ensure-generic-function 'samples-val :lambda-list '(m))
(cl:defmethod samples-val ((m <MotorTrace>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:samples-val is deprecated.  Use sr_edc_ethercat_drivers-msg:samples instead.")
  (samples m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotorTrace>) ostream)
  "Serializes a message object of type '<MotorTrace>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'reason))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'reason))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'actuator_info) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'samples))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'samples))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotorTrace>) istream)
  "Deserializes a message object of type '<MotorTrace>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'reason) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'reason) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'actuator_info) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'samples) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'samples)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sr_edc_ethercat_drivers-msg:MotorTraceSample))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotorTrace>)))
  "Returns string type for a message object of type '<MotorTrace>"
  "sr_edc_ethercat_drivers/MotorTrace")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotorTrace)))
  "Returns string type for a message object of type 'MotorTrace"
  "sr_edc_ethercat_drivers/MotorTrace")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotorTrace>)))
  "Returns md5sum for a message object of type '<MotorTrace>"
  "d06300e55fe6989d2795bc4072205fe1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotorTrace)))
  "Returns md5sum for a message object of type 'MotorTrace"
  "d06300e55fe6989d2795bc4072205fe1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotorTrace>)))
  "Returns full string definition for message of type '<MotorTrace>"
  (cl:format cl:nil "Header header~%string reason~%sr_edc_ethercat_drivers/ActuatorInfo actuator_info~%sr_edc_ethercat_drivers/MotorTraceSample[] samples~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sr_edc_ethercat_drivers/ActuatorInfo~%string name~%float64 slow_motor_current_limit~%float64 quick_motor_current_limit~%float64 duty_limit~%float64 max_duty~%================================================================================~%MSG: sr_edc_ethercat_drivers/MotorTraceSample~%float64 commanded_effort~%float64 slow_effort_limit~%float64 quick_effort_limit~%float64 motor_current~%float64 motor_supply_voltage~%float64 hbridge_duty~%float64 temperature~%float64 force_sensor_1~%float64 force_sensor_2~%float64 force_sensor_3~%float64 motor_velocity~%float64 velocity~%float64 position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotorTrace)))
  "Returns full string definition for message of type 'MotorTrace"
  (cl:format cl:nil "Header header~%string reason~%sr_edc_ethercat_drivers/ActuatorInfo actuator_info~%sr_edc_ethercat_drivers/MotorTraceSample[] samples~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sr_edc_ethercat_drivers/ActuatorInfo~%string name~%float64 slow_motor_current_limit~%float64 quick_motor_current_limit~%float64 duty_limit~%float64 max_duty~%================================================================================~%MSG: sr_edc_ethercat_drivers/MotorTraceSample~%float64 commanded_effort~%float64 slow_effort_limit~%float64 quick_effort_limit~%float64 motor_current~%float64 motor_supply_voltage~%float64 hbridge_duty~%float64 temperature~%float64 force_sensor_1~%float64 force_sensor_2~%float64 force_sensor_3~%float64 motor_velocity~%float64 velocity~%float64 position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotorTrace>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'reason))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'actuator_info))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'samples) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotorTrace>))
  "Converts a ROS message object to a list"
  (cl:list 'MotorTrace
    (cl:cons ':header (header msg))
    (cl:cons ':reason (reason msg))
    (cl:cons ':actuator_info (actuator_info msg))
    (cl:cons ':samples (samples msg))
))
