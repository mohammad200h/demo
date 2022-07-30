; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude contrlr.msg.html

(cl:defclass <contrlr> (roslisp-msg-protocol:ros-message)
  ((contrlr_name
    :reader contrlr_name
    :initarg :contrlr_name
    :type cl:string
    :initform "")
   (list_of_parameters
    :reader list_of_parameters
    :initarg :list_of_parameters
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (length_of_list
    :reader length_of_list
    :initarg :length_of_list
    :type cl:fixnum
    :initform 0))
)

(cl:defclass contrlr (<contrlr>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <contrlr>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'contrlr)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<contrlr> is deprecated: use sr_robot_msgs-msg:contrlr instead.")))

(cl:ensure-generic-function 'contrlr_name-val :lambda-list '(m))
(cl:defmethod contrlr_name-val ((m <contrlr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:contrlr_name-val is deprecated.  Use sr_robot_msgs-msg:contrlr_name instead.")
  (contrlr_name m))

(cl:ensure-generic-function 'list_of_parameters-val :lambda-list '(m))
(cl:defmethod list_of_parameters-val ((m <contrlr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:list_of_parameters-val is deprecated.  Use sr_robot_msgs-msg:list_of_parameters instead.")
  (list_of_parameters m))

(cl:ensure-generic-function 'length_of_list-val :lambda-list '(m))
(cl:defmethod length_of_list-val ((m <contrlr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:length_of_list-val is deprecated.  Use sr_robot_msgs-msg:length_of_list instead.")
  (length_of_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <contrlr>) ostream)
  "Serializes a message object of type '<contrlr>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'contrlr_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'contrlr_name))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'list_of_parameters))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'list_of_parameters))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'length_of_list)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <contrlr>) istream)
  "Deserializes a message object of type '<contrlr>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'contrlr_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'contrlr_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'list_of_parameters) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'list_of_parameters)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'length_of_list)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<contrlr>)))
  "Returns string type for a message object of type '<contrlr>"
  "sr_robot_msgs/contrlr")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'contrlr)))
  "Returns string type for a message object of type 'contrlr"
  "sr_robot_msgs/contrlr")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<contrlr>)))
  "Returns md5sum for a message object of type '<contrlr>"
  "7b2aa60305c5a9ab0ff05803e4d2ab85")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'contrlr)))
  "Returns md5sum for a message object of type 'contrlr"
  "7b2aa60305c5a9ab0ff05803e4d2ab85")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<contrlr>)))
  "Returns full string definition for message of type '<contrlr>"
  (cl:format cl:nil "# the contrlr name (e.g. smart_motor_ff2)~%string   contrlr_name~%~%# specify here a list of parameter_name:value~%# e.g. p:10 sets the p value of the controller to 10~%# the possible parameters are:~%#int16  p~%#int16  i~%#int16  d~%#int16  imax~%#int16  target~%#int16  sensor~%#int16  valve ~%#int16  deadband~%#int16  offset~%#int16  shift~%#int16  max~%#~%## parameters for the motors~%#int16  motor_maxforce~%#int16  motor_safeforce~%#int16  force_p~%#int16  force_i~%#int16  force_d~%#int16  force_imax~%#int16  force_out_shift~%#int16  force_deadband~%#int16  force_offset~%#int16  sensor_imax~%#int16  sensor_deadband~%#int16  sensor_offset~%#int16  max_temperature~%#int16  max_current~%~%string[] list_of_parameters~%~%# the size of the list_of_parameters you are sending~%uint8 	 length_of_list~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'contrlr)))
  "Returns full string definition for message of type 'contrlr"
  (cl:format cl:nil "# the contrlr name (e.g. smart_motor_ff2)~%string   contrlr_name~%~%# specify here a list of parameter_name:value~%# e.g. p:10 sets the p value of the controller to 10~%# the possible parameters are:~%#int16  p~%#int16  i~%#int16  d~%#int16  imax~%#int16  target~%#int16  sensor~%#int16  valve ~%#int16  deadband~%#int16  offset~%#int16  shift~%#int16  max~%#~%## parameters for the motors~%#int16  motor_maxforce~%#int16  motor_safeforce~%#int16  force_p~%#int16  force_i~%#int16  force_d~%#int16  force_imax~%#int16  force_out_shift~%#int16  force_deadband~%#int16  force_offset~%#int16  sensor_imax~%#int16  sensor_deadband~%#int16  sensor_offset~%#int16  max_temperature~%#int16  max_current~%~%string[] list_of_parameters~%~%# the size of the list_of_parameters you are sending~%uint8 	 length_of_list~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <contrlr>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'contrlr_name))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'list_of_parameters) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <contrlr>))
  "Converts a ROS message object to a list"
  (cl:list 'contrlr
    (cl:cons ':contrlr_name (contrlr_name msg))
    (cl:cons ':list_of_parameters (list_of_parameters msg))
    (cl:cons ':length_of_list (length_of_list msg))
))
