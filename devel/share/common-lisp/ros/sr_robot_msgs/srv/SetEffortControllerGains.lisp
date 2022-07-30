; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude SetEffortControllerGains-request.msg.html

(cl:defclass <SetEffortControllerGains-request> (roslisp-msg-protocol:ros-message)
  ((max_force
    :reader max_force
    :initarg :max_force
    :type cl:float
    :initform 0.0)
   (friction_deadband
    :reader friction_deadband
    :initarg :friction_deadband
    :type cl:integer
    :initform 0))
)

(cl:defclass SetEffortControllerGains-request (<SetEffortControllerGains-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetEffortControllerGains-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetEffortControllerGains-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<SetEffortControllerGains-request> is deprecated: use sr_robot_msgs-srv:SetEffortControllerGains-request instead.")))

(cl:ensure-generic-function 'max_force-val :lambda-list '(m))
(cl:defmethod max_force-val ((m <SetEffortControllerGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:max_force-val is deprecated.  Use sr_robot_msgs-srv:max_force instead.")
  (max_force m))

(cl:ensure-generic-function 'friction_deadband-val :lambda-list '(m))
(cl:defmethod friction_deadband-val ((m <SetEffortControllerGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:friction_deadband-val is deprecated.  Use sr_robot_msgs-srv:friction_deadband instead.")
  (friction_deadband m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetEffortControllerGains-request>) ostream)
  "Serializes a message object of type '<SetEffortControllerGains-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'max_force))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'friction_deadband)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetEffortControllerGains-request>) istream)
  "Deserializes a message object of type '<SetEffortControllerGains-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_force) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'friction_deadband) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetEffortControllerGains-request>)))
  "Returns string type for a service object of type '<SetEffortControllerGains-request>"
  "sr_robot_msgs/SetEffortControllerGainsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetEffortControllerGains-request)))
  "Returns string type for a service object of type 'SetEffortControllerGains-request"
  "sr_robot_msgs/SetEffortControllerGainsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetEffortControllerGains-request>)))
  "Returns md5sum for a message object of type '<SetEffortControllerGains-request>"
  "96397d148b84b1d0a8fe84ee1744fece")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetEffortControllerGains-request)))
  "Returns md5sum for a message object of type 'SetEffortControllerGains-request"
  "96397d148b84b1d0a8fe84ee1744fece")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetEffortControllerGains-request>)))
  "Returns full string definition for message of type '<SetEffortControllerGains-request>"
  (cl:format cl:nil "float64 max_force~%int32 friction_deadband~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetEffortControllerGains-request)))
  "Returns full string definition for message of type 'SetEffortControllerGains-request"
  (cl:format cl:nil "float64 max_force~%int32 friction_deadband~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetEffortControllerGains-request>))
  (cl:+ 0
     8
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetEffortControllerGains-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetEffortControllerGains-request
    (cl:cons ':max_force (max_force msg))
    (cl:cons ':friction_deadband (friction_deadband msg))
))
;//! \htmlinclude SetEffortControllerGains-response.msg.html

(cl:defclass <SetEffortControllerGains-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetEffortControllerGains-response (<SetEffortControllerGains-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetEffortControllerGains-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetEffortControllerGains-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<SetEffortControllerGains-response> is deprecated: use sr_robot_msgs-srv:SetEffortControllerGains-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetEffortControllerGains-response>) ostream)
  "Serializes a message object of type '<SetEffortControllerGains-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetEffortControllerGains-response>) istream)
  "Deserializes a message object of type '<SetEffortControllerGains-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetEffortControllerGains-response>)))
  "Returns string type for a service object of type '<SetEffortControllerGains-response>"
  "sr_robot_msgs/SetEffortControllerGainsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetEffortControllerGains-response)))
  "Returns string type for a service object of type 'SetEffortControllerGains-response"
  "sr_robot_msgs/SetEffortControllerGainsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetEffortControllerGains-response>)))
  "Returns md5sum for a message object of type '<SetEffortControllerGains-response>"
  "96397d148b84b1d0a8fe84ee1744fece")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetEffortControllerGains-response)))
  "Returns md5sum for a message object of type 'SetEffortControllerGains-response"
  "96397d148b84b1d0a8fe84ee1744fece")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetEffortControllerGains-response>)))
  "Returns full string definition for message of type '<SetEffortControllerGains-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetEffortControllerGains-response)))
  "Returns full string definition for message of type 'SetEffortControllerGains-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetEffortControllerGains-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetEffortControllerGains-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetEffortControllerGains-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetEffortControllerGains)))
  'SetEffortControllerGains-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetEffortControllerGains)))
  'SetEffortControllerGains-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetEffortControllerGains)))
  "Returns string type for a service object of type '<SetEffortControllerGains>"
  "sr_robot_msgs/SetEffortControllerGains")