; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude Tactile.msg.html

(cl:defclass <Tactile> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector std_msgs-msg:Int16)
   :initform (cl:make-array 0 :element-type 'std_msgs-msg:Int16 :initial-element (cl:make-instance 'std_msgs-msg:Int16))))
)

(cl:defclass Tactile (<Tactile>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Tactile>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Tactile)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<Tactile> is deprecated: use sr_robot_msgs-msg:Tactile instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <Tactile>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:data-val is deprecated.  Use sr_robot_msgs-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Tactile>) ostream)
  "Serializes a message object of type '<Tactile>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Tactile>) istream)
  "Deserializes a message object of type '<Tactile>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'std_msgs-msg:Int16))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Tactile>)))
  "Returns string type for a message object of type '<Tactile>"
  "sr_robot_msgs/Tactile")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Tactile)))
  "Returns string type for a message object of type 'Tactile"
  "sr_robot_msgs/Tactile")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Tactile>)))
  "Returns md5sum for a message object of type '<Tactile>"
  "0f9585f47779b9607f760bef85a254c0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Tactile)))
  "Returns md5sum for a message object of type 'Tactile"
  "0f9585f47779b9607f760bef85a254c0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Tactile>)))
  "Returns full string definition for message of type '<Tactile>"
  (cl:format cl:nil "std_msgs/Int16[] data~%~%================================================================================~%MSG: std_msgs/Int16~%int16 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Tactile)))
  "Returns full string definition for message of type 'Tactile"
  (cl:format cl:nil "std_msgs/Int16[] data~%~%================================================================================~%MSG: std_msgs/Int16~%int16 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Tactile>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Tactile>))
  "Converts a ROS message object to a list"
  (cl:list 'Tactile
    (cl:cons ':data (data msg))
))
