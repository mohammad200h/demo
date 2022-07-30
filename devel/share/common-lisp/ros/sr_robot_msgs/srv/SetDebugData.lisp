; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude SetDebugData-request.msg.html

(cl:defclass <SetDebugData-request> (roslisp-msg-protocol:ros-message)
  ((motor_index
    :reader motor_index
    :initarg :motor_index
    :type cl:fixnum
    :initform 0)
   (motor_data_type
    :reader motor_data_type
    :initarg :motor_data_type
    :type cl:fixnum
    :initform 0)
   (publisher_index
    :reader publisher_index
    :initarg :publisher_index
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SetDebugData-request (<SetDebugData-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetDebugData-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetDebugData-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<SetDebugData-request> is deprecated: use sr_robot_msgs-srv:SetDebugData-request instead.")))

(cl:ensure-generic-function 'motor_index-val :lambda-list '(m))
(cl:defmethod motor_index-val ((m <SetDebugData-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:motor_index-val is deprecated.  Use sr_robot_msgs-srv:motor_index instead.")
  (motor_index m))

(cl:ensure-generic-function 'motor_data_type-val :lambda-list '(m))
(cl:defmethod motor_data_type-val ((m <SetDebugData-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:motor_data_type-val is deprecated.  Use sr_robot_msgs-srv:motor_data_type instead.")
  (motor_data_type m))

(cl:ensure-generic-function 'publisher_index-val :lambda-list '(m))
(cl:defmethod publisher_index-val ((m <SetDebugData-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:publisher_index-val is deprecated.  Use sr_robot_msgs-srv:publisher_index instead.")
  (publisher_index m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetDebugData-request>) ostream)
  "Serializes a message object of type '<SetDebugData-request>"
  (cl:let* ((signed (cl:slot-value msg 'motor_index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'motor_data_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'publisher_index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetDebugData-request>) istream)
  "Deserializes a message object of type '<SetDebugData-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'motor_index) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'motor_data_type) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'publisher_index) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetDebugData-request>)))
  "Returns string type for a service object of type '<SetDebugData-request>"
  "sr_robot_msgs/SetDebugDataRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetDebugData-request)))
  "Returns string type for a service object of type 'SetDebugData-request"
  "sr_robot_msgs/SetDebugDataRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetDebugData-request>)))
  "Returns md5sum for a message object of type '<SetDebugData-request>"
  "7e92428f248882f525037fe3b24dbbf1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetDebugData-request)))
  "Returns md5sum for a message object of type 'SetDebugData-request"
  "7e92428f248882f525037fe3b24dbbf1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetDebugData-request>)))
  "Returns full string definition for message of type '<SetDebugData-request>"
  (cl:format cl:nil "~%~%~%~%int16 motor_index~%int16 motor_data_type~%int16 publisher_index~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetDebugData-request)))
  "Returns full string definition for message of type 'SetDebugData-request"
  (cl:format cl:nil "~%~%~%~%int16 motor_index~%int16 motor_data_type~%int16 publisher_index~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetDebugData-request>))
  (cl:+ 0
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetDebugData-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetDebugData-request
    (cl:cons ':motor_index (motor_index msg))
    (cl:cons ':motor_data_type (motor_data_type msg))
    (cl:cons ':publisher_index (publisher_index msg))
))
;//! \htmlinclude SetDebugData-response.msg.html

(cl:defclass <SetDebugData-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetDebugData-response (<SetDebugData-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetDebugData-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetDebugData-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<SetDebugData-response> is deprecated: use sr_robot_msgs-srv:SetDebugData-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetDebugData-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:success-val is deprecated.  Use sr_robot_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetDebugData-response>) ostream)
  "Serializes a message object of type '<SetDebugData-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetDebugData-response>) istream)
  "Deserializes a message object of type '<SetDebugData-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetDebugData-response>)))
  "Returns string type for a service object of type '<SetDebugData-response>"
  "sr_robot_msgs/SetDebugDataResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetDebugData-response)))
  "Returns string type for a service object of type 'SetDebugData-response"
  "sr_robot_msgs/SetDebugDataResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetDebugData-response>)))
  "Returns md5sum for a message object of type '<SetDebugData-response>"
  "7e92428f248882f525037fe3b24dbbf1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetDebugData-response)))
  "Returns md5sum for a message object of type 'SetDebugData-response"
  "7e92428f248882f525037fe3b24dbbf1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetDebugData-response>)))
  "Returns full string definition for message of type '<SetDebugData-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetDebugData-response)))
  "Returns full string definition for message of type 'SetDebugData-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetDebugData-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetDebugData-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetDebugData-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetDebugData)))
  'SetDebugData-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetDebugData)))
  'SetDebugData-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetDebugData)))
  "Returns string type for a service object of type '<SetDebugData>"
  "sr_robot_msgs/SetDebugData")