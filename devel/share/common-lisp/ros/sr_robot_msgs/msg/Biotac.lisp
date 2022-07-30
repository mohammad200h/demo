; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-msg)


;//! \htmlinclude Biotac.msg.html

(cl:defclass <Biotac> (roslisp-msg-protocol:ros-message)
  ((pac0
    :reader pac0
    :initarg :pac0
    :type cl:fixnum
    :initform 0)
   (pac1
    :reader pac1
    :initarg :pac1
    :type cl:fixnum
    :initform 0)
   (pdc
    :reader pdc
    :initarg :pdc
    :type cl:fixnum
    :initform 0)
   (tac
    :reader tac
    :initarg :tac
    :type cl:fixnum
    :initform 0)
   (tdc
    :reader tdc
    :initarg :tdc
    :type cl:fixnum
    :initform 0)
   (electrodes
    :reader electrodes
    :initarg :electrodes
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass Biotac (<Biotac>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Biotac>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Biotac)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-msg:<Biotac> is deprecated: use sr_robot_msgs-msg:Biotac instead.")))

(cl:ensure-generic-function 'pac0-val :lambda-list '(m))
(cl:defmethod pac0-val ((m <Biotac>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:pac0-val is deprecated.  Use sr_robot_msgs-msg:pac0 instead.")
  (pac0 m))

(cl:ensure-generic-function 'pac1-val :lambda-list '(m))
(cl:defmethod pac1-val ((m <Biotac>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:pac1-val is deprecated.  Use sr_robot_msgs-msg:pac1 instead.")
  (pac1 m))

(cl:ensure-generic-function 'pdc-val :lambda-list '(m))
(cl:defmethod pdc-val ((m <Biotac>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:pdc-val is deprecated.  Use sr_robot_msgs-msg:pdc instead.")
  (pdc m))

(cl:ensure-generic-function 'tac-val :lambda-list '(m))
(cl:defmethod tac-val ((m <Biotac>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:tac-val is deprecated.  Use sr_robot_msgs-msg:tac instead.")
  (tac m))

(cl:ensure-generic-function 'tdc-val :lambda-list '(m))
(cl:defmethod tdc-val ((m <Biotac>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:tdc-val is deprecated.  Use sr_robot_msgs-msg:tdc instead.")
  (tdc m))

(cl:ensure-generic-function 'electrodes-val :lambda-list '(m))
(cl:defmethod electrodes-val ((m <Biotac>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-msg:electrodes-val is deprecated.  Use sr_robot_msgs-msg:electrodes instead.")
  (electrodes m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Biotac>) ostream)
  "Serializes a message object of type '<Biotac>"
  (cl:let* ((signed (cl:slot-value msg 'pac0)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'pac1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'pdc)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'tac)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'tdc)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'electrodes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'electrodes))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Biotac>) istream)
  "Deserializes a message object of type '<Biotac>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pac0) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pac1) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pdc) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tac) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tdc) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'electrodes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'electrodes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Biotac>)))
  "Returns string type for a message object of type '<Biotac>"
  "sr_robot_msgs/Biotac")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Biotac)))
  "Returns string type for a message object of type 'Biotac"
  "sr_robot_msgs/Biotac")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Biotac>)))
  "Returns md5sum for a message object of type '<Biotac>"
  "8b5e6266fcf2902d0393e32e002093df")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Biotac)))
  "Returns md5sum for a message object of type 'Biotac"
  "8b5e6266fcf2902d0393e32e002093df")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Biotac>)))
  "Returns full string definition for message of type '<Biotac>"
  (cl:format cl:nil "int16 pac0~%int16 pac1~%int16 pdc~%~%int16 tac~%int16 tdc~%~%int16[] electrodes~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Biotac)))
  "Returns full string definition for message of type 'Biotac"
  (cl:format cl:nil "int16 pac0~%int16 pac1~%int16 pdc~%~%int16 tac~%int16 tdc~%~%int16[] electrodes~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Biotac>))
  (cl:+ 0
     2
     2
     2
     2
     2
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'electrodes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Biotac>))
  "Converts a ROS message object to a list"
  (cl:list 'Biotac
    (cl:cons ':pac0 (pac0 msg))
    (cl:cons ':pac1 (pac1 msg))
    (cl:cons ':pdc (pdc msg))
    (cl:cons ':tac (tac msg))
    (cl:cons ':tdc (tdc msg))
    (cl:cons ':electrodes (electrodes msg))
))
