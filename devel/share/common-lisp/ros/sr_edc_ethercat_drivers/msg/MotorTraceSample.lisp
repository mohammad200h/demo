; Auto-generated. Do not edit!


(cl:in-package sr_edc_ethercat_drivers-msg)


;//! \htmlinclude MotorTraceSample.msg.html

(cl:defclass <MotorTraceSample> (roslisp-msg-protocol:ros-message)
  ((commanded_effort
    :reader commanded_effort
    :initarg :commanded_effort
    :type cl:float
    :initform 0.0)
   (slow_effort_limit
    :reader slow_effort_limit
    :initarg :slow_effort_limit
    :type cl:float
    :initform 0.0)
   (quick_effort_limit
    :reader quick_effort_limit
    :initarg :quick_effort_limit
    :type cl:float
    :initform 0.0)
   (motor_current
    :reader motor_current
    :initarg :motor_current
    :type cl:float
    :initform 0.0)
   (motor_supply_voltage
    :reader motor_supply_voltage
    :initarg :motor_supply_voltage
    :type cl:float
    :initform 0.0)
   (hbridge_duty
    :reader hbridge_duty
    :initarg :hbridge_duty
    :type cl:float
    :initform 0.0)
   (temperature
    :reader temperature
    :initarg :temperature
    :type cl:float
    :initform 0.0)
   (force_sensor_1
    :reader force_sensor_1
    :initarg :force_sensor_1
    :type cl:float
    :initform 0.0)
   (force_sensor_2
    :reader force_sensor_2
    :initarg :force_sensor_2
    :type cl:float
    :initform 0.0)
   (force_sensor_3
    :reader force_sensor_3
    :initarg :force_sensor_3
    :type cl:float
    :initform 0.0)
   (motor_velocity
    :reader motor_velocity
    :initarg :motor_velocity
    :type cl:float
    :initform 0.0)
   (velocity
    :reader velocity
    :initarg :velocity
    :type cl:float
    :initform 0.0)
   (position
    :reader position
    :initarg :position
    :type cl:float
    :initform 0.0))
)

(cl:defclass MotorTraceSample (<MotorTraceSample>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotorTraceSample>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotorTraceSample)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_edc_ethercat_drivers-msg:<MotorTraceSample> is deprecated: use sr_edc_ethercat_drivers-msg:MotorTraceSample instead.")))

(cl:ensure-generic-function 'commanded_effort-val :lambda-list '(m))
(cl:defmethod commanded_effort-val ((m <MotorTraceSample>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:commanded_effort-val is deprecated.  Use sr_edc_ethercat_drivers-msg:commanded_effort instead.")
  (commanded_effort m))

(cl:ensure-generic-function 'slow_effort_limit-val :lambda-list '(m))
(cl:defmethod slow_effort_limit-val ((m <MotorTraceSample>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:slow_effort_limit-val is deprecated.  Use sr_edc_ethercat_drivers-msg:slow_effort_limit instead.")
  (slow_effort_limit m))

(cl:ensure-generic-function 'quick_effort_limit-val :lambda-list '(m))
(cl:defmethod quick_effort_limit-val ((m <MotorTraceSample>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:quick_effort_limit-val is deprecated.  Use sr_edc_ethercat_drivers-msg:quick_effort_limit instead.")
  (quick_effort_limit m))

(cl:ensure-generic-function 'motor_current-val :lambda-list '(m))
(cl:defmethod motor_current-val ((m <MotorTraceSample>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:motor_current-val is deprecated.  Use sr_edc_ethercat_drivers-msg:motor_current instead.")
  (motor_current m))

(cl:ensure-generic-function 'motor_supply_voltage-val :lambda-list '(m))
(cl:defmethod motor_supply_voltage-val ((m <MotorTraceSample>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:motor_supply_voltage-val is deprecated.  Use sr_edc_ethercat_drivers-msg:motor_supply_voltage instead.")
  (motor_supply_voltage m))

(cl:ensure-generic-function 'hbridge_duty-val :lambda-list '(m))
(cl:defmethod hbridge_duty-val ((m <MotorTraceSample>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:hbridge_duty-val is deprecated.  Use sr_edc_ethercat_drivers-msg:hbridge_duty instead.")
  (hbridge_duty m))

(cl:ensure-generic-function 'temperature-val :lambda-list '(m))
(cl:defmethod temperature-val ((m <MotorTraceSample>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:temperature-val is deprecated.  Use sr_edc_ethercat_drivers-msg:temperature instead.")
  (temperature m))

(cl:ensure-generic-function 'force_sensor_1-val :lambda-list '(m))
(cl:defmethod force_sensor_1-val ((m <MotorTraceSample>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:force_sensor_1-val is deprecated.  Use sr_edc_ethercat_drivers-msg:force_sensor_1 instead.")
  (force_sensor_1 m))

(cl:ensure-generic-function 'force_sensor_2-val :lambda-list '(m))
(cl:defmethod force_sensor_2-val ((m <MotorTraceSample>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:force_sensor_2-val is deprecated.  Use sr_edc_ethercat_drivers-msg:force_sensor_2 instead.")
  (force_sensor_2 m))

(cl:ensure-generic-function 'force_sensor_3-val :lambda-list '(m))
(cl:defmethod force_sensor_3-val ((m <MotorTraceSample>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:force_sensor_3-val is deprecated.  Use sr_edc_ethercat_drivers-msg:force_sensor_3 instead.")
  (force_sensor_3 m))

(cl:ensure-generic-function 'motor_velocity-val :lambda-list '(m))
(cl:defmethod motor_velocity-val ((m <MotorTraceSample>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:motor_velocity-val is deprecated.  Use sr_edc_ethercat_drivers-msg:motor_velocity instead.")
  (motor_velocity m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <MotorTraceSample>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:velocity-val is deprecated.  Use sr_edc_ethercat_drivers-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <MotorTraceSample>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_edc_ethercat_drivers-msg:position-val is deprecated.  Use sr_edc_ethercat_drivers-msg:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotorTraceSample>) ostream)
  "Serializes a message object of type '<MotorTraceSample>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'commanded_effort))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'slow_effort_limit))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'quick_effort_limit))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'motor_current))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'motor_supply_voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'hbridge_duty))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'temperature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'force_sensor_1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'force_sensor_2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'force_sensor_3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'motor_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotorTraceSample>) istream)
  "Deserializes a message object of type '<MotorTraceSample>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'commanded_effort) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'slow_effort_limit) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'quick_effort_limit) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motor_current) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motor_supply_voltage) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'hbridge_duty) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'temperature) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'force_sensor_1) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'force_sensor_2) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'force_sensor_3) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motor_velocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotorTraceSample>)))
  "Returns string type for a message object of type '<MotorTraceSample>"
  "sr_edc_ethercat_drivers/MotorTraceSample")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotorTraceSample)))
  "Returns string type for a message object of type 'MotorTraceSample"
  "sr_edc_ethercat_drivers/MotorTraceSample")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotorTraceSample>)))
  "Returns md5sum for a message object of type '<MotorTraceSample>"
  "f5faf420d7c29e68b1c6bfdff440ffb8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotorTraceSample)))
  "Returns md5sum for a message object of type 'MotorTraceSample"
  "f5faf420d7c29e68b1c6bfdff440ffb8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotorTraceSample>)))
  "Returns full string definition for message of type '<MotorTraceSample>"
  (cl:format cl:nil "float64 commanded_effort~%float64 slow_effort_limit~%float64 quick_effort_limit~%float64 motor_current~%float64 motor_supply_voltage~%float64 hbridge_duty~%float64 temperature~%float64 force_sensor_1~%float64 force_sensor_2~%float64 force_sensor_3~%float64 motor_velocity~%float64 velocity~%float64 position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotorTraceSample)))
  "Returns full string definition for message of type 'MotorTraceSample"
  (cl:format cl:nil "float64 commanded_effort~%float64 slow_effort_limit~%float64 quick_effort_limit~%float64 motor_current~%float64 motor_supply_voltage~%float64 hbridge_duty~%float64 temperature~%float64 force_sensor_1~%float64 force_sensor_2~%float64 force_sensor_3~%float64 motor_velocity~%float64 velocity~%float64 position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotorTraceSample>))
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
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotorTraceSample>))
  "Converts a ROS message object to a list"
  (cl:list 'MotorTraceSample
    (cl:cons ':commanded_effort (commanded_effort msg))
    (cl:cons ':slow_effort_limit (slow_effort_limit msg))
    (cl:cons ':quick_effort_limit (quick_effort_limit msg))
    (cl:cons ':motor_current (motor_current msg))
    (cl:cons ':motor_supply_voltage (motor_supply_voltage msg))
    (cl:cons ':hbridge_duty (hbridge_duty msg))
    (cl:cons ':temperature (temperature msg))
    (cl:cons ':force_sensor_1 (force_sensor_1 msg))
    (cl:cons ':force_sensor_2 (force_sensor_2 msg))
    (cl:cons ':force_sensor_3 (force_sensor_3 msg))
    (cl:cons ':motor_velocity (motor_velocity msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':position (position msg))
))
