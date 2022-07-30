; Auto-generated. Do not edit!


(cl:in-package cw3_helper-srv)


;//! \htmlinclude ChangeCollisionObject-request.msg.html

(cl:defclass <ChangeCollisionObject-request> (roslisp-msg-protocol:ros-message)
  ((object_name
    :reader object_name
    :initarg :object_name
    :type cl:string
    :initform ""))
)

(cl:defclass ChangeCollisionObject-request (<ChangeCollisionObject-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChangeCollisionObject-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChangeCollisionObject-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cw3_helper-srv:<ChangeCollisionObject-request> is deprecated: use cw3_helper-srv:ChangeCollisionObject-request instead.")))

(cl:ensure-generic-function 'object_name-val :lambda-list '(m))
(cl:defmethod object_name-val ((m <ChangeCollisionObject-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cw3_helper-srv:object_name-val is deprecated.  Use cw3_helper-srv:object_name instead.")
  (object_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChangeCollisionObject-request>) ostream)
  "Serializes a message object of type '<ChangeCollisionObject-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'object_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'object_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChangeCollisionObject-request>) istream)
  "Deserializes a message object of type '<ChangeCollisionObject-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'object_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'object_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChangeCollisionObject-request>)))
  "Returns string type for a service object of type '<ChangeCollisionObject-request>"
  "cw3_helper/ChangeCollisionObjectRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeCollisionObject-request)))
  "Returns string type for a service object of type 'ChangeCollisionObject-request"
  "cw3_helper/ChangeCollisionObjectRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChangeCollisionObject-request>)))
  "Returns md5sum for a message object of type '<ChangeCollisionObject-request>"
  "bc93e0d7ed716275a8d9336d083ffb50")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChangeCollisionObject-request)))
  "Returns md5sum for a message object of type 'ChangeCollisionObject-request"
  "bc93e0d7ed716275a8d9336d083ffb50")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChangeCollisionObject-request>)))
  "Returns full string definition for message of type '<ChangeCollisionObject-request>"
  (cl:format cl:nil "string object_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChangeCollisionObject-request)))
  "Returns full string definition for message of type 'ChangeCollisionObject-request"
  (cl:format cl:nil "string object_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChangeCollisionObject-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'object_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChangeCollisionObject-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ChangeCollisionObject-request
    (cl:cons ':object_name (object_name msg))
))
;//! \htmlinclude ChangeCollisionObject-response.msg.html

(cl:defclass <ChangeCollisionObject-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ChangeCollisionObject-response (<ChangeCollisionObject-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChangeCollisionObject-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChangeCollisionObject-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cw3_helper-srv:<ChangeCollisionObject-response> is deprecated: use cw3_helper-srv:ChangeCollisionObject-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ChangeCollisionObject-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cw3_helper-srv:success-val is deprecated.  Use cw3_helper-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChangeCollisionObject-response>) ostream)
  "Serializes a message object of type '<ChangeCollisionObject-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChangeCollisionObject-response>) istream)
  "Deserializes a message object of type '<ChangeCollisionObject-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChangeCollisionObject-response>)))
  "Returns string type for a service object of type '<ChangeCollisionObject-response>"
  "cw3_helper/ChangeCollisionObjectResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeCollisionObject-response)))
  "Returns string type for a service object of type 'ChangeCollisionObject-response"
  "cw3_helper/ChangeCollisionObjectResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChangeCollisionObject-response>)))
  "Returns md5sum for a message object of type '<ChangeCollisionObject-response>"
  "bc93e0d7ed716275a8d9336d083ffb50")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChangeCollisionObject-response)))
  "Returns md5sum for a message object of type 'ChangeCollisionObject-response"
  "bc93e0d7ed716275a8d9336d083ffb50")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChangeCollisionObject-response>)))
  "Returns full string definition for message of type '<ChangeCollisionObject-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChangeCollisionObject-response)))
  "Returns full string definition for message of type 'ChangeCollisionObject-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChangeCollisionObject-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChangeCollisionObject-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ChangeCollisionObject-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ChangeCollisionObject)))
  'ChangeCollisionObject-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ChangeCollisionObject)))
  'ChangeCollisionObject-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeCollisionObject)))
  "Returns string type for a service object of type '<ChangeCollisionObject>"
  "cw3_helper/ChangeCollisionObject")