; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude SetMixedPositionVelocityPidGains-request.msg.html

(cl:defclass <SetMixedPositionVelocityPidGains-request> (roslisp-msg-protocol:ros-message)
  ((position_p
    :reader position_p
    :initarg :position_p
    :type cl:float
    :initform 0.0)
   (position_i
    :reader position_i
    :initarg :position_i
    :type cl:float
    :initform 0.0)
   (position_d
    :reader position_d
    :initarg :position_d
    :type cl:float
    :initform 0.0)
   (position_i_clamp
    :reader position_i_clamp
    :initarg :position_i_clamp
    :type cl:float
    :initform 0.0)
   (min_velocity
    :reader min_velocity
    :initarg :min_velocity
    :type cl:float
    :initform 0.0)
   (max_velocity
    :reader max_velocity
    :initarg :max_velocity
    :type cl:float
    :initform 0.0)
   (position_deadband
    :reader position_deadband
    :initarg :position_deadband
    :type cl:float
    :initform 0.0)
   (velocity_p
    :reader velocity_p
    :initarg :velocity_p
    :type cl:float
    :initform 0.0)
   (velocity_i
    :reader velocity_i
    :initarg :velocity_i
    :type cl:float
    :initform 0.0)
   (velocity_d
    :reader velocity_d
    :initarg :velocity_d
    :type cl:float
    :initform 0.0)
   (velocity_i_clamp
    :reader velocity_i_clamp
    :initarg :velocity_i_clamp
    :type cl:float
    :initform 0.0)
   (max_force
    :reader max_force
    :initarg :max_force
    :type cl:float
    :initform 0.0)
   (friction_deadband
    :reader friction_deadband
    :initarg :friction_deadband
    :type cl:integer
    :initform 0))
)

(cl:defclass SetMixedPositionVelocityPidGains-request (<SetMixedPositionVelocityPidGains-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetMixedPositionVelocityPidGains-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetMixedPositionVelocityPidGains-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<SetMixedPositionVelocityPidGains-request> is deprecated: use sr_robot_msgs-srv:SetMixedPositionVelocityPidGains-request instead.")))

(cl:ensure-generic-function 'position_p-val :lambda-list '(m))
(cl:defmethod position_p-val ((m <SetMixedPositionVelocityPidGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:position_p-val is deprecated.  Use sr_robot_msgs-srv:position_p instead.")
  (position_p m))

(cl:ensure-generic-function 'position_i-val :lambda-list '(m))
(cl:defmethod position_i-val ((m <SetMixedPositionVelocityPidGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:position_i-val is deprecated.  Use sr_robot_msgs-srv:position_i instead.")
  (position_i m))

(cl:ensure-generic-function 'position_d-val :lambda-list '(m))
(cl:defmethod position_d-val ((m <SetMixedPositionVelocityPidGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:position_d-val is deprecated.  Use sr_robot_msgs-srv:position_d instead.")
  (position_d m))

(cl:ensure-generic-function 'position_i_clamp-val :lambda-list '(m))
(cl:defmethod position_i_clamp-val ((m <SetMixedPositionVelocityPidGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:position_i_clamp-val is deprecated.  Use sr_robot_msgs-srv:position_i_clamp instead.")
  (position_i_clamp m))

(cl:ensure-generic-function 'min_velocity-val :lambda-list '(m))
(cl:defmethod min_velocity-val ((m <SetMixedPositionVelocityPidGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:min_velocity-val is deprecated.  Use sr_robot_msgs-srv:min_velocity instead.")
  (min_velocity m))

(cl:ensure-generic-function 'max_velocity-val :lambda-list '(m))
(cl:defmethod max_velocity-val ((m <SetMixedPositionVelocityPidGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:max_velocity-val is deprecated.  Use sr_robot_msgs-srv:max_velocity instead.")
  (max_velocity m))

(cl:ensure-generic-function 'position_deadband-val :lambda-list '(m))
(cl:defmethod position_deadband-val ((m <SetMixedPositionVelocityPidGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:position_deadband-val is deprecated.  Use sr_robot_msgs-srv:position_deadband instead.")
  (position_deadband m))

(cl:ensure-generic-function 'velocity_p-val :lambda-list '(m))
(cl:defmethod velocity_p-val ((m <SetMixedPositionVelocityPidGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:velocity_p-val is deprecated.  Use sr_robot_msgs-srv:velocity_p instead.")
  (velocity_p m))

(cl:ensure-generic-function 'velocity_i-val :lambda-list '(m))
(cl:defmethod velocity_i-val ((m <SetMixedPositionVelocityPidGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:velocity_i-val is deprecated.  Use sr_robot_msgs-srv:velocity_i instead.")
  (velocity_i m))

(cl:ensure-generic-function 'velocity_d-val :lambda-list '(m))
(cl:defmethod velocity_d-val ((m <SetMixedPositionVelocityPidGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:velocity_d-val is deprecated.  Use sr_robot_msgs-srv:velocity_d instead.")
  (velocity_d m))

(cl:ensure-generic-function 'velocity_i_clamp-val :lambda-list '(m))
(cl:defmethod velocity_i_clamp-val ((m <SetMixedPositionVelocityPidGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:velocity_i_clamp-val is deprecated.  Use sr_robot_msgs-srv:velocity_i_clamp instead.")
  (velocity_i_clamp m))

(cl:ensure-generic-function 'max_force-val :lambda-list '(m))
(cl:defmethod max_force-val ((m <SetMixedPositionVelocityPidGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:max_force-val is deprecated.  Use sr_robot_msgs-srv:max_force instead.")
  (max_force m))

(cl:ensure-generic-function 'friction_deadband-val :lambda-list '(m))
(cl:defmethod friction_deadband-val ((m <SetMixedPositionVelocityPidGains-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:friction_deadband-val is deprecated.  Use sr_robot_msgs-srv:friction_deadband instead.")
  (friction_deadband m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetMixedPositionVelocityPidGains-request>) ostream)
  "Serializes a message object of type '<SetMixedPositionVelocityPidGains-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'position_p))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'position_i))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'position_d))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'position_i_clamp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'min_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'max_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'position_deadband))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'velocity_p))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'velocity_i))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'velocity_d))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'velocity_i_clamp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'max_force))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'friction_deadband)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetMixedPositionVelocityPidGains-request>) istream)
  "Deserializes a message object of type '<SetMixedPositionVelocityPidGains-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position_p) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position_i) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position_d) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position_i_clamp) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'min_velocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_velocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position_deadband) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity_p) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity_i) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity_d) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity_i_clamp) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_force) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'friction_deadband) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetMixedPositionVelocityPidGains-request>)))
  "Returns string type for a service object of type '<SetMixedPositionVelocityPidGains-request>"
  "sr_robot_msgs/SetMixedPositionVelocityPidGainsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMixedPositionVelocityPidGains-request)))
  "Returns string type for a service object of type 'SetMixedPositionVelocityPidGains-request"
  "sr_robot_msgs/SetMixedPositionVelocityPidGainsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetMixedPositionVelocityPidGains-request>)))
  "Returns md5sum for a message object of type '<SetMixedPositionVelocityPidGains-request>"
  "ff95ce4d442c9454d3d943f0c999da89")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetMixedPositionVelocityPidGains-request)))
  "Returns md5sum for a message object of type 'SetMixedPositionVelocityPidGains-request"
  "ff95ce4d442c9454d3d943f0c999da89")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetMixedPositionVelocityPidGains-request>)))
  "Returns full string definition for message of type '<SetMixedPositionVelocityPidGains-request>"
  (cl:format cl:nil "float64 position_p~%float64 position_i~%float64 position_d~%float64 position_i_clamp~%float64 min_velocity~%float64 max_velocity~%float64 position_deadband~%~%float64 velocity_p~%float64 velocity_i~%float64 velocity_d~%float64 velocity_i_clamp~%float64 max_force~%~%int32 friction_deadband~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetMixedPositionVelocityPidGains-request)))
  "Returns full string definition for message of type 'SetMixedPositionVelocityPidGains-request"
  (cl:format cl:nil "float64 position_p~%float64 position_i~%float64 position_d~%float64 position_i_clamp~%float64 min_velocity~%float64 max_velocity~%float64 position_deadband~%~%float64 velocity_p~%float64 velocity_i~%float64 velocity_d~%float64 velocity_i_clamp~%float64 max_force~%~%int32 friction_deadband~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetMixedPositionVelocityPidGains-request>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetMixedPositionVelocityPidGains-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetMixedPositionVelocityPidGains-request
    (cl:cons ':position_p (position_p msg))
    (cl:cons ':position_i (position_i msg))
    (cl:cons ':position_d (position_d msg))
    (cl:cons ':position_i_clamp (position_i_clamp msg))
    (cl:cons ':min_velocity (min_velocity msg))
    (cl:cons ':max_velocity (max_velocity msg))
    (cl:cons ':position_deadband (position_deadband msg))
    (cl:cons ':velocity_p (velocity_p msg))
    (cl:cons ':velocity_i (velocity_i msg))
    (cl:cons ':velocity_d (velocity_d msg))
    (cl:cons ':velocity_i_clamp (velocity_i_clamp msg))
    (cl:cons ':max_force (max_force msg))
    (cl:cons ':friction_deadband (friction_deadband msg))
))
;//! \htmlinclude SetMixedPositionVelocityPidGains-response.msg.html

(cl:defclass <SetMixedPositionVelocityPidGains-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetMixedPositionVelocityPidGains-response (<SetMixedPositionVelocityPidGains-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetMixedPositionVelocityPidGains-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetMixedPositionVelocityPidGains-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<SetMixedPositionVelocityPidGains-response> is deprecated: use sr_robot_msgs-srv:SetMixedPositionVelocityPidGains-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetMixedPositionVelocityPidGains-response>) ostream)
  "Serializes a message object of type '<SetMixedPositionVelocityPidGains-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetMixedPositionVelocityPidGains-response>) istream)
  "Deserializes a message object of type '<SetMixedPositionVelocityPidGains-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetMixedPositionVelocityPidGains-response>)))
  "Returns string type for a service object of type '<SetMixedPositionVelocityPidGains-response>"
  "sr_robot_msgs/SetMixedPositionVelocityPidGainsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMixedPositionVelocityPidGains-response)))
  "Returns string type for a service object of type 'SetMixedPositionVelocityPidGains-response"
  "sr_robot_msgs/SetMixedPositionVelocityPidGainsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetMixedPositionVelocityPidGains-response>)))
  "Returns md5sum for a message object of type '<SetMixedPositionVelocityPidGains-response>"
  "ff95ce4d442c9454d3d943f0c999da89")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetMixedPositionVelocityPidGains-response)))
  "Returns md5sum for a message object of type 'SetMixedPositionVelocityPidGains-response"
  "ff95ce4d442c9454d3d943f0c999da89")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetMixedPositionVelocityPidGains-response>)))
  "Returns full string definition for message of type '<SetMixedPositionVelocityPidGains-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetMixedPositionVelocityPidGains-response)))
  "Returns full string definition for message of type 'SetMixedPositionVelocityPidGains-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetMixedPositionVelocityPidGains-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetMixedPositionVelocityPidGains-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetMixedPositionVelocityPidGains-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetMixedPositionVelocityPidGains)))
  'SetMixedPositionVelocityPidGains-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetMixedPositionVelocityPidGains)))
  'SetMixedPositionVelocityPidGains-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMixedPositionVelocityPidGains)))
  "Returns string type for a service object of type '<SetMixedPositionVelocityPidGains>"
  "sr_robot_msgs/SetMixedPositionVelocityPidGains")