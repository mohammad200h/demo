; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude is_hand_occupied-request.msg.html

(cl:defclass <is_hand_occupied-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass is_hand_occupied-request (<is_hand_occupied-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <is_hand_occupied-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'is_hand_occupied-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<is_hand_occupied-request> is deprecated: use sr_robot_msgs-srv:is_hand_occupied-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <is_hand_occupied-request>) ostream)
  "Serializes a message object of type '<is_hand_occupied-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <is_hand_occupied-request>) istream)
  "Deserializes a message object of type '<is_hand_occupied-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<is_hand_occupied-request>)))
  "Returns string type for a service object of type '<is_hand_occupied-request>"
  "sr_robot_msgs/is_hand_occupiedRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'is_hand_occupied-request)))
  "Returns string type for a service object of type 'is_hand_occupied-request"
  "sr_robot_msgs/is_hand_occupiedRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<is_hand_occupied-request>)))
  "Returns md5sum for a message object of type '<is_hand_occupied-request>"
  "62624a9d19535f7a135d1ce1fc0d0450")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'is_hand_occupied-request)))
  "Returns md5sum for a message object of type 'is_hand_occupied-request"
  "62624a9d19535f7a135d1ce1fc0d0450")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<is_hand_occupied-request>)))
  "Returns full string definition for message of type '<is_hand_occupied-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'is_hand_occupied-request)))
  "Returns full string definition for message of type 'is_hand_occupied-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <is_hand_occupied-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <is_hand_occupied-request>))
  "Converts a ROS message object to a list"
  (cl:list 'is_hand_occupied-request
))
;//! \htmlinclude is_hand_occupied-response.msg.html

(cl:defclass <is_hand_occupied-response> (roslisp-msg-protocol:ros-message)
  ((hand_occupied
    :reader hand_occupied
    :initarg :hand_occupied
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass is_hand_occupied-response (<is_hand_occupied-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <is_hand_occupied-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'is_hand_occupied-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<is_hand_occupied-response> is deprecated: use sr_robot_msgs-srv:is_hand_occupied-response instead.")))

(cl:ensure-generic-function 'hand_occupied-val :lambda-list '(m))
(cl:defmethod hand_occupied-val ((m <is_hand_occupied-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:hand_occupied-val is deprecated.  Use sr_robot_msgs-srv:hand_occupied instead.")
  (hand_occupied m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <is_hand_occupied-response>) ostream)
  "Serializes a message object of type '<is_hand_occupied-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'hand_occupied) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <is_hand_occupied-response>) istream)
  "Deserializes a message object of type '<is_hand_occupied-response>"
    (cl:setf (cl:slot-value msg 'hand_occupied) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<is_hand_occupied-response>)))
  "Returns string type for a service object of type '<is_hand_occupied-response>"
  "sr_robot_msgs/is_hand_occupiedResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'is_hand_occupied-response)))
  "Returns string type for a service object of type 'is_hand_occupied-response"
  "sr_robot_msgs/is_hand_occupiedResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<is_hand_occupied-response>)))
  "Returns md5sum for a message object of type '<is_hand_occupied-response>"
  "62624a9d19535f7a135d1ce1fc0d0450")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'is_hand_occupied-response)))
  "Returns md5sum for a message object of type 'is_hand_occupied-response"
  "62624a9d19535f7a135d1ce1fc0d0450")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<is_hand_occupied-response>)))
  "Returns full string definition for message of type '<is_hand_occupied-response>"
  (cl:format cl:nil "bool hand_occupied~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'is_hand_occupied-response)))
  "Returns full string definition for message of type 'is_hand_occupied-response"
  (cl:format cl:nil "bool hand_occupied~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <is_hand_occupied-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <is_hand_occupied-response>))
  "Converts a ROS message object to a list"
  (cl:list 'is_hand_occupied-response
    (cl:cons ':hand_occupied (hand_occupied msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'is_hand_occupied)))
  'is_hand_occupied-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'is_hand_occupied)))
  'is_hand_occupied-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'is_hand_occupied)))
  "Returns string type for a service object of type '<is_hand_occupied>"
  "sr_robot_msgs/is_hand_occupied")