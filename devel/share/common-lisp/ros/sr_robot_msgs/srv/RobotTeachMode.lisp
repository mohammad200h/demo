; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude RobotTeachMode-request.msg.html

(cl:defclass <RobotTeachMode-request> (roslisp-msg-protocol:ros-message)
  ((teach_mode
    :reader teach_mode
    :initarg :teach_mode
    :type cl:integer
    :initform 0)
   (robot
    :reader robot
    :initarg :robot
    :type cl:string
    :initform ""))
)

(cl:defclass RobotTeachMode-request (<RobotTeachMode-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotTeachMode-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotTeachMode-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<RobotTeachMode-request> is deprecated: use sr_robot_msgs-srv:RobotTeachMode-request instead.")))

(cl:ensure-generic-function 'teach_mode-val :lambda-list '(m))
(cl:defmethod teach_mode-val ((m <RobotTeachMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:teach_mode-val is deprecated.  Use sr_robot_msgs-srv:teach_mode instead.")
  (teach_mode m))

(cl:ensure-generic-function 'robot-val :lambda-list '(m))
(cl:defmethod robot-val ((m <RobotTeachMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:robot-val is deprecated.  Use sr_robot_msgs-srv:robot instead.")
  (robot m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<RobotTeachMode-request>)))
    "Constants for message type '<RobotTeachMode-request>"
  '((:TRAJECTORY_MODE . 0)
    (:TEACH_MODE . 1)
    (:POSITION_MODE . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'RobotTeachMode-request)))
    "Constants for message type 'RobotTeachMode-request"
  '((:TRAJECTORY_MODE . 0)
    (:TEACH_MODE . 1)
    (:POSITION_MODE . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotTeachMode-request>) ostream)
  "Serializes a message object of type '<RobotTeachMode-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'teach_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'teach_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'teach_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'teach_mode)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robot))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotTeachMode-request>) istream)
  "Deserializes a message object of type '<RobotTeachMode-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'teach_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'teach_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'teach_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'teach_mode)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robot) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotTeachMode-request>)))
  "Returns string type for a service object of type '<RobotTeachMode-request>"
  "sr_robot_msgs/RobotTeachModeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotTeachMode-request)))
  "Returns string type for a service object of type 'RobotTeachMode-request"
  "sr_robot_msgs/RobotTeachModeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotTeachMode-request>)))
  "Returns md5sum for a message object of type '<RobotTeachMode-request>"
  "c6613d1d4bc3ca4c55986e93b2eaff93")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotTeachMode-request)))
  "Returns md5sum for a message object of type 'RobotTeachMode-request"
  "c6613d1d4bc3ca4c55986e93b2eaff93")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotTeachMode-request>)))
  "Returns full string definition for message of type '<RobotTeachMode-request>"
  (cl:format cl:nil "~%~%uint32 TRAJECTORY_MODE=0~%~%uint32 TEACH_MODE=1~%~%uint32 POSITION_MODE=2~%~%~%uint32 teach_mode~%string robot~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotTeachMode-request)))
  "Returns full string definition for message of type 'RobotTeachMode-request"
  (cl:format cl:nil "~%~%uint32 TRAJECTORY_MODE=0~%~%uint32 TEACH_MODE=1~%~%uint32 POSITION_MODE=2~%~%~%uint32 teach_mode~%string robot~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotTeachMode-request>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'robot))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotTeachMode-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotTeachMode-request
    (cl:cons ':teach_mode (teach_mode msg))
    (cl:cons ':robot (robot msg))
))
;//! \htmlinclude RobotTeachMode-response.msg.html

(cl:defclass <RobotTeachMode-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:integer
    :initform 0))
)

(cl:defclass RobotTeachMode-response (<RobotTeachMode-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotTeachMode-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotTeachMode-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<RobotTeachMode-response> is deprecated: use sr_robot_msgs-srv:RobotTeachMode-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <RobotTeachMode-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:result-val is deprecated.  Use sr_robot_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<RobotTeachMode-response>)))
    "Constants for message type '<RobotTeachMode-response>"
  '((:ERROR . -1)
    (:SUCCESS . 0))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'RobotTeachMode-response)))
    "Constants for message type 'RobotTeachMode-response"
  '((:ERROR . -1)
    (:SUCCESS . 0))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotTeachMode-response>) ostream)
  "Serializes a message object of type '<RobotTeachMode-response>"
  (cl:let* ((signed (cl:slot-value msg 'result)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotTeachMode-response>) istream)
  "Deserializes a message object of type '<RobotTeachMode-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotTeachMode-response>)))
  "Returns string type for a service object of type '<RobotTeachMode-response>"
  "sr_robot_msgs/RobotTeachModeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotTeachMode-response)))
  "Returns string type for a service object of type 'RobotTeachMode-response"
  "sr_robot_msgs/RobotTeachModeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotTeachMode-response>)))
  "Returns md5sum for a message object of type '<RobotTeachMode-response>"
  "c6613d1d4bc3ca4c55986e93b2eaff93")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotTeachMode-response)))
  "Returns md5sum for a message object of type 'RobotTeachMode-response"
  "c6613d1d4bc3ca4c55986e93b2eaff93")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotTeachMode-response>)))
  "Returns full string definition for message of type '<RobotTeachMode-response>"
  (cl:format cl:nil "~%int32 ERROR=-1~%int32 SUCCESS=0~%~%~%int32 result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotTeachMode-response)))
  "Returns full string definition for message of type 'RobotTeachMode-response"
  (cl:format cl:nil "~%int32 ERROR=-1~%int32 SUCCESS=0~%~%~%int32 result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotTeachMode-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotTeachMode-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotTeachMode-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RobotTeachMode)))
  'RobotTeachMode-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RobotTeachMode)))
  'RobotTeachMode-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotTeachMode)))
  "Returns string type for a service object of type '<RobotTeachMode>"
  "sr_robot_msgs/RobotTeachMode")