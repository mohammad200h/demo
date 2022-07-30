; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude JointMuscleValveControllerState.msg.html

(cl:defclass <JointMuscleValveControllerState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (set_valve_muscle_0
    :reader set_valve_muscle_0
    :initarg :set_valve_muscle_0
    :type cl:fixnum
    :initform 0)
   (set_valve_muscle_1
    :reader set_valve_muscle_1
    :initarg :set_valve_muscle_1
    :type cl:fixnum
    :initform 0)
   (set_duration_muscle_0
    :reader set_duration_muscle_0
    :initarg :set_duration_muscle_0
    :type cl:integer
    :initform 0)
   (set_duration_muscle_1
    :reader set_duration_muscle_1
    :initarg :set_duration_muscle_1
    :type cl:integer
    :initform 0)
   (current_valve_muscle_0
    :reader current_valve_muscle_0
    :initarg :current_valve_muscle_0
    :type cl:fixnum
    :initform 0)
   (current_valve_muscle_1
    :reader current_valve_muscle_1
    :initarg :current_valve_muscle_1
    :type cl:fixnum
    :initform 0)
   (current_duration_muscle_0
    :reader current_duration_muscle_0
    :initarg :current_duration_muscle_0
    :type cl:integer
    :initform 0)
   (current_duration_muscle_1
    :reader current_duration_muscle_1
    :initarg :current_duration_muscle_1
    :type cl:integer
    :initform 0)
   (packed_valve
    :reader packed_valve
    :initarg :packed_valve
    :type cl:float
    :initform 0.0)
   (muscle_pressure_0
    :reader muscle_pressure_0
    :initarg :muscle_pressure_0
    :type cl:fixnum
    :initform 0)
   (muscle_pressure_1
    :reader muscle_pressure_1
    :initarg :muscle_pressure_1
    :type cl:fixnum
    :initform 0)
   (time_step
    :reader time_step
    :initarg :time_step
    :type cl:float
    :initform 0.0))
)

(cl:defclass JointMuscleValveControllerState (<JointMuscleValveControllerState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JointMuscleValveControllerState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JointMuscleValveControllerState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<JointMuscleValveControllerState> is deprecated: use sr_robot_msgs-msg:JointMuscleValveControllerState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <JointMuscleValveControllerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:header-val is deprecated.  Use sr_robot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'set_valve_muscle_0-val :lambda-list '(m))
(cl:defmethod set_valve_muscle_0-val ((m <JointMuscleValveControllerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:set_valve_muscle_0-val is deprecated.  Use sr_robot_msgs-msg:set_valve_muscle_0 instead.")
  (set_valve_muscle_0 m))

(cl:ensure-generic-function 'set_valve_muscle_1-val :lambda-list '(m))
(cl:defmethod set_valve_muscle_1-val ((m <JointMuscleValveControllerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:set_valve_muscle_1-val is deprecated.  Use sr_robot_msgs-msg:set_valve_muscle_1 instead.")
  (set_valve_muscle_1 m))

(cl:ensure-generic-function 'set_duration_muscle_0-val :lambda-list '(m))
(cl:defmethod set_duration_muscle_0-val ((m <JointMuscleValveControllerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:set_duration_muscle_0-val is deprecated.  Use sr_robot_msgs-msg:set_duration_muscle_0 instead.")
  (set_duration_muscle_0 m))

(cl:ensure-generic-function 'set_duration_muscle_1-val :lambda-list '(m))
(cl:defmethod set_duration_muscle_1-val ((m <JointMuscleValveControllerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:set_duration_muscle_1-val is deprecated.  Use sr_robot_msgs-msg:set_duration_muscle_1 instead.")
  (set_duration_muscle_1 m))

(cl:ensure-generic-function 'current_valve_muscle_0-val :lambda-list '(m))
(cl:defmethod current_valve_muscle_0-val ((m <JointMuscleValveControllerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:current_valve_muscle_0-val is deprecated.  Use sr_robot_msgs-msg:current_valve_muscle_0 instead.")
  (current_valve_muscle_0 m))

(cl:ensure-generic-function 'current_valve_muscle_1-val :lambda-list '(m))
(cl:defmethod current_valve_muscle_1-val ((m <JointMuscleValveControllerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:current_valve_muscle_1-val is deprecated.  Use sr_robot_msgs-msg:current_valve_muscle_1 instead.")
  (current_valve_muscle_1 m))

(cl:ensure-generic-function 'current_duration_muscle_0-val :lambda-list '(m))
(cl:defmethod current_duration_muscle_0-val ((m <JointMuscleValveControllerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:current_duration_muscle_0-val is deprecated.  Use sr_robot_msgs-msg:current_duration_muscle_0 instead.")
  (current_duration_muscle_0 m))

(cl:ensure-generic-function 'current_duration_muscle_1-val :lambda-list '(m))
(cl:defmethod current_duration_muscle_1-val ((m <JointMuscleValveControllerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:current_duration_muscle_1-val is deprecated.  Use sr_robot_msgs-msg:current_duration_muscle_1 instead.")
  (current_duration_muscle_1 m))

(cl:ensure-generic-function 'packed_valve-val :lambda-list '(m))
(cl:defmethod packed_valve-val ((m <JointMuscleValveControllerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:packed_valve-val is deprecated.  Use sr_robot_msgs-msg:packed_valve instead.")
  (packed_valve m))

(cl:ensure-generic-function 'muscle_pressure_0-val :lambda-list '(m))
(cl:defmethod muscle_pressure_0-val ((m <JointMuscleValveControllerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:muscle_pressure_0-val is deprecated.  Use sr_robot_msgs-msg:muscle_pressure_0 instead.")
  (muscle_pressure_0 m))

(cl:ensure-generic-function 'muscle_pressure_1-val :lambda-list '(m))
(cl:defmethod muscle_pressure_1-val ((m <JointMuscleValveControllerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:muscle_pressure_1-val is deprecated.  Use sr_robot_msgs-msg:muscle_pressure_1 instead.")
  (muscle_pressure_1 m))

(cl:ensure-generic-function 'time_step-val :lambda-list '(m))
(cl:defmethod time_step-val ((m <JointMuscleValveControllerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:time_step-val is deprecated.  Use sr_robot_msgs-msg:time_step instead.")
  (time_step m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JointMuscleValveControllerState>) ostream)
  "Serializes a message object of type '<JointMuscleValveControllerState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'set_valve_muscle_0)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'set_valve_muscle_1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'set_duration_muscle_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'set_duration_muscle_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'set_duration_muscle_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'set_duration_muscle_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'set_duration_muscle_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'set_duration_muscle_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'set_duration_muscle_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'set_duration_muscle_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'set_duration_muscle_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'set_duration_muscle_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'set_duration_muscle_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'set_duration_muscle_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'set_duration_muscle_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'set_duration_muscle_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'set_duration_muscle_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'set_duration_muscle_1)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'current_valve_muscle_0)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'current_valve_muscle_1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'current_duration_muscle_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'current_duration_muscle_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'current_duration_muscle_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'current_duration_muscle_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'current_duration_muscle_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'current_duration_muscle_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'current_duration_muscle_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'current_duration_muscle_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'current_duration_muscle_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'current_duration_muscle_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'current_duration_muscle_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'current_duration_muscle_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'current_duration_muscle_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'current_duration_muscle_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'current_duration_muscle_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'current_duration_muscle_1)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'packed_valve))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'muscle_pressure_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'muscle_pressure_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'muscle_pressure_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'muscle_pressure_1)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'time_step))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JointMuscleValveControllerState>) istream)
  "Deserializes a message object of type '<JointMuscleValveControllerState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'set_valve_muscle_0) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'set_valve_muscle_1) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'set_duration_muscle_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'set_duration_muscle_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'set_duration_muscle_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'set_duration_muscle_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'set_duration_muscle_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'set_duration_muscle_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'set_duration_muscle_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'set_duration_muscle_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'set_duration_muscle_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'set_duration_muscle_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'set_duration_muscle_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'set_duration_muscle_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'set_duration_muscle_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'set_duration_muscle_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'set_duration_muscle_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'set_duration_muscle_1)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'current_valve_muscle_0) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'current_valve_muscle_1) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'current_duration_muscle_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'current_duration_muscle_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'current_duration_muscle_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'current_duration_muscle_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'current_duration_muscle_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'current_duration_muscle_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'current_duration_muscle_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'current_duration_muscle_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'current_duration_muscle_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'current_duration_muscle_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'current_duration_muscle_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'current_duration_muscle_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'current_duration_muscle_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'current_duration_muscle_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'current_duration_muscle_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'current_duration_muscle_1)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'packed_valve) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'muscle_pressure_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'muscle_pressure_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'muscle_pressure_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'muscle_pressure_1)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time_step) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JointMuscleValveControllerState>)))
  "Returns string type for a message object of type '<JointMuscleValveControllerState>"
  "sr_robot_msgs/JointMuscleValveControllerState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JointMuscleValveControllerState)))
  "Returns string type for a message object of type 'JointMuscleValveControllerState"
  "sr_robot_msgs/JointMuscleValveControllerState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JointMuscleValveControllerState>)))
  "Returns md5sum for a message object of type '<JointMuscleValveControllerState>"
  "fc22942516cdb4d514558e60d7263d35")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JointMuscleValveControllerState)))
  "Returns md5sum for a message object of type 'JointMuscleValveControllerState"
  "fc22942516cdb4d514558e60d7263d35")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JointMuscleValveControllerState>)))
  "Returns full string definition for message of type '<JointMuscleValveControllerState>"
  (cl:format cl:nil "Header header~%int8 set_valve_muscle_0~%int8 set_valve_muscle_1~%uint64 set_duration_muscle_0~%uint64 set_duration_muscle_1~%int8 current_valve_muscle_0~%int8 current_valve_muscle_1~%uint64 current_duration_muscle_0~%uint64 current_duration_muscle_1~%float64 packed_valve~%uint16 muscle_pressure_0~%uint16 muscle_pressure_1~%float64 time_step~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JointMuscleValveControllerState)))
  "Returns full string definition for message of type 'JointMuscleValveControllerState"
  (cl:format cl:nil "Header header~%int8 set_valve_muscle_0~%int8 set_valve_muscle_1~%uint64 set_duration_muscle_0~%uint64 set_duration_muscle_1~%int8 current_valve_muscle_0~%int8 current_valve_muscle_1~%uint64 current_duration_muscle_0~%uint64 current_duration_muscle_1~%float64 packed_valve~%uint16 muscle_pressure_0~%uint16 muscle_pressure_1~%float64 time_step~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JointMuscleValveControllerState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     8
     8
     1
     1
     8
     8
     8
     2
     2
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JointMuscleValveControllerState>))
  "Converts a ROS message object to a list"
  (cl:list 'JointMuscleValveControllerState
    (cl:cons ':header (header msg))
    (cl:cons ':set_valve_muscle_0 (set_valve_muscle_0 msg))
    (cl:cons ':set_valve_muscle_1 (set_valve_muscle_1 msg))
    (cl:cons ':set_duration_muscle_0 (set_duration_muscle_0 msg))
    (cl:cons ':set_duration_muscle_1 (set_duration_muscle_1 msg))
    (cl:cons ':current_valve_muscle_0 (current_valve_muscle_0 msg))
    (cl:cons ':current_valve_muscle_1 (current_valve_muscle_1 msg))
    (cl:cons ':current_duration_muscle_0 (current_duration_muscle_0 msg))
    (cl:cons ':current_duration_muscle_1 (current_duration_muscle_1 msg))
    (cl:cons ':packed_valve (packed_valve msg))
    (cl:cons ':muscle_pressure_0 (muscle_pressure_0 msg))
    (cl:cons ':muscle_pressure_1 (muscle_pressure_1 msg))
    (cl:cons ':time_step (time_step msg))
))
