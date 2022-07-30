; Auto-generated. Do not edit!


(cl:in-package AW_hand_service-srv)


;//! \htmlinclude moveObj-request.msg.html

(cl:defclass <moveObj-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0))
)

(cl:defclass moveObj-request (<moveObj-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <moveObj-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'moveObj-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name AW_hand_service-srv:<moveObj-request> is deprecated: use AW_hand_service-srv:moveObj-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <moveObj-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader AW_hand_service-srv:x-val is deprecated.  Use AW_hand_service-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <moveObj-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader AW_hand_service-srv:y-val is deprecated.  Use AW_hand_service-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <moveObj-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader AW_hand_service-srv:z-val is deprecated.  Use AW_hand_service-srv:z instead.")
  (z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <moveObj-request>) ostream)
  "Serializes a message object of type '<moveObj-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <moveObj-request>) istream)
  "Deserializes a message object of type '<moveObj-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<moveObj-request>)))
  "Returns string type for a service object of type '<moveObj-request>"
  "AW_hand_service/moveObjRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'moveObj-request)))
  "Returns string type for a service object of type 'moveObj-request"
  "AW_hand_service/moveObjRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<moveObj-request>)))
  "Returns md5sum for a message object of type '<moveObj-request>"
  "e273575340e93981085e010f5e57043f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'moveObj-request)))
  "Returns md5sum for a message object of type 'moveObj-request"
  "e273575340e93981085e010f5e57043f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<moveObj-request>)))
  "Returns full string definition for message of type '<moveObj-request>"
  (cl:format cl:nil "float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'moveObj-request)))
  "Returns full string definition for message of type 'moveObj-request"
  (cl:format cl:nil "float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <moveObj-request>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <moveObj-request>))
  "Converts a ROS message object to a list"
  (cl:list 'moveObj-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
))
;//! \htmlinclude moveObj-response.msg.html

(cl:defclass <moveObj-response> (roslisp-msg-protocol:ros-message)
  ((objMoved
    :reader objMoved
    :initarg :objMoved
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass moveObj-response (<moveObj-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <moveObj-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'moveObj-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name AW_hand_service-srv:<moveObj-response> is deprecated: use AW_hand_service-srv:moveObj-response instead.")))

(cl:ensure-generic-function 'objMoved-val :lambda-list '(m))
(cl:defmethod objMoved-val ((m <moveObj-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader AW_hand_service-srv:objMoved-val is deprecated.  Use AW_hand_service-srv:objMoved instead.")
  (objMoved m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <moveObj-response>) ostream)
  "Serializes a message object of type '<moveObj-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'objMoved) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <moveObj-response>) istream)
  "Deserializes a message object of type '<moveObj-response>"
    (cl:setf (cl:slot-value msg 'objMoved) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<moveObj-response>)))
  "Returns string type for a service object of type '<moveObj-response>"
  "AW_hand_service/moveObjResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'moveObj-response)))
  "Returns string type for a service object of type 'moveObj-response"
  "AW_hand_service/moveObjResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<moveObj-response>)))
  "Returns md5sum for a message object of type '<moveObj-response>"
  "e273575340e93981085e010f5e57043f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'moveObj-response)))
  "Returns md5sum for a message object of type 'moveObj-response"
  "e273575340e93981085e010f5e57043f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<moveObj-response>)))
  "Returns full string definition for message of type '<moveObj-response>"
  (cl:format cl:nil "bool objMoved~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'moveObj-response)))
  "Returns full string definition for message of type 'moveObj-response"
  (cl:format cl:nil "bool objMoved~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <moveObj-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <moveObj-response>))
  "Converts a ROS message object to a list"
  (cl:list 'moveObj-response
    (cl:cons ':objMoved (objMoved msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'moveObj)))
  'moveObj-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'moveObj)))
  'moveObj-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'moveObj)))
  "Returns string type for a service object of type '<moveObj>"
  "AW_hand_service/moveObj")