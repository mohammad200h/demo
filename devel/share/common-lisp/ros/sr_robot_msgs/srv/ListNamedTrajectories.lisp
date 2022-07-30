; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude ListNamedTrajectories-request.msg.html

(cl:defclass <ListNamedTrajectories-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ListNamedTrajectories-request (<ListNamedTrajectories-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ListNamedTrajectories-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ListNamedTrajectories-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<ListNamedTrajectories-request> is deprecated: use sr_robot_msgs-srv:ListNamedTrajectories-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ListNamedTrajectories-request>) ostream)
  "Serializes a message object of type '<ListNamedTrajectories-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ListNamedTrajectories-request>) istream)
  "Deserializes a message object of type '<ListNamedTrajectories-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ListNamedTrajectories-request>)))
  "Returns string type for a service object of type '<ListNamedTrajectories-request>"
  "sr_robot_msgs/ListNamedTrajectoriesRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ListNamedTrajectories-request)))
  "Returns string type for a service object of type 'ListNamedTrajectories-request"
  "sr_robot_msgs/ListNamedTrajectoriesRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ListNamedTrajectories-request>)))
  "Returns md5sum for a message object of type '<ListNamedTrajectories-request>"
  "dc7ae3609524b18034e49294a4ce670e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ListNamedTrajectories-request)))
  "Returns md5sum for a message object of type 'ListNamedTrajectories-request"
  "dc7ae3609524b18034e49294a4ce670e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ListNamedTrajectories-request>)))
  "Returns full string definition for message of type '<ListNamedTrajectories-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ListNamedTrajectories-request)))
  "Returns full string definition for message of type 'ListNamedTrajectories-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ListNamedTrajectories-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ListNamedTrajectories-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ListNamedTrajectories-request
))
;//! \htmlinclude ListNamedTrajectories-response.msg.html

(cl:defclass <ListNamedTrajectories-response> (roslisp-msg-protocol:ros-message)
  ((names
    :reader names
    :initarg :names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass ListNamedTrajectories-response (<ListNamedTrajectories-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ListNamedTrajectories-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ListNamedTrajectories-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<ListNamedTrajectories-response> is deprecated: use sr_robot_msgs-srv:ListNamedTrajectories-response instead.")))

(cl:ensure-generic-function 'names-val :lambda-list '(m))
(cl:defmethod names-val ((m <ListNamedTrajectories-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:names-val is deprecated.  Use sr_robot_msgs-srv:names instead.")
  (names m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ListNamedTrajectories-response>) ostream)
  "Serializes a message object of type '<ListNamedTrajectories-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'names))))
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
   (cl:slot-value msg 'names))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ListNamedTrajectories-response>) istream)
  "Deserializes a message object of type '<ListNamedTrajectories-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'names)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ListNamedTrajectories-response>)))
  "Returns string type for a service object of type '<ListNamedTrajectories-response>"
  "sr_robot_msgs/ListNamedTrajectoriesResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ListNamedTrajectories-response)))
  "Returns string type for a service object of type 'ListNamedTrajectories-response"
  "sr_robot_msgs/ListNamedTrajectoriesResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ListNamedTrajectories-response>)))
  "Returns md5sum for a message object of type '<ListNamedTrajectories-response>"
  "dc7ae3609524b18034e49294a4ce670e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ListNamedTrajectories-response)))
  "Returns md5sum for a message object of type 'ListNamedTrajectories-response"
  "dc7ae3609524b18034e49294a4ce670e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ListNamedTrajectories-response>)))
  "Returns full string definition for message of type '<ListNamedTrajectories-response>"
  (cl:format cl:nil "~%string[] names~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ListNamedTrajectories-response)))
  "Returns full string definition for message of type 'ListNamedTrajectories-response"
  (cl:format cl:nil "~%string[] names~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ListNamedTrajectories-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ListNamedTrajectories-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ListNamedTrajectories-response
    (cl:cons ':names (names msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ListNamedTrajectories)))
  'ListNamedTrajectories-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ListNamedTrajectories)))
  'ListNamedTrajectories-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ListNamedTrajectories)))
  "Returns string type for a service object of type '<ListNamedTrajectories>"
  "sr_robot_msgs/ListNamedTrajectories")