; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude MidProxDataAll.msg.html

(cl:defclass <MidProxDataAll> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (sensors
    :reader sensors
    :initarg :sensors
    :type (cl:vector sr_robot_msgs-msg:MidProxData)
   :initform (cl:make-array 5 :element-type 'sr_robot_msgs-msg:MidProxData :initial-element (cl:make-instance 'sr_robot_msgs-msg:MidProxData))))
)

(cl:defclass MidProxDataAll (<MidProxDataAll>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MidProxDataAll>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MidProxDataAll)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<MidProxDataAll> is deprecated: use sr_robot_msgs-msg:MidProxDataAll instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MidProxDataAll>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:header-val is deprecated.  Use sr_robot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'sensors-val :lambda-list '(m))
(cl:defmethod sensors-val ((m <MidProxDataAll>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:sensors-val is deprecated.  Use sr_robot_msgs-msg:sensors instead.")
  (sensors m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MidProxDataAll>) ostream)
  "Serializes a message object of type '<MidProxDataAll>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'sensors))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MidProxDataAll>) istream)
  "Deserializes a message object of type '<MidProxDataAll>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:setf (cl:slot-value msg 'sensors) (cl:make-array 5))
  (cl:let ((vals (cl:slot-value msg 'sensors)))
    (cl:dotimes (i 5)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sr_robot_msgs-msg:MidProxData))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MidProxDataAll>)))
  "Returns string type for a message object of type '<MidProxDataAll>"
  "sr_robot_msgs/MidProxDataAll")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MidProxDataAll)))
  "Returns string type for a message object of type 'MidProxDataAll"
  "sr_robot_msgs/MidProxDataAll")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MidProxDataAll>)))
  "Returns md5sum for a message object of type '<MidProxDataAll>"
  "1e9012ec0a19b9d9e5a6680de1b6d873")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MidProxDataAll)))
  "Returns md5sum for a message object of type 'MidProxDataAll"
  "1e9012ec0a19b9d9e5a6680de1b6d873")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MidProxDataAll>)))
  "Returns full string definition for message of type '<MidProxDataAll>"
  (cl:format cl:nil "Header header~%MidProxData[5] sensors~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sr_robot_msgs/MidProxData~%uint16[4] middle~%uint16[4] proximal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MidProxDataAll)))
  "Returns full string definition for message of type 'MidProxDataAll"
  (cl:format cl:nil "Header header~%MidProxData[5] sensors~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sr_robot_msgs/MidProxData~%uint16[4] middle~%uint16[4] proximal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MidProxDataAll>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'sensors) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MidProxDataAll>))
  "Converts a ROS message object to a list"
  (cl:list 'MidProxDataAll
    (cl:cons ':header (header msg))
    (cl:cons ':sensors (sensors msg))
))
