; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude ChangeMotorSystemControls-request.msg.html

(cl:defclass <ChangeMotorSystemControls-request> (roslisp-msg-protocol:ros-message)
  ((motor_system_controls
    :reader motor_system_controls
    :initarg :motor_system_controls
    :type (cl:vector sr_robot_msgs-msg:MotorSystemControls)
   :initform (cl:make-array 0 :element-type 'sr_robot_msgs-msg:MotorSystemControls :initial-element (cl:make-instance 'sr_robot_msgs-msg:MotorSystemControls))))
)

(cl:defclass ChangeMotorSystemControls-request (<ChangeMotorSystemControls-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChangeMotorSystemControls-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChangeMotorSystemControls-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<ChangeMotorSystemControls-request> is deprecated: use sr_robot_msgs-srv:ChangeMotorSystemControls-request instead.")))

(cl:ensure-generic-function 'motor_system_controls-val :lambda-list '(m))
(cl:defmethod motor_system_controls-val ((m <ChangeMotorSystemControls-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:motor_system_controls-val is deprecated.  Use sr_robot_msgs-srv:motor_system_controls instead.")
  (motor_system_controls m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChangeMotorSystemControls-request>) ostream)
  "Serializes a message object of type '<ChangeMotorSystemControls-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'motor_system_controls))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'motor_system_controls))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChangeMotorSystemControls-request>) istream)
  "Deserializes a message object of type '<ChangeMotorSystemControls-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'motor_system_controls) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'motor_system_controls)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sr_robot_msgs-msg:MotorSystemControls))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChangeMotorSystemControls-request>)))
  "Returns string type for a service object of type '<ChangeMotorSystemControls-request>"
  "sr_robot_msgs/ChangeMotorSystemControlsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeMotorSystemControls-request)))
  "Returns string type for a service object of type 'ChangeMotorSystemControls-request"
  "sr_robot_msgs/ChangeMotorSystemControlsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChangeMotorSystemControls-request>)))
  "Returns md5sum for a message object of type '<ChangeMotorSystemControls-request>"
  "d953bca2f568403b8e2c3f41c87d9ac4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChangeMotorSystemControls-request)))
  "Returns md5sum for a message object of type 'ChangeMotorSystemControls-request"
  "d953bca2f568403b8e2c3f41c87d9ac4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChangeMotorSystemControls-request>)))
  "Returns full string definition for message of type '<ChangeMotorSystemControls-request>"
  (cl:format cl:nil "MotorSystemControls[] motor_system_controls~%~%================================================================================~%MSG: sr_robot_msgs/MotorSystemControls~%int8 motor_id                     # the id of the motor you want to control~%~%bool enable_backlash_compensation # switch on/off backlash compensation at the motor level~%bool increase_sgl_tracking        # increment the tracking value for the left gauge~%bool decrease_sgl_tracking        # decrement the tracking value for the left gauge~%bool increase_sgr_tracking        # increment the tracking value for the right gauge~%bool decrease_sgr_tracking        # decrement the tracking value for the right gauge~%bool initiate_jiggling            # starts jiggling the given motor~%bool write_config_to_eeprom       # write the current configuration to the eeprom~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChangeMotorSystemControls-request)))
  "Returns full string definition for message of type 'ChangeMotorSystemControls-request"
  (cl:format cl:nil "MotorSystemControls[] motor_system_controls~%~%================================================================================~%MSG: sr_robot_msgs/MotorSystemControls~%int8 motor_id                     # the id of the motor you want to control~%~%bool enable_backlash_compensation # switch on/off backlash compensation at the motor level~%bool increase_sgl_tracking        # increment the tracking value for the left gauge~%bool decrease_sgl_tracking        # decrement the tracking value for the left gauge~%bool increase_sgr_tracking        # increment the tracking value for the right gauge~%bool decrease_sgr_tracking        # decrement the tracking value for the right gauge~%bool initiate_jiggling            # starts jiggling the given motor~%bool write_config_to_eeprom       # write the current configuration to the eeprom~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChangeMotorSystemControls-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'motor_system_controls) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChangeMotorSystemControls-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ChangeMotorSystemControls-request
    (cl:cons ':motor_system_controls (motor_system_controls msg))
))
;//! \htmlinclude ChangeMotorSystemControls-response.msg.html

(cl:defclass <ChangeMotorSystemControls-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ChangeMotorSystemControls-response (<ChangeMotorSystemControls-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChangeMotorSystemControls-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChangeMotorSystemControls-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<ChangeMotorSystemControls-response> is deprecated: use sr_robot_msgs-srv:ChangeMotorSystemControls-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <ChangeMotorSystemControls-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:result-val is deprecated.  Use sr_robot_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ChangeMotorSystemControls-response>)))
    "Constants for message type '<ChangeMotorSystemControls-response>"
  '((:SUCCESS . 0)
    (:MOTOR_ID_OUT_OF_RANGE . -1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ChangeMotorSystemControls-response)))
    "Constants for message type 'ChangeMotorSystemControls-response"
  '((:SUCCESS . 0)
    (:MOTOR_ID_OUT_OF_RANGE . -1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChangeMotorSystemControls-response>) ostream)
  "Serializes a message object of type '<ChangeMotorSystemControls-response>"
  (cl:let* ((signed (cl:slot-value msg 'result)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChangeMotorSystemControls-response>) istream)
  "Deserializes a message object of type '<ChangeMotorSystemControls-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChangeMotorSystemControls-response>)))
  "Returns string type for a service object of type '<ChangeMotorSystemControls-response>"
  "sr_robot_msgs/ChangeMotorSystemControlsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeMotorSystemControls-response)))
  "Returns string type for a service object of type 'ChangeMotorSystemControls-response"
  "sr_robot_msgs/ChangeMotorSystemControlsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChangeMotorSystemControls-response>)))
  "Returns md5sum for a message object of type '<ChangeMotorSystemControls-response>"
  "d953bca2f568403b8e2c3f41c87d9ac4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChangeMotorSystemControls-response)))
  "Returns md5sum for a message object of type 'ChangeMotorSystemControls-response"
  "d953bca2f568403b8e2c3f41c87d9ac4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChangeMotorSystemControls-response>)))
  "Returns full string definition for message of type '<ChangeMotorSystemControls-response>"
  (cl:format cl:nil "int8 result~%~%int8 SUCCESS=0~%int8 MOTOR_ID_OUT_OF_RANGE=-1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChangeMotorSystemControls-response)))
  "Returns full string definition for message of type 'ChangeMotorSystemControls-response"
  (cl:format cl:nil "int8 result~%~%int8 SUCCESS=0~%int8 MOTOR_ID_OUT_OF_RANGE=-1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChangeMotorSystemControls-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChangeMotorSystemControls-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ChangeMotorSystemControls-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ChangeMotorSystemControls)))
  'ChangeMotorSystemControls-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ChangeMotorSystemControls)))
  'ChangeMotorSystemControls-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeMotorSystemControls)))
  "Returns string type for a service object of type '<ChangeMotorSystemControls>"
  "sr_robot_msgs/ChangeMotorSystemControls")