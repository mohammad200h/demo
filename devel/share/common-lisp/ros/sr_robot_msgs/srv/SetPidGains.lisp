; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude SetPidGains-request.msg.html

(cl:defclass <SetPidGains-request> (roslisp-msg-protocol:ros-message)
  ((p
    :reader p
    :initarg :p
    :type cl:float
    :initform 0.0)
   (i
    :reader i
    :initarg :i
    :type cl:float
    :initform 0.0)
   (d
    :reader d
    :initarg :d
    :type cl:float
    :initform 0.0)
   (i_clamp
    :reader i_clamp
    :initarg :i_clamp
    :type cl:float
    :initform 0.0)
   (max_force
    :reader max_force
    :initarg :max_force
    :type cl:float
    :initform 0.0)
   (deadband
    :reader deadband
    :initarg :deadband
    :type cl:float
    :initform 0.0)
   (friction_deadband
    :reader friction_deadband
    :initarg :friction_deadband
    :type cl:integer
    :initform 0))
)

(cl:defclass SetPidGains-request (<SetPidGains-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPidGains-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPidGains-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<SetPidGains-request> is deprecated: use sr_robot_msgs-srv:SetPidGains-request instead.")))

(cl:ensure-generic-function 'p-val :lambda-list '(m))
(cl:defmethod p-val ((m <SetPidGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:p-val is deprecated.  Use sr_robot_msgs-srv:p instead.")
  (p m))

(cl:ensure-generic-function 'i-val :lambda-list '(m))
(cl:defmethod i-val ((m <SetPidGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:i-val is deprecated.  Use sr_robot_msgs-srv:i instead.")
  (i m))

(cl:ensure-generic-function 'd-val :lambda-list '(m))
(cl:defmethod d-val ((m <SetPidGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:d-val is deprecated.  Use sr_robot_msgs-srv:d instead.")
  (d m))

(cl:ensure-generic-function 'i_clamp-val :lambda-list '(m))
(cl:defmethod i_clamp-val ((m <SetPidGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:i_clamp-val is deprecated.  Use sr_robot_msgs-srv:i_clamp instead.")
  (i_clamp m))

(cl:ensure-generic-function 'max_force-val :lambda-list '(m))
(cl:defmethod max_force-val ((m <SetPidGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:max_force-val is deprecated.  Use sr_robot_msgs-srv:max_force instead.")
  (max_force m))

(cl:ensure-generic-function 'deadband-val :lambda-list '(m))
(cl:defmethod deadband-val ((m <SetPidGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:deadband-val is deprecated.  Use sr_robot_msgs-srv:deadband instead.")
  (deadband m))

(cl:ensure-generic-function 'friction_deadband-val :lambda-list '(m))
(cl:defmethod friction_deadband-val ((m <SetPidGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:friction_deadband-val is deprecated.  Use sr_robot_msgs-srv:friction_deadband instead.")
  (friction_deadband m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPidGains-request>) ostream)
  "Serializes a message object of type '<SetPidGains-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'p))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'i))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'i_clamp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'max_force))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'deadband))))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPidGains-request>) istream)
  "Deserializes a message object of type '<SetPidGains-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'p) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'i) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'd) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'i_clamp) (roslisp-utils:decode-double-float-bits bits)))
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'deadband) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'friction_deadband) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPidGains-request>)))
  "Returns string type for a service object of type '<SetPidGains-request>"
  "sr_robot_msgs/SetPidGainsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPidGains-request)))
  "Returns string type for a service object of type 'SetPidGains-request"
  "sr_robot_msgs/SetPidGainsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPidGains-request>)))
  "Returns md5sum for a message object of type '<SetPidGains-request>"
  "f9c5176e998bba30344c4892f975be3a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPidGains-request)))
  "Returns md5sum for a message object of type 'SetPidGains-request"
  "f9c5176e998bba30344c4892f975be3a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPidGains-request>)))
  "Returns full string definition for message of type '<SetPidGains-request>"
  (cl:format cl:nil "float64 p~%float64 i~%float64 d~%float64 i_clamp~%float64 max_force~%float64 deadband~%int32 friction_deadband~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPidGains-request)))
  "Returns full string definition for message of type 'SetPidGains-request"
  (cl:format cl:nil "float64 p~%float64 i~%float64 d~%float64 i_clamp~%float64 max_force~%float64 deadband~%int32 friction_deadband~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPidGains-request>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPidGains-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPidGains-request
    (cl:cons ':p (p msg))
    (cl:cons ':i (i msg))
    (cl:cons ':d (d msg))
    (cl:cons ':i_clamp (i_clamp msg))
    (cl:cons ':max_force (max_force msg))
    (cl:cons ':deadband (deadband msg))
    (cl:cons ':friction_deadband (friction_deadband msg))
))
;//! \htmlinclude SetPidGains-response.msg.html

(cl:defclass <SetPidGains-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetPidGains-response (<SetPidGains-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPidGains-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPidGains-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<SetPidGains-response> is deprecated: use sr_robot_msgs-srv:SetPidGains-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPidGains-response>) ostream)
  "Serializes a message object of type '<SetPidGains-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPidGains-response>) istream)
  "Deserializes a message object of type '<SetPidGains-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPidGains-response>)))
  "Returns string type for a service object of type '<SetPidGains-response>"
  "sr_robot_msgs/SetPidGainsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPidGains-response)))
  "Returns string type for a service object of type 'SetPidGains-response"
  "sr_robot_msgs/SetPidGainsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPidGains-response>)))
  "Returns md5sum for a message object of type '<SetPidGains-response>"
  "f9c5176e998bba30344c4892f975be3a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPidGains-response)))
  "Returns md5sum for a message object of type 'SetPidGains-response"
  "f9c5176e998bba30344c4892f975be3a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPidGains-response>)))
  "Returns full string definition for message of type '<SetPidGains-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPidGains-response)))
  "Returns full string definition for message of type 'SetPidGains-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPidGains-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPidGains-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPidGains-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetPidGains)))
  'SetPidGains-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetPidGains)))
  'SetPidGains-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPidGains)))
  "Returns string type for a service object of type '<SetPidGains>"
  "sr_robot_msgs/SetPidGains")