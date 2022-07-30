; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude SetTeachMode-request.msg.html

(cl:defclass <SetTeachMode-request> (roslisp-msg-protocol:ros-message)
  ((teach_mode
    :reader teach_mode
    :initarg :teach_mode
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetTeachMode-request (<SetTeachMode-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetTeachMode-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetTeachMode-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<SetTeachMode-request> is deprecated: use sr_robot_msgs-srv:SetTeachMode-request instead.")))

(cl:ensure-generic-function 'teach_mode-val :lambda-list '(m))
(cl:defmethod teach_mode-val ((m <SetTeachMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:teach_mode-val is deprecated.  Use sr_robot_msgs-srv:teach_mode instead.")
  (teach_mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetTeachMode-request>) ostream)
  "Serializes a message object of type '<SetTeachMode-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'teach_mode) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetTeachMode-request>) istream)
  "Deserializes a message object of type '<SetTeachMode-request>"
    (cl:setf (cl:slot-value msg 'teach_mode) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetTeachMode-request>)))
  "Returns string type for a service object of type '<SetTeachMode-request>"
  "sr_robot_msgs/SetTeachModeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetTeachMode-request)))
  "Returns string type for a service object of type 'SetTeachMode-request"
  "sr_robot_msgs/SetTeachModeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetTeachMode-request>)))
  "Returns md5sum for a message object of type '<SetTeachMode-request>"
  "f1d4dfab21529bcec06249bcf0db7d58")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetTeachMode-request)))
  "Returns md5sum for a message object of type 'SetTeachMode-request"
  "f1d4dfab21529bcec06249bcf0db7d58")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetTeachMode-request>)))
  "Returns full string definition for message of type '<SetTeachMode-request>"
  (cl:format cl:nil "bool teach_mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetTeachMode-request)))
  "Returns full string definition for message of type 'SetTeachMode-request"
  (cl:format cl:nil "bool teach_mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetTeachMode-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetTeachMode-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetTeachMode-request
    (cl:cons ':teach_mode (teach_mode msg))
))
;//! \htmlinclude SetTeachMode-response.msg.html

(cl:defclass <SetTeachMode-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetTeachMode-response (<SetTeachMode-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetTeachMode-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetTeachMode-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<SetTeachMode-response> is deprecated: use sr_robot_msgs-srv:SetTeachMode-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetTeachMode-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:success-val is deprecated.  Use sr_robot_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetTeachMode-response>) ostream)
  "Serializes a message object of type '<SetTeachMode-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetTeachMode-response>) istream)
  "Deserializes a message object of type '<SetTeachMode-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetTeachMode-response>)))
  "Returns string type for a service object of type '<SetTeachMode-response>"
  "sr_robot_msgs/SetTeachModeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetTeachMode-response)))
  "Returns string type for a service object of type 'SetTeachMode-response"
  "sr_robot_msgs/SetTeachModeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetTeachMode-response>)))
  "Returns md5sum for a message object of type '<SetTeachMode-response>"
  "f1d4dfab21529bcec06249bcf0db7d58")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetTeachMode-response)))
  "Returns md5sum for a message object of type 'SetTeachMode-response"
  "f1d4dfab21529bcec06249bcf0db7d58")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetTeachMode-response>)))
  "Returns full string definition for message of type '<SetTeachMode-response>"
  (cl:format cl:nil "bool success~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetTeachMode-response)))
  "Returns full string definition for message of type 'SetTeachMode-response"
  (cl:format cl:nil "bool success~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetTeachMode-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetTeachMode-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetTeachMode-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetTeachMode)))
  'SetTeachMode-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetTeachMode)))
  'SetTeachMode-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetTeachMode)))
  "Returns string type for a service object of type '<SetTeachMode>"
  "sr_robot_msgs/SetTeachMode")