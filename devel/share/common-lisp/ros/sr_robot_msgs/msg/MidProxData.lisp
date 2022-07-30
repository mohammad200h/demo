; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude MidProxData.msg.html

(cl:defclass <MidProxData> (roslisp-msg-protocol:ros-message)
  ((middle
    :reader middle
    :initarg :middle
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 4 :element-type 'cl:fixnum :initial-element 0))
   (proximal
    :reader proximal
    :initarg :proximal
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 4 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass MidProxData (<MidProxData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MidProxData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MidProxData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<MidProxData> is deprecated: use sr_robot_msgs-msg:MidProxData instead.")))

(cl:ensure-generic-function 'middle-val :lambda-list '(m))
(cl:defmethod middle-val ((m <MidProxData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:middle-val is deprecated.  Use sr_robot_msgs-msg:middle instead.")
  (middle m))

(cl:ensure-generic-function 'proximal-val :lambda-list '(m))
(cl:defmethod proximal-val ((m <MidProxData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:proximal-val is deprecated.  Use sr_robot_msgs-msg:proximal instead.")
  (proximal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MidProxData>) ostream)
  "Serializes a message object of type '<MidProxData>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'middle))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'proximal))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MidProxData>) istream)
  "Deserializes a message object of type '<MidProxData>"
  (cl:setf (cl:slot-value msg 'middle) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'middle)))
    (cl:dotimes (i 4)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))))
  (cl:setf (cl:slot-value msg 'proximal) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'proximal)))
    (cl:dotimes (i 4)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MidProxData>)))
  "Returns string type for a message object of type '<MidProxData>"
  "sr_robot_msgs/MidProxData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MidProxData)))
  "Returns string type for a message object of type 'MidProxData"
  "sr_robot_msgs/MidProxData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MidProxData>)))
  "Returns md5sum for a message object of type '<MidProxData>"
  "8ae5331748e57fcbdb20b7e2f086fcbf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MidProxData)))
  "Returns md5sum for a message object of type 'MidProxData"
  "8ae5331748e57fcbdb20b7e2f086fcbf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MidProxData>)))
  "Returns full string definition for message of type '<MidProxData>"
  (cl:format cl:nil "uint16[4] middle~%uint16[4] proximal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MidProxData)))
  "Returns full string definition for message of type 'MidProxData"
  (cl:format cl:nil "uint16[4] middle~%uint16[4] proximal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MidProxData>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'middle) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'proximal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MidProxData>))
  "Converts a ROS message object to a list"
  (cl:list 'MidProxData
    (cl:cons ':middle (middle msg))
    (cl:cons ':proximal (proximal msg))
))
