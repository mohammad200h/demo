; Auto-generated. Do not edit!


(cl:in-package sr_edc_ethercat_drivers-msg)


;//! \htmlinclude ActuatorInfo.msg.html

(cl:defclass <ActuatorInfo> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (slow_motor_current_limit
    :reader slow_motor_current_limit
    :initarg :slow_motor_current_limit
    :type cl:float
    :initform 0.0)
   (quick_motor_current_limit
    :reader quick_motor_current_limit
    :initarg :quick_motor_current_limit
    :type cl:float
    :initform 0.0)
   (duty_limit
    :reader duty_limit
    :initarg :duty_limit
    :type cl:float
    :initform 0.0)
   (max_duty
    :reader max_duty
    :initarg :max_duty
    :type cl:float
    :initform 0.0))
)

(cl:defclass ActuatorInfo (<ActuatorInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ActuatorInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ActuatorInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_edc_ethercat_drivers-msg:<ActuatorInfo> is deprecated: use sr_edc_ethercat_drivers-msg:ActuatorInfo instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <ActuatorInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:name-val is deprecated.  Use sr_edc_ethercat_drivers-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'slow_motor_current_limit-val :lambda-list '(m))
(cl:defmethod slow_motor_current_limit-val ((m <ActuatorInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:slow_motor_current_limit-val is deprecated.  Use sr_edc_ethercat_drivers-msg:slow_motor_current_limit instead.")
  (slow_motor_current_limit m))

(cl:ensure-generic-function 'quick_motor_current_limit-val :lambda-list '(m))
(cl:defmethod quick_motor_current_limit-val ((m <ActuatorInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:quick_motor_current_limit-val is deprecated.  Use sr_edc_ethercat_drivers-msg:quick_motor_current_limit instead.")
  (quick_motor_current_limit m))

(cl:ensure-generic-function 'duty_limit-val :lambda-list '(m))
(cl:defmethod duty_limit-val ((m <ActuatorInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:duty_limit-val is deprecated.  Use sr_edc_ethercat_drivers-msg:duty_limit instead.")
  (duty_limit m))

(cl:ensure-generic-function 'max_duty-val :lambda-list '(m))
(cl:defmethod max_duty-val ((m <ActuatorInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:max_duty-val is deprecated.  Use sr_edc_ethercat_drivers-msg:max_duty instead.")
  (max_duty m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ActuatorInfo>) ostream)
  "Serializes a message object of type '<ActuatorInfo>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'slow_motor_current_limit))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'quick_motor_current_limit))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'duty_limit))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'max_duty))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ActuatorInfo>) istream)
  "Deserializes a message object of type '<ActuatorInfo>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'slow_motor_current_limit) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'quick_motor_current_limit) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'duty_limit) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_duty) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ActuatorInfo>)))
  "Returns string type for a message object of type '<ActuatorInfo>"
  "sr_edc_ethercat_drivers/ActuatorInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ActuatorInfo)))
  "Returns string type for a message object of type 'ActuatorInfo"
  "sr_edc_ethercat_drivers/ActuatorInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ActuatorInfo>)))
  "Returns md5sum for a message object of type '<ActuatorInfo>"
  "b69309b2980b8b35e7e2b52bad59330a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ActuatorInfo)))
  "Returns md5sum for a message object of type 'ActuatorInfo"
  "b69309b2980b8b35e7e2b52bad59330a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ActuatorInfo>)))
  "Returns full string definition for message of type '<ActuatorInfo>"
  (cl:format cl:nil "string name~%float64 slow_motor_current_limit~%float64 quick_motor_current_limit~%float64 duty_limit~%float64 max_duty~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ActuatorInfo)))
  "Returns full string definition for message of type 'ActuatorInfo"
  (cl:format cl:nil "string name~%float64 slow_motor_current_limit~%float64 quick_motor_current_limit~%float64 duty_limit~%float64 max_duty~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ActuatorInfo>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ActuatorInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'ActuatorInfo
    (cl:cons ':name (name msg))
    (cl:cons ':slow_motor_current_limit (slow_motor_current_limit msg))
    (cl:cons ':quick_motor_current_limit (quick_motor_current_limit msg))
    (cl:cons ':duty_limit (duty_limit msg))
    (cl:cons ':max_duty (max_duty msg))
))
