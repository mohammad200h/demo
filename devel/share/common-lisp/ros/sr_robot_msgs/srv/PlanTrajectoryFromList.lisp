; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude PlanTrajectoryFromList-request.msg.html

(cl:defclass <PlanTrajectoryFromList-request> (roslisp-msg-protocol:ros-message)
  ((waypoint_names
    :reader waypoint_names
    :initarg :waypoint_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass PlanTrajectoryFromList-request (<PlanTrajectoryFromList-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlanTrajectoryFromList-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlanTrajectoryFromList-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<PlanTrajectoryFromList-request> is deprecated: use sr_robot_msgs-srv:PlanTrajectoryFromList-request instead.")))

(cl:ensure-generic-function 'waypoint_names-val :lambda-list '(m))
(cl:defmethod waypoint_names-val ((m <PlanTrajectoryFromList-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:waypoint_names-val is deprecated.  Use sr_robot_msgs-srv:waypoint_names instead.")
  (waypoint_names m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlanTrajectoryFromList-request>) ostream)
  "Serializes a message object of type '<PlanTrajectoryFromList-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'waypoint_names))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'waypoint_names))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlanTrajectoryFromList-request>) istream)
  "Deserializes a message object of type '<PlanTrajectoryFromList-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'waypoint_names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'waypoint_names)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlanTrajectoryFromList-request>)))
  "Returns string type for a service object of type '<PlanTrajectoryFromList-request>"
  "sr_robot_msgs/PlanTrajectoryFromListRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlanTrajectoryFromList-request)))
  "Returns string type for a service object of type 'PlanTrajectoryFromList-request"
  "sr_robot_msgs/PlanTrajectoryFromListRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlanTrajectoryFromList-request>)))
  "Returns md5sum for a message object of type '<PlanTrajectoryFromList-request>"
  "605c45ffa41b85052c4f100368ed2b2d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlanTrajectoryFromList-request)))
  "Returns md5sum for a message object of type 'PlanTrajectoryFromList-request"
  "605c45ffa41b85052c4f100368ed2b2d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlanTrajectoryFromList-request>)))
  "Returns full string definition for message of type '<PlanTrajectoryFromList-request>"
  (cl:format cl:nil "string[] waypoint_names~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlanTrajectoryFromList-request)))
  "Returns full string definition for message of type 'PlanTrajectoryFromList-request"
  (cl:format cl:nil "string[] waypoint_names~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlanTrajectoryFromList-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'waypoint_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlanTrajectoryFromList-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PlanTrajectoryFromList-request
    (cl:cons ':waypoint_names (waypoint_names msg))
))
;//! \htmlinclude PlanTrajectoryFromList-response.msg.html

(cl:defclass <PlanTrajectoryFromList-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PlanTrajectoryFromList-response (<PlanTrajectoryFromList-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlanTrajectoryFromList-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlanTrajectoryFromList-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<PlanTrajectoryFromList-response> is deprecated: use sr_robot_msgs-srv:PlanTrajectoryFromList-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <PlanTrajectoryFromList-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:success-val is deprecated.  Use sr_robot_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlanTrajectoryFromList-response>) ostream)
  "Serializes a message object of type '<PlanTrajectoryFromList-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlanTrajectoryFromList-response>) istream)
  "Deserializes a message object of type '<PlanTrajectoryFromList-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlanTrajectoryFromList-response>)))
  "Returns string type for a service object of type '<PlanTrajectoryFromList-response>"
  "sr_robot_msgs/PlanTrajectoryFromListResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlanTrajectoryFromList-response)))
  "Returns string type for a service object of type 'PlanTrajectoryFromList-response"
  "sr_robot_msgs/PlanTrajectoryFromListResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlanTrajectoryFromList-response>)))
  "Returns md5sum for a message object of type '<PlanTrajectoryFromList-response>"
  "605c45ffa41b85052c4f100368ed2b2d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlanTrajectoryFromList-response)))
  "Returns md5sum for a message object of type 'PlanTrajectoryFromList-response"
  "605c45ffa41b85052c4f100368ed2b2d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlanTrajectoryFromList-response>)))
  "Returns full string definition for message of type '<PlanTrajectoryFromList-response>"
  (cl:format cl:nil "~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlanTrajectoryFromList-response)))
  "Returns full string definition for message of type 'PlanTrajectoryFromList-response"
  (cl:format cl:nil "~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlanTrajectoryFromList-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlanTrajectoryFromList-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PlanTrajectoryFromList-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PlanTrajectoryFromList)))
  'PlanTrajectoryFromList-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PlanTrajectoryFromList)))
  'PlanTrajectoryFromList-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlanTrajectoryFromList)))
  "Returns string type for a service object of type '<PlanTrajectoryFromList>"
  "sr_robot_msgs/PlanTrajectoryFromList")