; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude cartesian_data.msg.html

(cl:defclass <cartesian_data> (roslisp-msg-protocol:ros-message)
  ((cartesian_positions_length
    :reader cartesian_positions_length
    :initarg :cartesian_positions_length
    :type cl:fixnum
    :initform 0)
   (cartesian_positions
    :reader cartesian_positions
    :initarg :cartesian_positions
    :type (cl:vector sr_robot_msgs-msg:cartesian_position)
   :initform (cl:make-array 0 :element-type 'sr_robot_msgs-msg:cartesian_position :initial-element (cl:make-instance 'sr_robot_msgs-msg:cartesian_position))))
)

(cl:defclass cartesian_data (<cartesian_data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cartesian_data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cartesian_data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<cartesian_data> is deprecated: use sr_robot_msgs-msg:cartesian_data instead.")))

(cl:ensure-generic-function 'cartesian_positions_length-val :lambda-list '(m))
(cl:defmethod cartesian_positions_length-val ((m <cartesian_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:cartesian_positions_length-val is deprecated.  Use sr_robot_msgs-msg:cartesian_positions_length instead.")
  (cartesian_positions_length m))

(cl:ensure-generic-function 'cartesian_positions-val :lambda-list '(m))
(cl:defmethod cartesian_positions-val ((m <cartesian_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:cartesian_positions-val is deprecated.  Use sr_robot_msgs-msg:cartesian_positions instead.")
  (cartesian_positions m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cartesian_data>) ostream)
  "Serializes a message object of type '<cartesian_data>"
  (cl:let* ((signed (cl:slot-value msg 'cartesian_positions_length)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'cartesian_positions))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'cartesian_positions))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cartesian_data>) istream)
  "Deserializes a message object of type '<cartesian_data>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cartesian_positions_length) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'cartesian_positions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'cartesian_positions)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sr_robot_msgs-msg:cartesian_position))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cartesian_data>)))
  "Returns string type for a message object of type '<cartesian_data>"
  "sr_robot_msgs/cartesian_data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cartesian_data)))
  "Returns string type for a message object of type 'cartesian_data"
  "sr_robot_msgs/cartesian_data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cartesian_data>)))
  "Returns md5sum for a message object of type '<cartesian_data>"
  "0efe699b2863e30a84ffabfdca8dfb19")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cartesian_data)))
  "Returns md5sum for a message object of type 'cartesian_data"
  "0efe699b2863e30a84ffabfdca8dfb19")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cartesian_data>)))
  "Returns full string definition for message of type '<cartesian_data>"
  (cl:format cl:nil "int8                 cartesian_positions_length~%cartesian_position[] cartesian_positions~%~%================================================================================~%MSG: sr_robot_msgs/cartesian_position~%string  tip_name~%float32 tip_pos_x~%float32 tip_pos_y~%float32 tip_pos_z~%float32 tip_orientation_rho~%float32 tip_orientation_theta~%float32 tip_orientation_sigma~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cartesian_data)))
  "Returns full string definition for message of type 'cartesian_data"
  (cl:format cl:nil "int8                 cartesian_positions_length~%cartesian_position[] cartesian_positions~%~%================================================================================~%MSG: sr_robot_msgs/cartesian_position~%string  tip_name~%float32 tip_pos_x~%float32 tip_pos_y~%float32 tip_pos_z~%float32 tip_orientation_rho~%float32 tip_orientation_theta~%float32 tip_orientation_sigma~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cartesian_data>))
  (cl:+ 0
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'cartesian_positions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cartesian_data>))
  "Converts a ROS message object to a list"
  (cl:list 'cartesian_data
    (cl:cons ':cartesian_positions_length (cartesian_positions_length msg))
    (cl:cons ':cartesian_positions (cartesian_positions msg))
))
