; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude command.msg.html

(cl:defclass <command> (roslisp-msg-protocol:ros-message)
  ((command_type
    :reader command_type
    :initarg :command_type
    :type cl:fixnum
    :initform 0)
   (sendupdate_command
    :reader sendupdate_command
    :initarg :sendupdate_command
    :type sr_robot_msgs-msg:sendupdate
    :initform (cl:make-instance 'sr_robot_msgs-msg:sendupdate))
   (contrlr_command
    :reader contrlr_command
    :initarg :contrlr_command
    :type sr_robot_msgs-msg:contrlr
    :initform (cl:make-instance 'sr_robot_msgs-msg:contrlr)))
)

(cl:defclass command (<command>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <command>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'command)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<command> is deprecated: use sr_robot_msgs-msg:command instead.")))

(cl:ensure-generic-function 'command_type-val :lambda-list '(m))
(cl:defmethod command_type-val ((m <command>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:command_type-val is deprecated.  Use sr_robot_msgs-msg:command_type instead.")
  (command_type m))

(cl:ensure-generic-function 'sendupdate_command-val :lambda-list '(m))
(cl:defmethod sendupdate_command-val ((m <command>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:sendupdate_command-val is deprecated.  Use sr_robot_msgs-msg:sendupdate_command instead.")
  (sendupdate_command m))

(cl:ensure-generic-function 'contrlr_command-val :lambda-list '(m))
(cl:defmethod contrlr_command-val ((m <command>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:contrlr_command-val is deprecated.  Use sr_robot_msgs-msg:contrlr_command instead.")
  (contrlr_command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <command>) ostream)
  "Serializes a message object of type '<command>"
  (cl:let* ((signed (cl:slot-value msg 'command_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'sendupdate_command) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'contrlr_command) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <command>) istream)
  "Deserializes a message object of type '<command>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command_type) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'sendupdate_command) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'contrlr_command) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<command>)))
  "Returns string type for a message object of type '<command>"
  "sr_robot_msgs/command")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'command)))
  "Returns string type for a message object of type 'command"
  "sr_robot_msgs/command")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<command>)))
  "Returns md5sum for a message object of type '<command>"
  "2c927cc3decc25060b43219a05beb823")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'command)))
  "Returns md5sum for a message object of type 'command"
  "2c927cc3decc25060b43219a05beb823")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<command>)))
  "Returns full string definition for message of type '<command>"
  (cl:format cl:nil "# sendupdate is 1~%# contrlr is 2~%int8 command_type~%~%sendupdate sendupdate_command~%contrlr contrlr_command~%~%================================================================================~%MSG: sr_robot_msgs/sendupdate~%int8 sendupdate_length~%joint[] sendupdate_list~%~%~%================================================================================~%MSG: sr_robot_msgs/joint~%string  joint_name~%float64 joint_position~%float64 joint_target~%float64 joint_torque~%float64 joint_temperature~%float64 joint_current~%string  error_flag~%~%================================================================================~%MSG: sr_robot_msgs/contrlr~%# the contrlr name (e.g. smart_motor_ff2)~%string   contrlr_name~%~%# specify here a list of parameter_name:value~%# e.g. p:10 sets the p value of the controller to 10~%# the possible parameters are:~%#int16  p~%#int16  i~%#int16  d~%#int16  imax~%#int16  target~%#int16  sensor~%#int16  valve ~%#int16  deadband~%#int16  offset~%#int16  shift~%#int16  max~%#~%## parameters for the motors~%#int16  motor_maxforce~%#int16  motor_safeforce~%#int16  force_p~%#int16  force_i~%#int16  force_d~%#int16  force_imax~%#int16  force_out_shift~%#int16  force_deadband~%#int16  force_offset~%#int16  sensor_imax~%#int16  sensor_deadband~%#int16  sensor_offset~%#int16  max_temperature~%#int16  max_current~%~%string[] list_of_parameters~%~%# the size of the list_of_parameters you are sending~%uint8 	 length_of_list~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'command)))
  "Returns full string definition for message of type 'command"
  (cl:format cl:nil "# sendupdate is 1~%# contrlr is 2~%int8 command_type~%~%sendupdate sendupdate_command~%contrlr contrlr_command~%~%================================================================================~%MSG: sr_robot_msgs/sendupdate~%int8 sendupdate_length~%joint[] sendupdate_list~%~%~%================================================================================~%MSG: sr_robot_msgs/joint~%string  joint_name~%float64 joint_position~%float64 joint_target~%float64 joint_torque~%float64 joint_temperature~%float64 joint_current~%string  error_flag~%~%================================================================================~%MSG: sr_robot_msgs/contrlr~%# the contrlr name (e.g. smart_motor_ff2)~%string   contrlr_name~%~%# specify here a list of parameter_name:value~%# e.g. p:10 sets the p value of the controller to 10~%# the possible parameters are:~%#int16  p~%#int16  i~%#int16  d~%#int16  imax~%#int16  target~%#int16  sensor~%#int16  valve ~%#int16  deadband~%#int16  offset~%#int16  shift~%#int16  max~%#~%## parameters for the motors~%#int16  motor_maxforce~%#int16  motor_safeforce~%#int16  force_p~%#int16  force_i~%#int16  force_d~%#int16  force_imax~%#int16  force_out_shift~%#int16  force_deadband~%#int16  force_offset~%#int16  sensor_imax~%#int16  sensor_deadband~%#int16  sensor_offset~%#int16  max_temperature~%#int16  max_current~%~%string[] list_of_parameters~%~%# the size of the list_of_parameters you are sending~%uint8 	 length_of_list~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <command>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'sendupdate_command))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'contrlr_command))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <command>))
  "Converts a ROS message object to a list"
  (cl:list 'command
    (cl:cons ':command_type (command_type msg))
    (cl:cons ':sendupdate_command (sendupdate_command msg))
    (cl:cons ':contrlr_command (contrlr_command msg))
))
