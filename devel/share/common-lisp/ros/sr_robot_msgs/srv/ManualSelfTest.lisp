; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude ManualSelfTest-request.msg.html

(cl:defclass <ManualSelfTest-request> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ManualSelfTest-request (<ManualSelfTest-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ManualSelfTest-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ManualSelfTest-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<ManualSelfTest-request> is deprecated: use sr_robot_msgs-srv:ManualSelfTest-request instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ManualSelfTest-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:message-val is deprecated.  Use sr_robot_msgs-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ManualSelfTest-request>) ostream)
  "Serializes a message object of type '<ManualSelfTest-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ManualSelfTest-request>) istream)
  "Deserializes a message object of type '<ManualSelfTest-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ManualSelfTest-request>)))
  "Returns string type for a service object of type '<ManualSelfTest-request>"
  "sr_robot_msgs/ManualSelfTestRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ManualSelfTest-request)))
  "Returns string type for a service object of type 'ManualSelfTest-request"
  "sr_robot_msgs/ManualSelfTestRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ManualSelfTest-request>)))
  "Returns md5sum for a message object of type '<ManualSelfTest-request>"
  "d83c7b589c767d269944dfef6ec6a6dc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ManualSelfTest-request)))
  "Returns md5sum for a message object of type 'ManualSelfTest-request"
  "d83c7b589c767d269944dfef6ec6a6dc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ManualSelfTest-request>)))
  "Returns full string definition for message of type '<ManualSelfTest-request>"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ManualSelfTest-request)))
  "Returns full string definition for message of type 'ManualSelfTest-request"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ManualSelfTest-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ManualSelfTest-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ManualSelfTest-request
    (cl:cons ':message (message msg))
))
;//! \htmlinclude ManualSelfTest-response.msg.html

(cl:defclass <ManualSelfTest-response> (roslisp-msg-protocol:ros-message)
  ((ok
    :reader ok
    :initarg :ok
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ManualSelfTest-response (<ManualSelfTest-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ManualSelfTest-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ManualSelfTest-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<ManualSelfTest-response> is deprecated: use sr_robot_msgs-srv:ManualSelfTest-response instead.")))

(cl:ensure-generic-function 'ok-val :lambda-list '(m))
(cl:defmethod ok-val ((m <ManualSelfTest-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:ok-val is deprecated.  Use sr_robot_msgs-srv:ok instead.")
  (ok m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ManualSelfTest-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:message-val is deprecated.  Use sr_robot_msgs-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ManualSelfTest-response>) ostream)
  "Serializes a message object of type '<ManualSelfTest-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'ok) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ManualSelfTest-response>) istream)
  "Deserializes a message object of type '<ManualSelfTest-response>"
    (cl:setf (cl:slot-value msg 'ok) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ManualSelfTest-response>)))
  "Returns string type for a service object of type '<ManualSelfTest-response>"
  "sr_robot_msgs/ManualSelfTestResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ManualSelfTest-response)))
  "Returns string type for a service object of type 'ManualSelfTest-response"
  "sr_robot_msgs/ManualSelfTestResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ManualSelfTest-response>)))
  "Returns md5sum for a message object of type '<ManualSelfTest-response>"
  "d83c7b589c767d269944dfef6ec6a6dc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ManualSelfTest-response)))
  "Returns md5sum for a message object of type 'ManualSelfTest-response"
  "d83c7b589c767d269944dfef6ec6a6dc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ManualSelfTest-response>)))
  "Returns full string definition for message of type '<ManualSelfTest-response>"
  (cl:format cl:nil "bool ok~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ManualSelfTest-response)))
  "Returns full string definition for message of type 'ManualSelfTest-response"
  (cl:format cl:nil "bool ok~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ManualSelfTest-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ManualSelfTest-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ManualSelfTest-response
    (cl:cons ':ok (ok msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ManualSelfTest)))
  'ManualSelfTest-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ManualSelfTest)))
  'ManualSelfTest-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ManualSelfTest)))
  "Returns string type for a service object of type '<ManualSelfTest>"
  "sr_robot_msgs/ManualSelfTest")