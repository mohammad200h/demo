; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude reverseKinematics.msg.html

(cl:defclass <reverseKinematics> (roslisp-msg-protocol:ros-message)
  ((finger_name
    :reader finger_name
    :initarg :finger_name
    :type cl:string
    :initform ""))
)

(cl:defclass reverseKinematics (<reverseKinematics>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <reverseKinematics>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'reverseKinematics)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<reverseKinematics> is deprecated: use sr_robot_msgs-msg:reverseKinematics instead.")))

(cl:ensure-generic-function 'finger_name-val :lambda-list '(m))
(cl:defmethod finger_name-val ((m <reverseKinematics>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:finger_name-val is deprecated.  Use sr_robot_msgs-msg:finger_name instead.")
  (finger_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <reverseKinematics>) ostream)
  "Serializes a message object of type '<reverseKinematics>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'finger_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'finger_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <reverseKinematics>) istream)
  "Deserializes a message object of type '<reverseKinematics>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'finger_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'finger_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<reverseKinematics>)))
  "Returns string type for a message object of type '<reverseKinematics>"
  "sr_robot_msgs/reverseKinematics")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'reverseKinematics)))
  "Returns string type for a message object of type 'reverseKinematics"
  "sr_robot_msgs/reverseKinematics")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<reverseKinematics>)))
  "Returns md5sum for a message object of type '<reverseKinematics>"
  "db455ae8ce3e770363971b1e8e35fac4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'reverseKinematics)))
  "Returns md5sum for a message object of type 'reverseKinematics"
  "db455ae8ce3e770363971b1e8e35fac4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<reverseKinematics>)))
  "Returns full string definition for message of type '<reverseKinematics>"
  (cl:format cl:nil "string  finger_name~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'reverseKinematics)))
  "Returns full string definition for message of type 'reverseKinematics"
  (cl:format cl:nil "string  finger_name~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <reverseKinematics>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'finger_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <reverseKinematics>))
  "Converts a ROS message object to a list"
  (cl:list 'reverseKinematics
    (cl:cons ':finger_name (finger_name msg))
))
