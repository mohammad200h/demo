; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude FromMotorDataType.msg.html

(cl:defclass <FromMotorDataType> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:fixnum
    :initform 0))
)

(cl:defclass FromMotorDataType (<FromMotorDataType>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FromMotorDataType>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FromMotorDataType)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<FromMotorDataType> is deprecated: use sr_robot_msgs-msg:FromMotorDataType instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <FromMotorDataType>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:data-val is deprecated.  Use sr_robot_msgs-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FromMotorDataType>) ostream)
  "Serializes a message object of type '<FromMotorDataType>"
  (cl:let* ((signed (cl:slot-value msg 'data)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FromMotorDataType>) istream)
  "Deserializes a message object of type '<FromMotorDataType>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FromMotorDataType>)))
  "Returns string type for a message object of type '<FromMotorDataType>"
  "sr_robot_msgs/FromMotorDataType")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FromMotorDataType)))
  "Returns string type for a message object of type 'FromMotorDataType"
  "sr_robot_msgs/FromMotorDataType")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FromMotorDataType>)))
  "Returns md5sum for a message object of type '<FromMotorDataType>"
  "8524586e34fbd7cb1c08c5f5f1ca0e57")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FromMotorDataType)))
  "Returns md5sum for a message object of type 'FromMotorDataType"
  "8524586e34fbd7cb1c08c5f5f1ca0e57")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FromMotorDataType>)))
  "Returns full string definition for message of type '<FromMotorDataType>"
  (cl:format cl:nil "int16 data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FromMotorDataType)))
  "Returns full string definition for message of type 'FromMotorDataType"
  (cl:format cl:nil "int16 data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FromMotorDataType>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FromMotorDataType>))
  "Converts a ROS message object to a list"
  (cl:list 'FromMotorDataType
    (cl:cons ':data (data msg))
))
