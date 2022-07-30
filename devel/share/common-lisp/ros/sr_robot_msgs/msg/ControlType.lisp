; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude ControlType.msg.html

(cl:defclass <ControlType> (roslisp-msg-protocol:ros-message)
  ((control_type
    :reader control_type
    :initarg :control_type
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ControlType (<ControlType>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ControlType>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ControlType)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<ControlType> is deprecated: use sr_robot_msgs-msg:ControlType instead.")))

(cl:ensure-generic-function 'control_type-val :lambda-list '(m))
(cl:defmethod control_type-val ((m <ControlType>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:control_type-val is deprecated.  Use sr_robot_msgs-msg:control_type instead.")
  (control_type m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ControlType>)))
    "Constants for message type '<ControlType>"
  '((:PWM . 0)
    (:FORCE . 1)
    (:QUERY . -1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ControlType)))
    "Constants for message type 'ControlType"
  '((:PWM . 0)
    (:FORCE . 1)
    (:QUERY . -1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ControlType>) ostream)
  "Serializes a message object of type '<ControlType>"
  (cl:let* ((signed (cl:slot-value msg 'control_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ControlType>) istream)
  "Deserializes a message object of type '<ControlType>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'control_type) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ControlType>)))
  "Returns string type for a message object of type '<ControlType>"
  "sr_robot_msgs/ControlType")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControlType)))
  "Returns string type for a message object of type 'ControlType"
  "sr_robot_msgs/ControlType")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ControlType>)))
  "Returns md5sum for a message object of type '<ControlType>"
  "b998c8b3b8aa0f2f53f0eaa45ee462bd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ControlType)))
  "Returns md5sum for a message object of type 'ControlType"
  "b998c8b3b8aa0f2f53f0eaa45ee462bd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ControlType>)))
  "Returns full string definition for message of type '<ControlType>"
  (cl:format cl:nil "int16 control_type~%~%int16 PWM=0~%int16 FORCE=1~%~%#used to query which control type we're using. won't change the control type~%int16 QUERY=-1~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ControlType)))
  "Returns full string definition for message of type 'ControlType"
  (cl:format cl:nil "int16 control_type~%~%int16 PWM=0~%int16 FORCE=1~%~%#used to query which control type we're using. won't change the control type~%int16 QUERY=-1~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ControlType>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ControlType>))
  "Converts a ROS message object to a list"
  (cl:list 'ControlType
    (cl:cons ':control_type (control_type msg))
))
