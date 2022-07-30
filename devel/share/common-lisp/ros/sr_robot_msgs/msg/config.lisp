; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude config.msg.html

(cl:defclass <config> (roslisp-msg-protocol:ros-message)
  ((node_name
    :reader node_name
    :initarg :node_name
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

(cl:defclass config (<config>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <config>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'config)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<config> is deprecated: use sr_robot_msgs-msg:config instead.")))

(cl:ensure-generic-function 'node_name-val :lambda-list '(m))
(cl:defmethod node_name-val ((m <config>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:node_name-val is deprecated.  Use sr_robot_msgs-msg:node_name instead.")
  (node_name m))

(cl:ensure-generic-function 'list_of_parameters-val :lambda-list '(m))
(cl:defmethod list_of_parameters-val ((m <config>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:list_of_parameters-val is deprecated.  Use sr_robot_msgs-msg:list_of_parameters instead.")
  (list_of_parameters m))

(cl:ensure-generic-function 'length_of_list-val :lambda-list '(m))
(cl:defmethod length_of_list-val ((m <config>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:length_of_list-val is deprecated.  Use sr_robot_msgs-msg:length_of_list instead.")
  (length_of_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <config>) ostream)
  "Serializes a message object of type '<config>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'node_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'node_name))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <config>) istream)
  "Deserializes a message object of type '<config>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'node_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'node_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<config>)))
  "Returns string type for a message object of type '<config>"
  "sr_robot_msgs/config")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'config)))
  "Returns string type for a message object of type 'config"
  "sr_robot_msgs/config")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<config>)))
  "Returns md5sum for a message object of type '<config>"
  "aad3efafb735fbac1153457b0e7c6e24")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'config)))
  "Returns md5sum for a message object of type 'config"
  "aad3efafb735fbac1153457b0e7c6e24")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<config>)))
  "Returns full string definition for message of type '<config>"
  (cl:format cl:nil "# modify the config of a node~%# e.g. change the transmission rate~%string   node_name~%string[] list_of_parameters~%uint8    length_of_list~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'config)))
  "Returns full string definition for message of type 'config"
  (cl:format cl:nil "# modify the config of a node~%# e.g. change the transmission rate~%string   node_name~%string[] list_of_parameters~%uint8    length_of_list~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <config>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'node_name))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'list_of_parameters) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <config>))
  "Converts a ROS message object to a list"
  (cl:list 'config
    (cl:cons ':node_name (node_name msg))
    (cl:cons ':list_of_parameters (list_of_parameters msg))
    (cl:cons ':length_of_list (length_of_list msg))
))
