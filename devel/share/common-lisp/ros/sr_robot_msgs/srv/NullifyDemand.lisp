; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude NullifyDemand-request.msg.html

(cl:defclass <NullifyDemand-request> (roslisp-msg-protocol:ros-message)
  ((nullify_demand
    :reader nullify_demand
    :initarg :nullify_demand
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass NullifyDemand-request (<NullifyDemand-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NullifyDemand-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NullifyDemand-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<NullifyDemand-request> is deprecated: use sr_robot_msgs-srv:NullifyDemand-request instead.")))

(cl:ensure-generic-function 'nullify_demand-val :lambda-list '(m))
(cl:defmethod nullify_demand-val ((m <NullifyDemand-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:nullify_demand-val is deprecated.  Use sr_robot_msgs-srv:nullify_demand instead.")
  (nullify_demand m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NullifyDemand-request>) ostream)
  "Serializes a message object of type '<NullifyDemand-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'nullify_demand) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NullifyDemand-request>) istream)
  "Deserializes a message object of type '<NullifyDemand-request>"
    (cl:setf (cl:slot-value msg 'nullify_demand) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NullifyDemand-request>)))
  "Returns string type for a service object of type '<NullifyDemand-request>"
  "sr_robot_msgs/NullifyDemandRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NullifyDemand-request)))
  "Returns string type for a service object of type 'NullifyDemand-request"
  "sr_robot_msgs/NullifyDemandRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NullifyDemand-request>)))
  "Returns md5sum for a message object of type '<NullifyDemand-request>"
  "e776288d81b4da212263a7a8b3f035b3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NullifyDemand-request)))
  "Returns md5sum for a message object of type 'NullifyDemand-request"
  "e776288d81b4da212263a7a8b3f035b3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NullifyDemand-request>)))
  "Returns full string definition for message of type '<NullifyDemand-request>"
  (cl:format cl:nil "~%~%~%~%~%bool nullify_demand~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NullifyDemand-request)))
  "Returns full string definition for message of type 'NullifyDemand-request"
  (cl:format cl:nil "~%~%~%~%~%bool nullify_demand~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NullifyDemand-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NullifyDemand-request>))
  "Converts a ROS message object to a list"
  (cl:list 'NullifyDemand-request
    (cl:cons ':nullify_demand (nullify_demand msg))
))
;//! \htmlinclude NullifyDemand-response.msg.html

(cl:defclass <NullifyDemand-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass NullifyDemand-response (<NullifyDemand-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NullifyDemand-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NullifyDemand-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<NullifyDemand-response> is deprecated: use sr_robot_msgs-srv:NullifyDemand-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NullifyDemand-response>) ostream)
  "Serializes a message object of type '<NullifyDemand-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NullifyDemand-response>) istream)
  "Deserializes a message object of type '<NullifyDemand-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NullifyDemand-response>)))
  "Returns string type for a service object of type '<NullifyDemand-response>"
  "sr_robot_msgs/NullifyDemandResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NullifyDemand-response)))
  "Returns string type for a service object of type 'NullifyDemand-response"
  "sr_robot_msgs/NullifyDemandResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NullifyDemand-response>)))
  "Returns md5sum for a message object of type '<NullifyDemand-response>"
  "e776288d81b4da212263a7a8b3f035b3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NullifyDemand-response)))
  "Returns md5sum for a message object of type 'NullifyDemand-response"
  "e776288d81b4da212263a7a8b3f035b3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NullifyDemand-response>)))
  "Returns full string definition for message of type '<NullifyDemand-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NullifyDemand-response)))
  "Returns full string definition for message of type 'NullifyDemand-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NullifyDemand-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NullifyDemand-response>))
  "Converts a ROS message object to a list"
  (cl:list 'NullifyDemand-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'NullifyDemand)))
  'NullifyDemand-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'NullifyDemand)))
  'NullifyDemand-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NullifyDemand)))
  "Returns string type for a service object of type '<NullifyDemand>"
  "sr_robot_msgs/NullifyDemand")