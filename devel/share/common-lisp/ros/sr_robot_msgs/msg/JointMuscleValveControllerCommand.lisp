; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude JointMuscleValveControllerCommand.msg.html

(cl:defclass <JointMuscleValveControllerCommand> (roslisp-msg-protocol:ros-message)
  ((cmd_valve_muscle
    :reader cmd_valve_muscle
    :initarg :cmd_valve_muscle
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 2 :element-type 'cl:fixnum :initial-element 0))
   (cmd_duration_ms
    :reader cmd_duration_ms
    :initarg :cmd_duration_ms
    :type (cl:vector cl:integer)
   :initform (cl:make-array 2 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass JointMuscleValveControllerCommand (<JointMuscleValveControllerCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JointMuscleValveControllerCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JointMuscleValveControllerCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<JointMuscleValveControllerCommand> is deprecated: use sr_robot_msgs-msg:JointMuscleValveControllerCommand instead.")))

(cl:ensure-generic-function 'cmd_valve_muscle-val :lambda-list '(m))
(cl:defmethod cmd_valve_muscle-val ((m <JointMuscleValveControllerCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:cmd_valve_muscle-val is deprecated.  Use sr_robot_msgs-msg:cmd_valve_muscle instead.")
  (cmd_valve_muscle m))

(cl:ensure-generic-function 'cmd_duration_ms-val :lambda-list '(m))
(cl:defmethod cmd_duration_ms-val ((m <JointMuscleValveControllerCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:cmd_duration_ms-val is deprecated.  Use sr_robot_msgs-msg:cmd_duration_ms instead.")
  (cmd_duration_ms m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JointMuscleValveControllerCommand>) ostream)
  "Serializes a message object of type '<JointMuscleValveControllerCommand>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'cmd_valve_muscle))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) ele) ostream))
   (cl:slot-value msg 'cmd_duration_ms))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JointMuscleValveControllerCommand>) istream)
  "Deserializes a message object of type '<JointMuscleValveControllerCommand>"
  (cl:setf (cl:slot-value msg 'cmd_valve_muscle) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'cmd_valve_muscle)))
    (cl:dotimes (i 2)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))))
  (cl:setf (cl:slot-value msg 'cmd_duration_ms) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'cmd_duration_ms)))
    (cl:dotimes (i 2)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:aref vals i)) (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JointMuscleValveControllerCommand>)))
  "Returns string type for a message object of type '<JointMuscleValveControllerCommand>"
  "sr_robot_msgs/JointMuscleValveControllerCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JointMuscleValveControllerCommand)))
  "Returns string type for a message object of type 'JointMuscleValveControllerCommand"
  "sr_robot_msgs/JointMuscleValveControllerCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JointMuscleValveControllerCommand>)))
  "Returns md5sum for a message object of type '<JointMuscleValveControllerCommand>"
  "1a35a9f185150fc2bca2640471eeb55f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JointMuscleValveControllerCommand)))
  "Returns md5sum for a message object of type 'JointMuscleValveControllerCommand"
  "1a35a9f185150fc2bca2640471eeb55f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JointMuscleValveControllerCommand>)))
  "Returns full string definition for message of type '<JointMuscleValveControllerCommand>"
  (cl:format cl:nil "# This command will allow the user to specify a separate command for each of the two muscles that control the joint.~%# The user will also specify a duration in ms for that command. During this duration the command will be sent to the hand~%# every ms. ~%# Once this duration period has elapsed, a command of 0 will be sent to the muscle (meaning both the filling and emptying valves for that ~%# muscle remain closed), until a new command is received~%# A duration of 0 means that there is no timeout, so the valve command will be sent to the muscle until a different valve command is received.~%# BE CAREFUL WHEN USING A DURATION OF 0 AS THIS COULD EVENTUALLY DAMAGE THE MUSCLE~%~%# Allowed values for the cmd_valve_muscle are integers from -4 to +4.~%# +4 the filling valve is open during a full ms cycle. Emptying valve is closed~%# +3 the filling valve is open during 0.75 ms and closed during 0.25 ms in a 1 ms cycle. Emptying valve is closed~%# +2 the filling valve is open during 0.5 ms and closed during 0.5 ms in a 1 ms cycle. Emptying valve is closed~%# +1 the filling valve is open during 0.25 ms and closed during 0.75 ms in a 1 ms cycle. Emptying valve is closed~%# 0 both valves (filling and emptying) remain closed in a 1 ms cycle~%# ...~%# -3 the emptying valve is open during 0.75 ms and closed during 0.25 ms in a 1 ms cycle. Filling valve is closed~%# -4 the emptying valve is open during a full ms cycle. Filling valve is closed~%~%int8[2] cmd_valve_muscle~%uint64[2] cmd_duration_ms~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JointMuscleValveControllerCommand)))
  "Returns full string definition for message of type 'JointMuscleValveControllerCommand"
  (cl:format cl:nil "# This command will allow the user to specify a separate command for each of the two muscles that control the joint.~%# The user will also specify a duration in ms for that command. During this duration the command will be sent to the hand~%# every ms. ~%# Once this duration period has elapsed, a command of 0 will be sent to the muscle (meaning both the filling and emptying valves for that ~%# muscle remain closed), until a new command is received~%# A duration of 0 means that there is no timeout, so the valve command will be sent to the muscle until a different valve command is received.~%# BE CAREFUL WHEN USING A DURATION OF 0 AS THIS COULD EVENTUALLY DAMAGE THE MUSCLE~%~%# Allowed values for the cmd_valve_muscle are integers from -4 to +4.~%# +4 the filling valve is open during a full ms cycle. Emptying valve is closed~%# +3 the filling valve is open during 0.75 ms and closed during 0.25 ms in a 1 ms cycle. Emptying valve is closed~%# +2 the filling valve is open during 0.5 ms and closed during 0.5 ms in a 1 ms cycle. Emptying valve is closed~%# +1 the filling valve is open during 0.25 ms and closed during 0.75 ms in a 1 ms cycle. Emptying valve is closed~%# 0 both valves (filling and emptying) remain closed in a 1 ms cycle~%# ...~%# -3 the emptying valve is open during 0.75 ms and closed during 0.25 ms in a 1 ms cycle. Filling valve is closed~%# -4 the emptying valve is open during a full ms cycle. Filling valve is closed~%~%int8[2] cmd_valve_muscle~%uint64[2] cmd_duration_ms~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JointMuscleValveControllerCommand>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'cmd_valve_muscle) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'cmd_duration_ms) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JointMuscleValveControllerCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'JointMuscleValveControllerCommand
    (cl:cons ':cmd_valve_muscle (cmd_valve_muscle msg))
    (cl:cons ':cmd_duration_ms (cmd_duration_ms msg))
))
