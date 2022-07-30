; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude sendupdate.msg.html

(cl:defclass <sendupdate> (roslisp-msg-protocol:ros-message)
  ((sendupdate_length
    :reader sendupdate_length
    :initarg :sendupdate_length
    :type cl:fixnum
    :initform 0)
   (sendupdate_list
    :reader sendupdate_list
    :initarg :sendupdate_list
    :type (cl:vector sr_robot_msgs-msg:joint)
   :initform (cl:make-array 0 :element-type 'sr_robot_msgs-msg:joint :initial-element (cl:make-instance 'sr_robot_msgs-msg:joint))))
)

(cl:defclass sendupdate (<sendupdate>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sendupdate>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sendupdate)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<sendupdate> is deprecated: use sr_robot_msgs-msg:sendupdate instead.")))

(cl:ensure-generic-function 'sendupdate_length-val :lambda-list '(m))
(cl:defmethod sendupdate_length-val ((m <sendupdate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:sendupdate_length-val is deprecated.  Use sr_robot_msgs-msg:sendupdate_length instead.")
  (sendupdate_length m))

(cl:ensure-generic-function 'sendupdate_list-val :lambda-list '(m))
(cl:defmethod sendupdate_list-val ((m <sendupdate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:sendupdate_list-val is deprecated.  Use sr_robot_msgs-msg:sendupdate_list instead.")
  (sendupdate_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sendupdate>) ostream)
  "Serializes a message object of type '<sendupdate>"
  (cl:let* ((signed (cl:slot-value msg 'sendupdate_length)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sendupdate_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'sendupdate_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sendupdate>) istream)
  "Deserializes a message object of type '<sendupdate>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sendupdate_length) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'sendupdate_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sendupdate_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sr_robot_msgs-msg:joint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sendupdate>)))
  "Returns string type for a message object of type '<sendupdate>"
  "sr_robot_msgs/sendupdate")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sendupdate)))
  "Returns string type for a message object of type 'sendupdate"
  "sr_robot_msgs/sendupdate")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sendupdate>)))
  "Returns md5sum for a message object of type '<sendupdate>"
  "43a45fe046127fe123dc7e38e3ffdc36")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sendupdate)))
  "Returns md5sum for a message object of type 'sendupdate"
  "43a45fe046127fe123dc7e38e3ffdc36")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sendupdate>)))
  "Returns full string definition for message of type '<sendupdate>"
  (cl:format cl:nil "int8 sendupdate_length~%joint[] sendupdate_list~%~%~%================================================================================~%MSG: sr_robot_msgs/joint~%string  joint_name~%float64 joint_position~%float64 joint_target~%float64 joint_torque~%float64 joint_temperature~%float64 joint_current~%string  error_flag~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sendupdate)))
  "Returns full string definition for message of type 'sendupdate"
  (cl:format cl:nil "int8 sendupdate_length~%joint[] sendupdate_list~%~%~%================================================================================~%MSG: sr_robot_msgs/joint~%string  joint_name~%float64 joint_position~%float64 joint_target~%float64 joint_torque~%float64 joint_temperature~%float64 joint_current~%string  error_flag~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sendupdate>))
  (cl:+ 0
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sendupdate_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sendupdate>))
  "Converts a ROS message object to a list"
  (cl:list 'sendupdate
    (cl:cons ':sendupdate_length (sendupdate_length msg))
    (cl:cons ':sendupdate_list (sendupdate_list msg))
))
