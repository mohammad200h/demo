; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude cartesian_position.msg.html

(cl:defclass <cartesian_position> (roslisp-msg-protocol:ros-message)
  ((tip_name
    :reader tip_name
    :initarg :tip_name
    :type cl:string
    :initform "")
   (tip_pos_x
    :reader tip_pos_x
    :initarg :tip_pos_x
    :type cl:float
    :initform 0.0)
   (tip_pos_y
    :reader tip_pos_y
    :initarg :tip_pos_y
    :type cl:float
    :initform 0.0)
   (tip_pos_z
    :reader tip_pos_z
    :initarg :tip_pos_z
    :type cl:float
    :initform 0.0)
   (tip_orientation_rho
    :reader tip_orientation_rho
    :initarg :tip_orientation_rho
    :type cl:float
    :initform 0.0)
   (tip_orientation_theta
    :reader tip_orientation_theta
    :initarg :tip_orientation_theta
    :type cl:float
    :initform 0.0)
   (tip_orientation_sigma
    :reader tip_orientation_sigma
    :initarg :tip_orientation_sigma
    :type cl:float
    :initform 0.0))
)

(cl:defclass cartesian_position (<cartesian_position>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cartesian_position>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cartesian_position)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<cartesian_position> is deprecated: use sr_robot_msgs-msg:cartesian_position instead.")))

(cl:ensure-generic-function 'tip_name-val :lambda-list '(m))
(cl:defmethod tip_name-val ((m <cartesian_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:tip_name-val is deprecated.  Use sr_robot_msgs-msg:tip_name instead.")
  (tip_name m))

(cl:ensure-generic-function 'tip_pos_x-val :lambda-list '(m))
(cl:defmethod tip_pos_x-val ((m <cartesian_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:tip_pos_x-val is deprecated.  Use sr_robot_msgs-msg:tip_pos_x instead.")
  (tip_pos_x m))

(cl:ensure-generic-function 'tip_pos_y-val :lambda-list '(m))
(cl:defmethod tip_pos_y-val ((m <cartesian_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:tip_pos_y-val is deprecated.  Use sr_robot_msgs-msg:tip_pos_y instead.")
  (tip_pos_y m))

(cl:ensure-generic-function 'tip_pos_z-val :lambda-list '(m))
(cl:defmethod tip_pos_z-val ((m <cartesian_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:tip_pos_z-val is deprecated.  Use sr_robot_msgs-msg:tip_pos_z instead.")
  (tip_pos_z m))

(cl:ensure-generic-function 'tip_orientation_rho-val :lambda-list '(m))
(cl:defmethod tip_orientation_rho-val ((m <cartesian_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:tip_orientation_rho-val is deprecated.  Use sr_robot_msgs-msg:tip_orientation_rho instead.")
  (tip_orientation_rho m))

(cl:ensure-generic-function 'tip_orientation_theta-val :lambda-list '(m))
(cl:defmethod tip_orientation_theta-val ((m <cartesian_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:tip_orientation_theta-val is deprecated.  Use sr_robot_msgs-msg:tip_orientation_theta instead.")
  (tip_orientation_theta m))

(cl:ensure-generic-function 'tip_orientation_sigma-val :lambda-list '(m))
(cl:defmethod tip_orientation_sigma-val ((m <cartesian_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:tip_orientation_sigma-val is deprecated.  Use sr_robot_msgs-msg:tip_orientation_sigma instead.")
  (tip_orientation_sigma m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cartesian_position>) ostream)
  "Serializes a message object of type '<cartesian_position>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'tip_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'tip_name))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'tip_pos_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'tip_pos_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'tip_pos_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'tip_orientation_rho))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'tip_orientation_theta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'tip_orientation_sigma))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cartesian_position>) istream)
  "Deserializes a message object of type '<cartesian_position>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tip_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'tip_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'tip_pos_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'tip_pos_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'tip_pos_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'tip_orientation_rho) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'tip_orientation_theta) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'tip_orientation_sigma) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cartesian_position>)))
  "Returns string type for a message object of type '<cartesian_position>"
  "sr_robot_msgs/cartesian_position")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cartesian_position)))
  "Returns string type for a message object of type 'cartesian_position"
  "sr_robot_msgs/cartesian_position")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cartesian_position>)))
  "Returns md5sum for a message object of type '<cartesian_position>"
  "cfc3f1750a36a668eb93288ed1128f42")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cartesian_position)))
  "Returns md5sum for a message object of type 'cartesian_position"
  "cfc3f1750a36a668eb93288ed1128f42")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cartesian_position>)))
  "Returns full string definition for message of type '<cartesian_position>"
  (cl:format cl:nil "string  tip_name~%float32 tip_pos_x~%float32 tip_pos_y~%float32 tip_pos_z~%float32 tip_orientation_rho~%float32 tip_orientation_theta~%float32 tip_orientation_sigma~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cartesian_position)))
  "Returns full string definition for message of type 'cartesian_position"
  (cl:format cl:nil "string  tip_name~%float32 tip_pos_x~%float32 tip_pos_y~%float32 tip_pos_z~%float32 tip_orientation_rho~%float32 tip_orientation_theta~%float32 tip_orientation_sigma~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cartesian_position>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'tip_name))
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cartesian_position>))
  "Converts a ROS message object to a list"
  (cl:list 'cartesian_position
    (cl:cons ':tip_name (tip_name msg))
    (cl:cons ':tip_pos_x (tip_pos_x msg))
    (cl:cons ':tip_pos_y (tip_pos_y msg))
    (cl:cons ':tip_pos_z (tip_pos_z msg))
    (cl:cons ':tip_orientation_rho (tip_orientation_rho msg))
    (cl:cons ':tip_orientation_theta (tip_orientation_theta msg))
    (cl:cons ':tip_orientation_sigma (tip_orientation_sigma msg))
))
