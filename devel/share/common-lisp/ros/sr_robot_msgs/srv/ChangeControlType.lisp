; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude ChangeControlType-request.msg.html

(cl:defclass <ChangeControlType-request> (roslisp-msg-protocol:ros-message)
  ((control_type
    :reader control_type
    :initarg :control_type
    :type sr_robot_msgs-msg:ControlType
    :initform (cl:make-instance 'sr_robot_msgs-msg:ControlType)))
)

(cl:defclass ChangeControlType-request (<ChangeControlType-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChangeControlType-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChangeControlType-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<ChangeControlType-request> is deprecated: use sr_robot_msgs-srv:ChangeControlType-request instead.")))

(cl:ensure-generic-function 'control_type-val :lambda-list '(m))
(cl:defmethod control_type-val ((m <ChangeControlType-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:control_type-val is deprecated.  Use sr_robot_msgs-srv:control_type instead.")
  (control_type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChangeControlType-request>) ostream)
  "Serializes a message object of type '<ChangeControlType-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'control_type) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChangeControlType-request>) istream)
  "Deserializes a message object of type '<ChangeControlType-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'control_type) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChangeControlType-request>)))
  "Returns string type for a service object of type '<ChangeControlType-request>"
  "sr_robot_msgs/ChangeControlTypeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeControlType-request)))
  "Returns string type for a service object of type 'ChangeControlType-request"
  "sr_robot_msgs/ChangeControlTypeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChangeControlType-request>)))
  "Returns md5sum for a message object of type '<ChangeControlType-request>"
  "14cedf5030b722e2c8df2dc57f9cdb58")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChangeControlType-request)))
  "Returns md5sum for a message object of type 'ChangeControlType-request"
  "14cedf5030b722e2c8df2dc57f9cdb58")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChangeControlType-request>)))
  "Returns full string definition for message of type '<ChangeControlType-request>"
  (cl:format cl:nil "ControlType control_type~%~%================================================================================~%MSG: sr_robot_msgs/ControlType~%int16 control_type~%~%int16 PWM=0~%int16 FORCE=1~%~%#used to query which control type we're using. won't change the control type~%int16 QUERY=-1~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChangeControlType-request)))
  "Returns full string definition for message of type 'ChangeControlType-request"
  (cl:format cl:nil "ControlType control_type~%~%================================================================================~%MSG: sr_robot_msgs/ControlType~%int16 control_type~%~%int16 PWM=0~%int16 FORCE=1~%~%#used to query which control type we're using. won't change the control type~%int16 QUERY=-1~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChangeControlType-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'control_type))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChangeControlType-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ChangeControlType-request
    (cl:cons ':control_type (control_type msg))
))
;//! \htmlinclude ChangeControlType-response.msg.html

(cl:defclass <ChangeControlType-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type sr_robot_msgs-msg:ControlType
    :initform (cl:make-instance 'sr_robot_msgs-msg:ControlType)))
)

(cl:defclass ChangeControlType-response (<ChangeControlType-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChangeControlType-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChangeControlType-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<ChangeControlType-response> is deprecated: use sr_robot_msgs-srv:ChangeControlType-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <ChangeControlType-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:result-val is deprecated.  Use sr_robot_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChangeControlType-response>) ostream)
  "Serializes a message object of type '<ChangeControlType-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'result) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChangeControlType-response>) istream)
  "Deserializes a message object of type '<ChangeControlType-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'result) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChangeControlType-response>)))
  "Returns string type for a service object of type '<ChangeControlType-response>"
  "sr_robot_msgs/ChangeControlTypeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeControlType-response)))
  "Returns string type for a service object of type 'ChangeControlType-response"
  "sr_robot_msgs/ChangeControlTypeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChangeControlType-response>)))
  "Returns md5sum for a message object of type '<ChangeControlType-response>"
  "14cedf5030b722e2c8df2dc57f9cdb58")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChangeControlType-response)))
  "Returns md5sum for a message object of type 'ChangeControlType-response"
  "14cedf5030b722e2c8df2dc57f9cdb58")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChangeControlType-response>)))
  "Returns full string definition for message of type '<ChangeControlType-response>"
  (cl:format cl:nil "ControlType result~%~%================================================================================~%MSG: sr_robot_msgs/ControlType~%int16 control_type~%~%int16 PWM=0~%int16 FORCE=1~%~%#used to query which control type we're using. won't change the control type~%int16 QUERY=-1~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChangeControlType-response)))
  "Returns full string definition for message of type 'ChangeControlType-response"
  (cl:format cl:nil "ControlType result~%~%================================================================================~%MSG: sr_robot_msgs/ControlType~%int16 control_type~%~%int16 PWM=0~%int16 FORCE=1~%~%#used to query which control type we're using. won't change the control type~%int16 QUERY=-1~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChangeControlType-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChangeControlType-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ChangeControlType-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ChangeControlType)))
  'ChangeControlType-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ChangeControlType)))
  'ChangeControlType-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeControlType)))
  "Returns string type for a service object of type '<ChangeControlType>"
  "sr_robot_msgs/ChangeControlType")