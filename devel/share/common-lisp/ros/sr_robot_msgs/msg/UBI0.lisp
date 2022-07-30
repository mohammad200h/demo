; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude UBI0.msg.html

(cl:defclass <UBI0> (roslisp-msg-protocol:ros-message)
  ((distal
    :reader distal
    :initarg :distal
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 12 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass UBI0 (<UBI0>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <UBI0>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'UBI0)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<UBI0> is deprecated: use sr_robot_msgs-msg:UBI0 instead.")))

(cl:ensure-generic-function 'distal-val :lambda-list '(m))
(cl:defmethod distal-val ((m <UBI0>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:distal-val is deprecated.  Use sr_robot_msgs-msg:distal instead.")
  (distal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <UBI0>) ostream)
  "Serializes a message object of type '<UBI0>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'distal))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <UBI0>) istream)
  "Deserializes a message object of type '<UBI0>"
  (cl:setf (cl:slot-value msg 'distal) (cl:make-array 12))
  (cl:let ((vals (cl:slot-value msg 'distal)))
    (cl:dotimes (i 12)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<UBI0>)))
  "Returns string type for a message object of type '<UBI0>"
  "sr_robot_msgs/UBI0")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UBI0)))
  "Returns string type for a message object of type 'UBI0"
  "sr_robot_msgs/UBI0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<UBI0>)))
  "Returns md5sum for a message object of type '<UBI0>"
  "f8ba754182dd029f486767184963c485")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'UBI0)))
  "Returns md5sum for a message object of type 'UBI0"
  "f8ba754182dd029f486767184963c485")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<UBI0>)))
  "Returns full string definition for message of type '<UBI0>"
  (cl:format cl:nil "uint16[12] distal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'UBI0)))
  "Returns full string definition for message of type 'UBI0"
  (cl:format cl:nil "uint16[12] distal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <UBI0>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'distal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <UBI0>))
  "Converts a ROS message object to a list"
  (cl:list 'UBI0
    (cl:cons ':distal (distal msg))
))
