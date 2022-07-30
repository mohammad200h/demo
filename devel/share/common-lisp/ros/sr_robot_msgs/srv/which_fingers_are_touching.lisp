; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude which_fingers_are_touching-request.msg.html

(cl:defclass <which_fingers_are_touching-request> (roslisp-msg-protocol:ros-message)
  ((force_thresholds
    :reader force_thresholds
    :initarg :force_thresholds
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass which_fingers_are_touching-request (<which_fingers_are_touching-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <which_fingers_are_touching-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'which_fingers_are_touching-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<which_fingers_are_touching-request> is deprecated: use sr_robot_msgs-srv:which_fingers_are_touching-request instead.")))

(cl:ensure-generic-function 'force_thresholds-val :lambda-list '(m))
(cl:defmethod force_thresholds-val ((m <which_fingers_are_touching-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:force_thresholds-val is deprecated.  Use sr_robot_msgs-srv:force_thresholds instead.")
  (force_thresholds m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <which_fingers_are_touching-request>) ostream)
  "Serializes a message object of type '<which_fingers_are_touching-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'force_thresholds))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'force_thresholds))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <which_fingers_are_touching-request>) istream)
  "Deserializes a message object of type '<which_fingers_are_touching-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'force_thresholds) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'force_thresholds)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<which_fingers_are_touching-request>)))
  "Returns string type for a service object of type '<which_fingers_are_touching-request>"
  "sr_robot_msgs/which_fingers_are_touchingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'which_fingers_are_touching-request)))
  "Returns string type for a service object of type 'which_fingers_are_touching-request"
  "sr_robot_msgs/which_fingers_are_touchingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<which_fingers_are_touching-request>)))
  "Returns md5sum for a message object of type '<which_fingers_are_touching-request>"
  "5db90fdcbce6b7b34ac0a1f94863f7e2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'which_fingers_are_touching-request)))
  "Returns md5sum for a message object of type 'which_fingers_are_touching-request"
  "5db90fdcbce6b7b34ac0a1f94863f7e2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<which_fingers_are_touching-request>)))
  "Returns full string definition for message of type '<which_fingers_are_touching-request>"
  (cl:format cl:nil "~%~%~%~%float64[] force_thresholds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'which_fingers_are_touching-request)))
  "Returns full string definition for message of type 'which_fingers_are_touching-request"
  (cl:format cl:nil "~%~%~%~%float64[] force_thresholds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <which_fingers_are_touching-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'force_thresholds) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <which_fingers_are_touching-request>))
  "Converts a ROS message object to a list"
  (cl:list 'which_fingers_are_touching-request
    (cl:cons ':force_thresholds (force_thresholds msg))
))
;//! \htmlinclude which_fingers_are_touching-response.msg.html

(cl:defclass <which_fingers_are_touching-response> (roslisp-msg-protocol:ros-message)
  ((touch_forces
    :reader touch_forces
    :initarg :touch_forces
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass which_fingers_are_touching-response (<which_fingers_are_touching-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <which_fingers_are_touching-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'which_fingers_are_touching-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<which_fingers_are_touching-response> is deprecated: use sr_robot_msgs-srv:which_fingers_are_touching-response instead.")))

(cl:ensure-generic-function 'touch_forces-val :lambda-list '(m))
(cl:defmethod touch_forces-val ((m <which_fingers_are_touching-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:touch_forces-val is deprecated.  Use sr_robot_msgs-srv:touch_forces instead.")
  (touch_forces m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <which_fingers_are_touching-response>) ostream)
  "Serializes a message object of type '<which_fingers_are_touching-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'touch_forces))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'touch_forces))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <which_fingers_are_touching-response>) istream)
  "Deserializes a message object of type '<which_fingers_are_touching-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'touch_forces) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'touch_forces)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<which_fingers_are_touching-response>)))
  "Returns string type for a service object of type '<which_fingers_are_touching-response>"
  "sr_robot_msgs/which_fingers_are_touchingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'which_fingers_are_touching-response)))
  "Returns string type for a service object of type 'which_fingers_are_touching-response"
  "sr_robot_msgs/which_fingers_are_touchingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<which_fingers_are_touching-response>)))
  "Returns md5sum for a message object of type '<which_fingers_are_touching-response>"
  "5db90fdcbce6b7b34ac0a1f94863f7e2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'which_fingers_are_touching-response)))
  "Returns md5sum for a message object of type 'which_fingers_are_touching-response"
  "5db90fdcbce6b7b34ac0a1f94863f7e2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<which_fingers_are_touching-response>)))
  "Returns full string definition for message of type '<which_fingers_are_touching-response>"
  (cl:format cl:nil "float64[] touch_forces~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'which_fingers_are_touching-response)))
  "Returns full string definition for message of type 'which_fingers_are_touching-response"
  (cl:format cl:nil "float64[] touch_forces~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <which_fingers_are_touching-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'touch_forces) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <which_fingers_are_touching-response>))
  "Converts a ROS message object to a list"
  (cl:list 'which_fingers_are_touching-response
    (cl:cons ':touch_forces (touch_forces msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'which_fingers_are_touching)))
  'which_fingers_are_touching-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'which_fingers_are_touching)))
  'which_fingers_are_touching-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'which_fingers_are_touching)))
  "Returns string type for a service object of type '<which_fingers_are_touching>"
  "sr_robot_msgs/which_fingers_are_touching")