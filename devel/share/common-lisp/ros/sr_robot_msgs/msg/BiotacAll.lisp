; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude BiotacAll.msg.html

(cl:defclass <BiotacAll> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (tactiles
    :reader tactiles
    :initarg :tactiles
    :type (cl:vector sr_robot_msgs-msg:Biotac)
   :initform (cl:make-array 5 :element-type 'sr_robot_msgs-msg:Biotac :initial-element (cl:make-instance 'sr_robot_msgs-msg:Biotac))))
)

(cl:defclass BiotacAll (<BiotacAll>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BiotacAll>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BiotacAll)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<BiotacAll> is deprecated: use sr_robot_msgs-msg:BiotacAll instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BiotacAll>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:header-val is deprecated.  Use sr_robot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'tactiles-val :lambda-list '(m))
(cl:defmethod tactiles-val ((m <BiotacAll>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:tactiles-val is deprecated.  Use sr_robot_msgs-msg:tactiles instead.")
  (tactiles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BiotacAll>) ostream)
  "Serializes a message object of type '<BiotacAll>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'tactiles))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BiotacAll>) istream)
  "Deserializes a message object of type '<BiotacAll>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:setf (cl:slot-value msg 'tactiles) (cl:make-array 5))
  (cl:let ((vals (cl:slot-value msg 'tactiles)))
    (cl:dotimes (i 5)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sr_robot_msgs-msg:Biotac))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BiotacAll>)))
  "Returns string type for a message object of type '<BiotacAll>"
  "sr_robot_msgs/BiotacAll")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BiotacAll)))
  "Returns string type for a message object of type 'BiotacAll"
  "sr_robot_msgs/BiotacAll")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BiotacAll>)))
  "Returns md5sum for a message object of type '<BiotacAll>"
  "e27dd065f854b80a2d092dd322ddfd40")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BiotacAll)))
  "Returns md5sum for a message object of type 'BiotacAll"
  "e27dd065f854b80a2d092dd322ddfd40")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BiotacAll>)))
  "Returns full string definition for message of type '<BiotacAll>"
  (cl:format cl:nil "Header header~%Biotac[5] tactiles~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sr_robot_msgs/Biotac~%int16 pac0~%int16 pac1~%int16 pdc~%~%int16 tac~%int16 tdc~%~%int16[] electrodes~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BiotacAll)))
  "Returns full string definition for message of type 'BiotacAll"
  (cl:format cl:nil "Header header~%Biotac[5] tactiles~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sr_robot_msgs/Biotac~%int16 pac0~%int16 pac1~%int16 pdc~%~%int16 tac~%int16 tdc~%~%int16[] electrodes~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BiotacAll>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'tactiles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BiotacAll>))
  "Converts a ROS message object to a list"
  (cl:list 'BiotacAll
    (cl:cons ':header (header msg))
    (cl:cons ':tactiles (tactiles msg))
))
