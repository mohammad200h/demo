; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude ExecutePlannedTrajectory-request.msg.html

(cl:defclass <ExecutePlannedTrajectory-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ExecutePlannedTrajectory-request (<ExecutePlannedTrajectory-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecutePlannedTrajectory-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecutePlannedTrajectory-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<ExecutePlannedTrajectory-request> is deprecated: use sr_robot_msgs-srv:ExecutePlannedTrajectory-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecutePlannedTrajectory-request>) ostream)
  "Serializes a message object of type '<ExecutePlannedTrajectory-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecutePlannedTrajectory-request>) istream)
  "Deserializes a message object of type '<ExecutePlannedTrajectory-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExecutePlannedTrajectory-request>)))
  "Returns string type for a service object of type '<ExecutePlannedTrajectory-request>"
  "sr_robot_msgs/ExecutePlannedTrajectoryRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecutePlannedTrajectory-request)))
  "Returns string type for a service object of type 'ExecutePlannedTrajectory-request"
  "sr_robot_msgs/ExecutePlannedTrajectoryRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExecutePlannedTrajectory-request>)))
  "Returns md5sum for a message object of type '<ExecutePlannedTrajectory-request>"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecutePlannedTrajectory-request)))
  "Returns md5sum for a message object of type 'ExecutePlannedTrajectory-request"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecutePlannedTrajectory-request>)))
  "Returns full string definition for message of type '<ExecutePlannedTrajectory-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecutePlannedTrajectory-request)))
  "Returns full string definition for message of type 'ExecutePlannedTrajectory-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecutePlannedTrajectory-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecutePlannedTrajectory-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecutePlannedTrajectory-request
))
;//! \htmlinclude ExecutePlannedTrajectory-response.msg.html

(cl:defclass <ExecutePlannedTrajectory-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ExecutePlannedTrajectory-response (<ExecutePlannedTrajectory-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecutePlannedTrajectory-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecutePlannedTrajectory-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<ExecutePlannedTrajectory-response> is deprecated: use sr_robot_msgs-srv:ExecutePlannedTrajectory-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ExecutePlannedTrajectory-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:success-val is deprecated.  Use sr_robot_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecutePlannedTrajectory-response>) ostream)
  "Serializes a message object of type '<ExecutePlannedTrajectory-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecutePlannedTrajectory-response>) istream)
  "Deserializes a message object of type '<ExecutePlannedTrajectory-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExecutePlannedTrajectory-response>)))
  "Returns string type for a service object of type '<ExecutePlannedTrajectory-response>"
  "sr_robot_msgs/ExecutePlannedTrajectoryResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecutePlannedTrajectory-response)))
  "Returns string type for a service object of type 'ExecutePlannedTrajectory-response"
  "sr_robot_msgs/ExecutePlannedTrajectoryResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExecutePlannedTrajectory-response>)))
  "Returns md5sum for a message object of type '<ExecutePlannedTrajectory-response>"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecutePlannedTrajectory-response)))
  "Returns md5sum for a message object of type 'ExecutePlannedTrajectory-response"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecutePlannedTrajectory-response>)))
  "Returns full string definition for message of type '<ExecutePlannedTrajectory-response>"
  (cl:format cl:nil "~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecutePlannedTrajectory-response)))
  "Returns full string definition for message of type 'ExecutePlannedTrajectory-response"
  (cl:format cl:nil "~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecutePlannedTrajectory-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecutePlannedTrajectory-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecutePlannedTrajectory-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ExecutePlannedTrajectory)))
  'ExecutePlannedTrajectory-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ExecutePlannedTrajectory)))
  'ExecutePlannedTrajectory-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecutePlannedTrajectory)))
  "Returns string type for a service object of type '<ExecutePlannedTrajectory>"
  "sr_robot_msgs/ExecutePlannedTrajectory")