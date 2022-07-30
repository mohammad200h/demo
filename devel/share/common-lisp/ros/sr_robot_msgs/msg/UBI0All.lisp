; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude UBI0All.msg.html

(cl:defclass <UBI0All> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (tactiles
    :reader tactiles
    :initarg :tactiles
    :type (cl:vector sr_robot_msgs-msg:UBI0)
   :initform (cl:make-array 5 :element-type 'sr_robot_msgs-msg:UBI0 :initial-element (cl:make-instance 'sr_robot_msgs-msg:UBI0))))
)

(cl:defclass UBI0All (<UBI0All>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <UBI0All>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'UBI0All)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<UBI0All> is deprecated: use sr_robot_msgs-msg:UBI0All instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <UBI0All>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:header-val is deprecated.  Use sr_robot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'tactiles-val :lambda-list '(m))
(cl:defmethod tactiles-val ((m <UBI0All>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:tactiles-val is deprecated.  Use sr_robot_msgs-msg:tactiles instead.")
  (tactiles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <UBI0All>) ostream)
  "Serializes a message object of type '<UBI0All>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'tactiles))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <UBI0All>) istream)
  "Deserializes a message object of type '<UBI0All>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:setf (cl:slot-value msg 'tactiles) (cl:make-array 5))
  (cl:let ((vals (cl:slot-value msg 'tactiles)))
    (cl:dotimes (i 5)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sr_robot_msgs-msg:UBI0))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<UBI0All>)))
  "Returns string type for a message object of type '<UBI0All>"
  "sr_robot_msgs/UBI0All")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UBI0All)))
  "Returns string type for a message object of type 'UBI0All"
  "sr_robot_msgs/UBI0All")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<UBI0All>)))
  "Returns md5sum for a message object of type '<UBI0All>"
  "22c64fd8e1fb1637211317013726a341")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'UBI0All)))
  "Returns md5sum for a message object of type 'UBI0All"
  "22c64fd8e1fb1637211317013726a341")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<UBI0All>)))
  "Returns full string definition for message of type '<UBI0All>"
  (cl:format cl:nil "Header header~%UBI0[5] tactiles~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sr_robot_msgs/UBI0~%uint16[12] distal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'UBI0All)))
  "Returns full string definition for message of type 'UBI0All"
  (cl:format cl:nil "Header header~%UBI0[5] tactiles~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sr_robot_msgs/UBI0~%uint16[12] distal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <UBI0All>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'tactiles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <UBI0All>))
  "Converts a ROS message object to a list"
  (cl:list 'UBI0All
    (cl:cons ':header (header msg))
    (cl:cons ':tactiles (tactiles msg))
))
