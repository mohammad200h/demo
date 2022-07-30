; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude MotorSystemControls.msg.html

(cl:defclass <MotorSystemControls> (roslisp-msg-protocol:ros-message)
  ((motor_id
    :reader motor_id
    :initarg :motor_id
    :type cl:fixnum
    :initform 0)
   (enable_backlash_compensation
    :reader enable_backlash_compensation
    :initarg :enable_backlash_compensation
    :type cl:boolean
    :initform cl:nil)
   (increase_sgl_tracking
    :reader increase_sgl_tracking
    :initarg :increase_sgl_tracking
    :type cl:boolean
    :initform cl:nil)
   (decrease_sgl_tracking
    :reader decrease_sgl_tracking
    :initarg :decrease_sgl_tracking
    :type cl:boolean
    :initform cl:nil)
   (increase_sgr_tracking
    :reader increase_sgr_tracking
    :initarg :increase_sgr_tracking
    :type cl:boolean
    :initform cl:nil)
   (decrease_sgr_tracking
    :reader decrease_sgr_tracking
    :initarg :decrease_sgr_tracking
    :type cl:boolean
    :initform cl:nil)
   (initiate_jiggling
    :reader initiate_jiggling
    :initarg :initiate_jiggling
    :type cl:boolean
    :initform cl:nil)
   (write_config_to_eeprom
    :reader write_config_to_eeprom
    :initarg :write_config_to_eeprom
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass MotorSystemControls (<MotorSystemControls>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotorSystemControls>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotorSystemControls)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<MotorSystemControls> is deprecated: use sr_robot_msgs-msg:MotorSystemControls instead.")))

(cl:ensure-generic-function 'motor_id-val :lambda-list '(m))
(cl:defmethod motor_id-val ((m <MotorSystemControls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:motor_id-val is deprecated.  Use sr_robot_msgs-msg:motor_id instead.")
  (motor_id m))

(cl:ensure-generic-function 'enable_backlash_compensation-val :lambda-list '(m))
(cl:defmethod enable_backlash_compensation-val ((m <MotorSystemControls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:enable_backlash_compensation-val is deprecated.  Use sr_robot_msgs-msg:enable_backlash_compensation instead.")
  (enable_backlash_compensation m))

(cl:ensure-generic-function 'increase_sgl_tracking-val :lambda-list '(m))
(cl:defmethod increase_sgl_tracking-val ((m <MotorSystemControls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:increase_sgl_tracking-val is deprecated.  Use sr_robot_msgs-msg:increase_sgl_tracking instead.")
  (increase_sgl_tracking m))

(cl:ensure-generic-function 'decrease_sgl_tracking-val :lambda-list '(m))
(cl:defmethod decrease_sgl_tracking-val ((m <MotorSystemControls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:decrease_sgl_tracking-val is deprecated.  Use sr_robot_msgs-msg:decrease_sgl_tracking instead.")
  (decrease_sgl_tracking m))

(cl:ensure-generic-function 'increase_sgr_tracking-val :lambda-list '(m))
(cl:defmethod increase_sgr_tracking-val ((m <MotorSystemControls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:increase_sgr_tracking-val is deprecated.  Use sr_robot_msgs-msg:increase_sgr_tracking instead.")
  (increase_sgr_tracking m))

(cl:ensure-generic-function 'decrease_sgr_tracking-val :lambda-list '(m))
(cl:defmethod decrease_sgr_tracking-val ((m <MotorSystemControls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:decrease_sgr_tracking-val is deprecated.  Use sr_robot_msgs-msg:decrease_sgr_tracking instead.")
  (decrease_sgr_tracking m))

(cl:ensure-generic-function 'initiate_jiggling-val :lambda-list '(m))
(cl:defmethod initiate_jiggling-val ((m <MotorSystemControls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:initiate_jiggling-val is deprecated.  Use sr_robot_msgs-msg:initiate_jiggling instead.")
  (initiate_jiggling m))

(cl:ensure-generic-function 'write_config_to_eeprom-val :lambda-list '(m))
(cl:defmethod write_config_to_eeprom-val ((m <MotorSystemControls>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:write_config_to_eeprom-val is deprecated.  Use sr_robot_msgs-msg:write_config_to_eeprom instead.")
  (write_config_to_eeprom m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotorSystemControls>) ostream)
  "Serializes a message object of type '<MotorSystemControls>"
  (cl:let* ((signed (cl:slot-value msg 'motor_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'enable_backlash_compensation) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'increase_sgl_tracking) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'decrease_sgl_tracking) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'increase_sgr_tracking) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'decrease_sgr_tracking) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'initiate_jiggling) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'write_config_to_eeprom) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotorSystemControls>) istream)
  "Deserializes a message object of type '<MotorSystemControls>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'motor_id) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:slot-value msg 'enable_backlash_compensation) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'increase_sgl_tracking) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'decrease_sgl_tracking) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'increase_sgr_tracking) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'decrease_sgr_tracking) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'initiate_jiggling) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'write_config_to_eeprom) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotorSystemControls>)))
  "Returns string type for a message object of type '<MotorSystemControls>"
  "sr_robot_msgs/MotorSystemControls")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotorSystemControls)))
  "Returns string type for a message object of type 'MotorSystemControls"
  "sr_robot_msgs/MotorSystemControls")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotorSystemControls>)))
  "Returns md5sum for a message object of type '<MotorSystemControls>"
  "0686822f46acfde0133711bd613a20f1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotorSystemControls)))
  "Returns md5sum for a message object of type 'MotorSystemControls"
  "0686822f46acfde0133711bd613a20f1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotorSystemControls>)))
  "Returns full string definition for message of type '<MotorSystemControls>"
  (cl:format cl:nil "int8 motor_id                     # the id of the motor you want to control~%~%bool enable_backlash_compensation # switch on/off backlash compensation at the motor level~%bool increase_sgl_tracking        # increment the tracking value for the left gauge~%bool decrease_sgl_tracking        # decrement the tracking value for the left gauge~%bool increase_sgr_tracking        # increment the tracking value for the right gauge~%bool decrease_sgr_tracking        # decrement the tracking value for the right gauge~%bool initiate_jiggling            # starts jiggling the given motor~%bool write_config_to_eeprom       # write the current configuration to the eeprom~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotorSystemControls)))
  "Returns full string definition for message of type 'MotorSystemControls"
  (cl:format cl:nil "int8 motor_id                     # the id of the motor you want to control~%~%bool enable_backlash_compensation # switch on/off backlash compensation at the motor level~%bool increase_sgl_tracking        # increment the tracking value for the left gauge~%bool decrease_sgl_tracking        # decrement the tracking value for the left gauge~%bool increase_sgr_tracking        # increment the tracking value for the right gauge~%bool decrease_sgr_tracking        # decrement the tracking value for the right gauge~%bool initiate_jiggling            # starts jiggling the given motor~%bool write_config_to_eeprom       # write the current configuration to the eeprom~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotorSystemControls>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotorSystemControls>))
  "Converts a ROS message object to a list"
  (cl:list 'MotorSystemControls
    (cl:cons ':motor_id (motor_id msg))
    (cl:cons ':enable_backlash_compensation (enable_backlash_compensation msg))
    (cl:cons ':increase_sgl_tracking (increase_sgl_tracking msg))
    (cl:cons ':decrease_sgl_tracking (decrease_sgl_tracking msg))
    (cl:cons ':increase_sgr_tracking (increase_sgr_tracking msg))
    (cl:cons ':decrease_sgr_tracking (decrease_sgr_tracking msg))
    (cl:cons ':initiate_jiggling (initiate_jiggling msg))
    (cl:cons ':write_config_to_eeprom (write_config_to_eeprom msg))
))
