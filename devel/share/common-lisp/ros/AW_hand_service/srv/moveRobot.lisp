; Auto-generated. Do not edit!


(cl:in-package AW_hand_service-srv)


;//! \htmlinclude moveRobot-request.msg.html

(cl:defclass <moveRobot-request> (roslisp-msg-protocol:ros-message)
  ((obj_x
    :reader obj_x
    :initarg :obj_x
    :type cl:float
    :initform 0.0)
   (obj_y
    :reader obj_y
    :initarg :obj_y
    :type cl:float
    :initform 0.0)
   (obj_z
    :reader obj_z
    :initarg :obj_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass moveRobot-request (<moveRobot-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <moveRobot-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'moveRobot-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name AW_hand_service-srv:<moveRobot-request> is deprecated: use AW_hand_service-srv:moveRobot-request instead.")))

(cl:ensure-generic-function 'obj_x-val :lambda-list '(m))
(cl:defmethod obj_x-val ((m <moveRobot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader AW_hand_service-srv:obj_x-val is deprecated.  Use AW_hand_service-srv:obj_x instead.")
  (obj_x m))

(cl:ensure-generic-function 'obj_y-val :lambda-list '(m))
(cl:defmethod obj_y-val ((m <moveRobot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader AW_hand_service-srv:obj_y-val is deprecated.  Use AW_hand_service-srv:obj_y instead.")
  (obj_y m))

(cl:ensure-generic-function 'obj_z-val :lambda-list '(m))
(cl:defmethod obj_z-val ((m <moveRobot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader AW_hand_service-srv:obj_z-val is deprecated.  Use AW_hand_service-srv:obj_z instead.")
  (obj_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <moveRobot-request>) ostream)
  "Serializes a message object of type '<moveRobot-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'obj_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'obj_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'obj_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <moveRobot-request>) istream)
  "Deserializes a message object of type '<moveRobot-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'obj_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'obj_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'obj_z) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<moveRobot-request>)))
  "Returns string type for a service object of type '<moveRobot-request>"
  "AW_hand_service/moveRobotRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'moveRobot-request)))
  "Returns string type for a service object of type 'moveRobot-request"
  "AW_hand_service/moveRobotRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<moveRobot-request>)))
  "Returns md5sum for a message object of type '<moveRobot-request>"
  "a379339920dab0da344b2dbd1b8b7fc8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'moveRobot-request)))
  "Returns md5sum for a message object of type 'moveRobot-request"
  "a379339920dab0da344b2dbd1b8b7fc8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<moveRobot-request>)))
  "Returns full string definition for message of type '<moveRobot-request>"
  (cl:format cl:nil "float64 obj_x~%float64 obj_y~%float64 obj_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'moveRobot-request)))
  "Returns full string definition for message of type 'moveRobot-request"
  (cl:format cl:nil "float64 obj_x~%float64 obj_y~%float64 obj_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <moveRobot-request>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <moveRobot-request>))
  "Converts a ROS message object to a list"
  (cl:list 'moveRobot-request
    (cl:cons ':obj_x (obj_x msg))
    (cl:cons ':obj_y (obj_y msg))
    (cl:cons ':obj_z (obj_z msg))
))
;//! \htmlinclude moveRobot-response.msg.html

(cl:defclass <moveRobot-response> (roslisp-msg-protocol:ros-message)
  ((plan_executed
    :reader plan_executed
    :initarg :plan_executed
    :type cl:boolean
    :initform cl:nil)
   (RobotJoints
    :reader RobotJoints
    :initarg :RobotJoints
    :type sensor_msgs-msg:JointState
    :initform (cl:make-instance 'sensor_msgs-msg:JointState)))
)

(cl:defclass moveRobot-response (<moveRobot-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <moveRobot-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'moveRobot-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name AW_hand_service-srv:<moveRobot-response> is deprecated: use AW_hand_service-srv:moveRobot-response instead.")))

(cl:ensure-generic-function 'plan_executed-val :lambda-list '(m))
(cl:defmethod plan_executed-val ((m <moveRobot-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader AW_hand_service-srv:plan_executed-val is deprecated.  Use AW_hand_service-srv:plan_executed instead.")
  (plan_executed m))

(cl:ensure-generic-function 'RobotJoints-val :lambda-list '(m))
(cl:defmethod RobotJoints-val ((m <moveRobot-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader AW_hand_service-srv:RobotJoints-val is deprecated.  Use AW_hand_service-srv:RobotJoints instead.")
  (RobotJoints m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <moveRobot-response>) ostream)
  "Serializes a message object of type '<moveRobot-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'plan_executed) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'RobotJoints) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <moveRobot-response>) istream)
  "Deserializes a message object of type '<moveRobot-response>"
    (cl:setf (cl:slot-value msg 'plan_executed) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'RobotJoints) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<moveRobot-response>)))
  "Returns string type for a service object of type '<moveRobot-response>"
  "AW_hand_service/moveRobotResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'moveRobot-response)))
  "Returns string type for a service object of type 'moveRobot-response"
  "AW_hand_service/moveRobotResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<moveRobot-response>)))
  "Returns md5sum for a message object of type '<moveRobot-response>"
  "a379339920dab0da344b2dbd1b8b7fc8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'moveRobot-response)))
  "Returns md5sum for a message object of type 'moveRobot-response"
  "a379339920dab0da344b2dbd1b8b7fc8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<moveRobot-response>)))
  "Returns full string definition for message of type '<moveRobot-response>"
  (cl:format cl:nil "bool plan_executed~%sensor_msgs/JointState RobotJoints~%~%~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'moveRobot-response)))
  "Returns full string definition for message of type 'moveRobot-response"
  (cl:format cl:nil "bool plan_executed~%sensor_msgs/JointState RobotJoints~%~%~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <moveRobot-response>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'RobotJoints))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <moveRobot-response>))
  "Converts a ROS message object to a list"
  (cl:list 'moveRobot-response
    (cl:cons ':plan_executed (plan_executed msg))
    (cl:cons ':RobotJoints (RobotJoints msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'moveRobot)))
  'moveRobot-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'moveRobot)))
  'moveRobot-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'moveRobot)))
  "Returns string type for a service object of type '<moveRobot>"
  "AW_hand_service/moveRobot")