; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude PlanTrajectoryFromPrefix-request.msg.html

(cl:defclass <PlanTrajectoryFromPrefix-request> (roslisp-msg-protocol:ros-message)
  ((prefix
    :reader prefix
    :initarg :prefix
    :type cl:string
    :initform ""))
)

(cl:defclass PlanTrajectoryFromPrefix-request (<PlanTrajectoryFromPrefix-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlanTrajectoryFromPrefix-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlanTrajectoryFromPrefix-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<PlanTrajectoryFromPrefix-request> is deprecated: use sr_robot_msgs-srv:PlanTrajectoryFromPrefix-request instead.")))

(cl:ensure-generic-function 'prefix-val :lambda-list '(m))
(cl:defmethod prefix-val ((m <PlanTrajectoryFromPrefix-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:prefix-val is deprecated.  Use sr_robot_msgs-srv:prefix instead.")
  (prefix m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlanTrajectoryFromPrefix-request>) ostream)
  "Serializes a message object of type '<PlanTrajectoryFromPrefix-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'prefix))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'prefix))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlanTrajectoryFromPrefix-request>) istream)
  "Deserializes a message object of type '<PlanTrajectoryFromPrefix-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'prefix) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'prefix) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlanTrajectoryFromPrefix-request>)))
  "Returns string type for a service object of type '<PlanTrajectoryFromPrefix-request>"
  "sr_robot_msgs/PlanTrajectoryFromPrefixRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlanTrajectoryFromPrefix-request)))
  "Returns string type for a service object of type 'PlanTrajectoryFromPrefix-request"
  "sr_robot_msgs/PlanTrajectoryFromPrefixRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlanTrajectoryFromPrefix-request>)))
  "Returns md5sum for a message object of type '<PlanTrajectoryFromPrefix-request>"
  "2311a2368ccb73aeef583bd78e497f75")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlanTrajectoryFromPrefix-request)))
  "Returns md5sum for a message object of type 'PlanTrajectoryFromPrefix-request"
  "2311a2368ccb73aeef583bd78e497f75")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlanTrajectoryFromPrefix-request>)))
  "Returns full string definition for message of type '<PlanTrajectoryFromPrefix-request>"
  (cl:format cl:nil "string prefix~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlanTrajectoryFromPrefix-request)))
  "Returns full string definition for message of type 'PlanTrajectoryFromPrefix-request"
  (cl:format cl:nil "string prefix~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlanTrajectoryFromPrefix-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'prefix))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlanTrajectoryFromPrefix-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PlanTrajectoryFromPrefix-request
    (cl:cons ':prefix (prefix msg))
))
;//! \htmlinclude PlanTrajectoryFromPrefix-response.msg.html

(cl:defclass <PlanTrajectoryFromPrefix-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PlanTrajectoryFromPrefix-response (<PlanTrajectoryFromPrefix-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlanTrajectoryFromPrefix-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlanTrajectoryFromPrefix-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<PlanTrajectoryFromPrefix-response> is deprecated: use sr_robot_msgs-srv:PlanTrajectoryFromPrefix-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <PlanTrajectoryFromPrefix-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:success-val is deprecated.  Use sr_robot_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlanTrajectoryFromPrefix-response>) ostream)
  "Serializes a message object of type '<PlanTrajectoryFromPrefix-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlanTrajectoryFromPrefix-response>) istream)
  "Deserializes a message object of type '<PlanTrajectoryFromPrefix-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlanTrajectoryFromPrefix-response>)))
  "Returns string type for a service object of type '<PlanTrajectoryFromPrefix-response>"
  "sr_robot_msgs/PlanTrajectoryFromPrefixResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlanTrajectoryFromPrefix-response)))
  "Returns string type for a service object of type 'PlanTrajectoryFromPrefix-response"
  "sr_robot_msgs/PlanTrajectoryFromPrefixResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlanTrajectoryFromPrefix-response>)))
  "Returns md5sum for a message object of type '<PlanTrajectoryFromPrefix-response>"
  "2311a2368ccb73aeef583bd78e497f75")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlanTrajectoryFromPrefix-response)))
  "Returns md5sum for a message object of type 'PlanTrajectoryFromPrefix-response"
  "2311a2368ccb73aeef583bd78e497f75")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlanTrajectoryFromPrefix-response>)))
  "Returns full string definition for message of type '<PlanTrajectoryFromPrefix-response>"
  (cl:format cl:nil "~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlanTrajectoryFromPrefix-response)))
  "Returns full string definition for message of type 'PlanTrajectoryFromPrefix-response"
  (cl:format cl:nil "~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlanTrajectoryFromPrefix-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlanTrajectoryFromPrefix-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PlanTrajectoryFromPrefix-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PlanTrajectoryFromPrefix)))
  'PlanTrajectoryFromPrefix-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PlanTrajectoryFromPrefix)))
  'PlanTrajectoryFromPrefix-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlanTrajectoryFromPrefix)))
  "Returns string type for a service object of type '<PlanTrajectoryFromPrefix>"
  "sr_robot_msgs/PlanTrajectoryFromPrefix")