; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude joints_data.msg.html

(cl:defclass <joints_data> (roslisp-msg-protocol:ros-message)
  ((joints_list_length
    :reader joints_list_length
    :initarg :joints_list_length
    :type cl:fixnum
    :initform 0)
   (joints_list
    :reader joints_list
    :initarg :joints_list
    :type (cl:vector sr_robot_msgs-msg:joint)
   :initform (cl:make-array 0 :element-type 'sr_robot_msgs-msg:joint :initial-element (cl:make-instance 'sr_robot_msgs-msg:joint))))
)

(cl:defclass joints_data (<joints_data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <joints_data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'joints_data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<joints_data> is deprecated: use sr_robot_msgs-msg:joints_data instead.")))

(cl:ensure-generic-function 'joints_list_length-val :lambda-list '(m))
(cl:defmethod joints_list_length-val ((m <joints_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:joints_list_length-val is deprecated.  Use sr_robot_msgs-msg:joints_list_length instead.")
  (joints_list_length m))

(cl:ensure-generic-function 'joints_list-val :lambda-list '(m))
(cl:defmethod joints_list-val ((m <joints_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:joints_list-val is deprecated.  Use sr_robot_msgs-msg:joints_list instead.")
  (joints_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <joints_data>) ostream)
  "Serializes a message object of type '<joints_data>"
  (cl:let* ((signed (cl:slot-value msg 'joints_list_length)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joints_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'joints_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <joints_data>) istream)
  "Deserializes a message object of type '<joints_data>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'joints_list_length) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joints_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joints_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sr_robot_msgs-msg:joint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<joints_data>)))
  "Returns string type for a message object of type '<joints_data>"
  "sr_robot_msgs/joints_data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'joints_data)))
  "Returns string type for a message object of type 'joints_data"
  "sr_robot_msgs/joints_data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<joints_data>)))
  "Returns md5sum for a message object of type '<joints_data>"
  "a7bd94657f253c468247048a545e88e5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'joints_data)))
  "Returns md5sum for a message object of type 'joints_data"
  "a7bd94657f253c468247048a545e88e5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<joints_data>)))
  "Returns full string definition for message of type '<joints_data>"
  (cl:format cl:nil "int8 joints_list_length~%joint[] joints_list~%~%================================================================================~%MSG: sr_robot_msgs/joint~%string  joint_name~%float64 joint_position~%float64 joint_target~%float64 joint_torque~%float64 joint_temperature~%float64 joint_current~%string  error_flag~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'joints_data)))
  "Returns full string definition for message of type 'joints_data"
  (cl:format cl:nil "int8 joints_list_length~%joint[] joints_list~%~%================================================================================~%MSG: sr_robot_msgs/joint~%string  joint_name~%float64 joint_position~%float64 joint_target~%float64 joint_torque~%float64 joint_temperature~%float64 joint_current~%string  error_flag~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <joints_data>))
  (cl:+ 0
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joints_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <joints_data>))
  "Converts a ROS message object to a list"
  (cl:list 'joints_data
    (cl:cons ':joints_list_length (joints_list_length msg))
    (cl:cons ':joints_list (joints_list msg))
))
