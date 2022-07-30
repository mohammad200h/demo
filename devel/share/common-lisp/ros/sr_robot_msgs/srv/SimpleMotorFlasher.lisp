; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude SimpleMotorFlasher-request.msg.html

(cl:defclass <SimpleMotorFlasher-request> (roslisp-msg-protocol:ros-message)
  ((firmware
    :reader firmware
    :initarg :firmware
    :type cl:string
    :initform "")
   (motor_id
    :reader motor_id
    :initarg :motor_id
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SimpleMotorFlasher-request (<SimpleMotorFlasher-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SimpleMotorFlasher-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SimpleMotorFlasher-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<SimpleMotorFlasher-request> is deprecated: use sr_robot_msgs-srv:SimpleMotorFlasher-request instead.")))

(cl:ensure-generic-function 'firmware-val :lambda-list '(m))
(cl:defmethod firmware-val ((m <SimpleMotorFlasher-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:firmware-val is deprecated.  Use sr_robot_msgs-srv:firmware instead.")
  (firmware m))

(cl:ensure-generic-function 'motor_id-val :lambda-list '(m))
(cl:defmethod motor_id-val ((m <SimpleMotorFlasher-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:motor_id-val is deprecated.  Use sr_robot_msgs-srv:motor_id instead.")
  (motor_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SimpleMotorFlasher-request>) ostream)
  "Serializes a message object of type '<SimpleMotorFlasher-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'firmware))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'firmware))
  (cl:let* ((signed (cl:slot-value msg 'motor_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SimpleMotorFlasher-request>) istream)
  "Deserializes a message object of type '<SimpleMotorFlasher-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'firmware) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'firmware) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'motor_id) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SimpleMotorFlasher-request>)))
  "Returns string type for a service object of type '<SimpleMotorFlasher-request>"
  "sr_robot_msgs/SimpleMotorFlasherRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SimpleMotorFlasher-request)))
  "Returns string type for a service object of type 'SimpleMotorFlasher-request"
  "sr_robot_msgs/SimpleMotorFlasherRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SimpleMotorFlasher-request>)))
  "Returns md5sum for a message object of type '<SimpleMotorFlasher-request>"
  "b5e4cd4b44ed54dd8f018caf24a9e0c1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SimpleMotorFlasher-request)))
  "Returns md5sum for a message object of type 'SimpleMotorFlasher-request"
  "b5e4cd4b44ed54dd8f018caf24a9e0c1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SimpleMotorFlasher-request>)))
  "Returns full string definition for message of type '<SimpleMotorFlasher-request>"
  (cl:format cl:nil "string firmware~%int8 motor_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SimpleMotorFlasher-request)))
  "Returns full string definition for message of type 'SimpleMotorFlasher-request"
  (cl:format cl:nil "string firmware~%int8 motor_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SimpleMotorFlasher-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'firmware))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SimpleMotorFlasher-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SimpleMotorFlasher-request
    (cl:cons ':firmware (firmware msg))
    (cl:cons ':motor_id (motor_id msg))
))
;//! \htmlinclude SimpleMotorFlasher-response.msg.html

(cl:defclass <SimpleMotorFlasher-response> (roslisp-msg-protocol:ros-message)
  ((value
    :reader value
    :initarg :value
    :type cl:integer
    :initform 0))
)

(cl:defclass SimpleMotorFlasher-response (<SimpleMotorFlasher-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SimpleMotorFlasher-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SimpleMotorFlasher-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<SimpleMotorFlasher-response> is deprecated: use sr_robot_msgs-srv:SimpleMotorFlasher-response instead.")))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <SimpleMotorFlasher-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:value-val is deprecated.  Use sr_robot_msgs-srv:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<SimpleMotorFlasher-response>)))
    "Constants for message type '<SimpleMotorFlasher-response>"
  '((:SUCCESS . 0)
    (:FAIL . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'SimpleMotorFlasher-response)))
    "Constants for message type 'SimpleMotorFlasher-response"
  '((:SUCCESS . 0)
    (:FAIL . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SimpleMotorFlasher-response>) ostream)
  "Serializes a message object of type '<SimpleMotorFlasher-response>"
  (cl:let* ((signed (cl:slot-value msg 'value)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SimpleMotorFlasher-response>) istream)
  "Deserializes a message object of type '<SimpleMotorFlasher-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SimpleMotorFlasher-response>)))
  "Returns string type for a service object of type '<SimpleMotorFlasher-response>"
  "sr_robot_msgs/SimpleMotorFlasherResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SimpleMotorFlasher-response)))
  "Returns string type for a service object of type 'SimpleMotorFlasher-response"
  "sr_robot_msgs/SimpleMotorFlasherResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SimpleMotorFlasher-response>)))
  "Returns md5sum for a message object of type '<SimpleMotorFlasher-response>"
  "b5e4cd4b44ed54dd8f018caf24a9e0c1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SimpleMotorFlasher-response)))
  "Returns md5sum for a message object of type 'SimpleMotorFlasher-response"
  "b5e4cd4b44ed54dd8f018caf24a9e0c1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SimpleMotorFlasher-response>)))
  "Returns full string definition for message of type '<SimpleMotorFlasher-response>"
  (cl:format cl:nil "int32 value~%~%int32 SUCCESS = 0~%int32 FAIL = 1~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SimpleMotorFlasher-response)))
  "Returns full string definition for message of type 'SimpleMotorFlasher-response"
  (cl:format cl:nil "int32 value~%~%int32 SUCCESS = 0~%int32 FAIL = 1~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SimpleMotorFlasher-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SimpleMotorFlasher-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SimpleMotorFlasher-response
    (cl:cons ':value (value msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SimpleMotorFlasher)))
  'SimpleMotorFlasher-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SimpleMotorFlasher)))
  'SimpleMotorFlasher-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SimpleMotorFlasher)))
  "Returns string type for a service object of type '<SimpleMotorFlasher>"
  "sr_robot_msgs/SimpleMotorFlasher")