; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude PlanNamedTrajectory-request.msg.html

(cl:defclass <PlanNamedTrajectory-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass PlanNamedTrajectory-request (<PlanNamedTrajectory-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlanNamedTrajectory-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlanNamedTrajectory-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<PlanNamedTrajectory-request> is deprecated: use sr_robot_msgs-srv:PlanNamedTrajectory-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <PlanNamedTrajectory-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:name-val is deprecated.  Use sr_robot_msgs-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlanNamedTrajectory-request>) ostream)
  "Serializes a message object of type '<PlanNamedTrajectory-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlanNamedTrajectory-request>) istream)
  "Deserializes a message object of type '<PlanNamedTrajectory-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlanNamedTrajectory-request>)))
  "Returns string type for a service object of type '<PlanNamedTrajectory-request>"
  "sr_robot_msgs/PlanNamedTrajectoryRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlanNamedTrajectory-request)))
  "Returns string type for a service object of type 'PlanNamedTrajectory-request"
  "sr_robot_msgs/PlanNamedTrajectoryRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlanNamedTrajectory-request>)))
  "Returns md5sum for a message object of type '<PlanNamedTrajectory-request>"
  "d08a3b641c2f8680fbdfb1ea2e17a3e1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlanNamedTrajectory-request)))
  "Returns md5sum for a message object of type 'PlanNamedTrajectory-request"
  "d08a3b641c2f8680fbdfb1ea2e17a3e1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlanNamedTrajectory-request>)))
  "Returns full string definition for message of type '<PlanNamedTrajectory-request>"
  (cl:format cl:nil "string name~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlanNamedTrajectory-request)))
  "Returns full string definition for message of type 'PlanNamedTrajectory-request"
  (cl:format cl:nil "string name~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlanNamedTrajectory-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlanNamedTrajectory-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PlanNamedTrajectory-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude PlanNamedTrajectory-response.msg.html

(cl:defclass <PlanNamedTrajectory-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PlanNamedTrajectory-response (<PlanNamedTrajectory-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlanNamedTrajectory-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlanNamedTrajectory-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<PlanNamedTrajectory-response> is deprecated: use sr_robot_msgs-srv:PlanNamedTrajectory-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <PlanNamedTrajectory-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:success-val is deprecated.  Use sr_robot_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlanNamedTrajectory-response>) ostream)
  "Serializes a message object of type '<PlanNamedTrajectory-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlanNamedTrajectory-response>) istream)
  "Deserializes a message object of type '<PlanNamedTrajectory-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlanNamedTrajectory-response>)))
  "Returns string type for a service object of type '<PlanNamedTrajectory-response>"
  "sr_robot_msgs/PlanNamedTrajectoryResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlanNamedTrajectory-response)))
  "Returns string type for a service object of type 'PlanNamedTrajectory-response"
  "sr_robot_msgs/PlanNamedTrajectoryResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlanNamedTrajectory-response>)))
  "Returns md5sum for a message object of type '<PlanNamedTrajectory-response>"
  "d08a3b641c2f8680fbdfb1ea2e17a3e1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlanNamedTrajectory-response)))
  "Returns md5sum for a message object of type 'PlanNamedTrajectory-response"
  "d08a3b641c2f8680fbdfb1ea2e17a3e1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlanNamedTrajectory-response>)))
  "Returns full string definition for message of type '<PlanNamedTrajectory-response>"
  (cl:format cl:nil "~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlanNamedTrajectory-response)))
  "Returns full string definition for message of type 'PlanNamedTrajectory-response"
  (cl:format cl:nil "~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlanNamedTrajectory-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlanNamedTrajectory-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PlanNamedTrajectory-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PlanNamedTrajectory)))
  'PlanNamedTrajectory-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PlanNamedTrajectory)))
  'PlanNamedTrajectory-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlanNamedTrajectory)))
  "Returns string type for a service object of type '<PlanNamedTrajectory>"
  "sr_robot_msgs/PlanNamedTrajectory")