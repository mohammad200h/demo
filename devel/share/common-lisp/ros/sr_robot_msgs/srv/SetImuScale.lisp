; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude SetImuScale-request.msg.html

(cl:defclass <SetImuScale-request> (roslisp-msg-protocol:ros-message)
  ((scale
    :reader scale
    :initarg :scale
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SetImuScale-request (<SetImuScale-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetImuScale-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetImuScale-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<SetImuScale-request> is deprecated: use sr_robot_msgs-srv:SetImuScale-request instead.")))

(cl:ensure-generic-function 'scale-val :lambda-list '(m))
(cl:defmethod scale-val ((m <SetImuScale-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:scale-val is deprecated.  Use sr_robot_msgs-srv:scale instead.")
  (scale m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetImuScale-request>) ostream)
  "Serializes a message object of type '<SetImuScale-request>"
  (cl:let* ((signed (cl:slot-value msg 'scale)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetImuScale-request>) istream)
  "Deserializes a message object of type '<SetImuScale-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'scale) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetImuScale-request>)))
  "Returns string type for a service object of type '<SetImuScale-request>"
  "sr_robot_msgs/SetImuScaleRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetImuScale-request)))
  "Returns string type for a service object of type 'SetImuScale-request"
  "sr_robot_msgs/SetImuScaleRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetImuScale-request>)))
  "Returns md5sum for a message object of type '<SetImuScale-request>"
  "f39b7f810a4fc89f40be566bb3e21265")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetImuScale-request)))
  "Returns md5sum for a message object of type 'SetImuScale-request"
  "f39b7f810a4fc89f40be566bb3e21265")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetImuScale-request>)))
  "Returns full string definition for message of type '<SetImuScale-request>"
  (cl:format cl:nil "int8 scale~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetImuScale-request)))
  "Returns full string definition for message of type 'SetImuScale-request"
  (cl:format cl:nil "int8 scale~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetImuScale-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetImuScale-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetImuScale-request
    (cl:cons ':scale (scale msg))
))
;//! \htmlinclude SetImuScale-response.msg.html

(cl:defclass <SetImuScale-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetImuScale-response (<SetImuScale-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetImuScale-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetImuScale-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<SetImuScale-response> is deprecated: use sr_robot_msgs-srv:SetImuScale-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetImuScale-response>) ostream)
  "Serializes a message object of type '<SetImuScale-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetImuScale-response>) istream)
  "Deserializes a message object of type '<SetImuScale-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetImuScale-response>)))
  "Returns string type for a service object of type '<SetImuScale-response>"
  "sr_robot_msgs/SetImuScaleResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetImuScale-response)))
  "Returns string type for a service object of type 'SetImuScale-response"
  "sr_robot_msgs/SetImuScaleResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetImuScale-response>)))
  "Returns md5sum for a message object of type '<SetImuScale-response>"
  "f39b7f810a4fc89f40be566bb3e21265")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetImuScale-response)))
  "Returns md5sum for a message object of type 'SetImuScale-response"
  "f39b7f810a4fc89f40be566bb3e21265")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetImuScale-response>)))
  "Returns full string definition for message of type '<SetImuScale-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetImuScale-response)))
  "Returns full string definition for message of type 'SetImuScale-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetImuScale-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetImuScale-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetImuScale-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetImuScale)))
  'SetImuScale-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetImuScale)))
  'SetImuScale-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetImuScale)))
  "Returns string type for a service object of type '<SetImuScale>"
  "sr_robot_msgs/SetImuScale")