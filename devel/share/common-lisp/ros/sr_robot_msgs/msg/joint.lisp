; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude joint.msg.html

(cl:defclass <joint> (roslisp-msg-protocol:ros-message)
  ((joint_name
    :reader joint_name
    :initarg :joint_name
    :type cl:string
    :initform "")
   (joint_position
    :reader joint_position
    :initarg :joint_position
    :type cl:float
    :initform 0.0)
   (joint_target
    :reader joint_target
    :initarg :joint_target
    :type cl:float
    :initform 0.0)
   (joint_torque
    :reader joint_torque
    :initarg :joint_torque
    :type cl:float
    :initform 0.0)
   (joint_temperature
    :reader joint_temperature
    :initarg :joint_temperature
    :type cl:float
    :initform 0.0)
   (joint_current
    :reader joint_current
    :initarg :joint_current
    :type cl:float
    :initform 0.0)
   (error_flag
    :reader error_flag
    :initarg :error_flag
    :type cl:string
    :initform ""))
)

(cl:defclass joint (<joint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <joint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'joint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<joint> is deprecated: use sr_robot_msgs-msg:joint instead.")))

(cl:ensure-generic-function 'joint_name-val :lambda-list '(m))
(cl:defmethod joint_name-val ((m <joint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:joint_name-val is deprecated.  Use sr_robot_msgs-msg:joint_name instead.")
  (joint_name m))

(cl:ensure-generic-function 'joint_position-val :lambda-list '(m))
(cl:defmethod joint_position-val ((m <joint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:joint_position-val is deprecated.  Use sr_robot_msgs-msg:joint_position instead.")
  (joint_position m))

(cl:ensure-generic-function 'joint_target-val :lambda-list '(m))
(cl:defmethod joint_target-val ((m <joint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:joint_target-val is deprecated.  Use sr_robot_msgs-msg:joint_target instead.")
  (joint_target m))

(cl:ensure-generic-function 'joint_torque-val :lambda-list '(m))
(cl:defmethod joint_torque-val ((m <joint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:joint_torque-val is deprecated.  Use sr_robot_msgs-msg:joint_torque instead.")
  (joint_torque m))

(cl:ensure-generic-function 'joint_temperature-val :lambda-list '(m))
(cl:defmethod joint_temperature-val ((m <joint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:joint_temperature-val is deprecated.  Use sr_robot_msgs-msg:joint_temperature instead.")
  (joint_temperature m))

(cl:ensure-generic-function 'joint_current-val :lambda-list '(m))
(cl:defmethod joint_current-val ((m <joint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:joint_current-val is deprecated.  Use sr_robot_msgs-msg:joint_current instead.")
  (joint_current m))

(cl:ensure-generic-function 'error_flag-val :lambda-list '(m))
(cl:defmethod error_flag-val ((m <joint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:error_flag-val is deprecated.  Use sr_robot_msgs-msg:error_flag instead.")
  (error_flag m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <joint>) ostream)
  "Serializes a message object of type '<joint>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'joint_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'joint_name))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'joint_position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'joint_target))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'joint_torque))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'joint_temperature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'joint_current))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error_flag))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error_flag))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <joint>) istream)
  "Deserializes a message object of type '<joint>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'joint_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'joint_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint_position) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint_target) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint_torque) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint_temperature) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'joint_current) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'error_flag) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'error_flag) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<joint>)))
  "Returns string type for a message object of type '<joint>"
  "sr_robot_msgs/joint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'joint)))
  "Returns string type for a message object of type 'joint"
  "sr_robot_msgs/joint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<joint>)))
  "Returns md5sum for a message object of type '<joint>"
  "4f0c5e71dfc214020935c3116ed47d6f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'joint)))
  "Returns md5sum for a message object of type 'joint"
  "4f0c5e71dfc214020935c3116ed47d6f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<joint>)))
  "Returns full string definition for message of type '<joint>"
  (cl:format cl:nil "string  joint_name~%float64 joint_position~%float64 joint_target~%float64 joint_torque~%float64 joint_temperature~%float64 joint_current~%string  error_flag~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'joint)))
  "Returns full string definition for message of type 'joint"
  (cl:format cl:nil "string  joint_name~%float64 joint_position~%float64 joint_target~%float64 joint_torque~%float64 joint_temperature~%float64 joint_current~%string  error_flag~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <joint>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'joint_name))
     8
     8
     8
     8
     8
     4 (cl:length (cl:slot-value msg 'error_flag))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <joint>))
  "Converts a ROS message object to a list"
  (cl:list 'joint
    (cl:cons ':joint_name (joint_name msg))
    (cl:cons ':joint_position (joint_position msg))
    (cl:cons ':joint_target (joint_target msg))
    (cl:cons ':joint_torque (joint_torque msg))
    (cl:cons ':joint_temperature (joint_temperature msg))
    (cl:cons ':joint_current (joint_current msg))
    (cl:cons ':error_flag (error_flag msg))
))
