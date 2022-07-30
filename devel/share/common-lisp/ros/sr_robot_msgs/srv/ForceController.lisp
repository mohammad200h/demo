; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude ForceController-request.msg.html

(cl:defclass <ForceController-request> (roslisp-msg-protocol:ros-message)
  ((maxpwm
    :reader maxpwm
    :initarg :maxpwm
    :type cl:fixnum
    :initform 0)
   (sgleftref
    :reader sgleftref
    :initarg :sgleftref
    :type cl:fixnum
    :initform 0)
   (sgrightref
    :reader sgrightref
    :initarg :sgrightref
    :type cl:fixnum
    :initform 0)
   (f
    :reader f
    :initarg :f
    :type cl:fixnum
    :initform 0)
   (p
    :reader p
    :initarg :p
    :type cl:fixnum
    :initform 0)
   (i
    :reader i
    :initarg :i
    :type cl:fixnum
    :initform 0)
   (d
    :reader d
    :initarg :d
    :type cl:fixnum
    :initform 0)
   (imax
    :reader imax
    :initarg :imax
    :type cl:fixnum
    :initform 0)
   (deadband
    :reader deadband
    :initarg :deadband
    :type cl:fixnum
    :initform 0)
   (sign
    :reader sign
    :initarg :sign
    :type cl:fixnum
    :initform 0)
   (torque_limit
    :reader torque_limit
    :initarg :torque_limit
    :type cl:fixnum
    :initform 0)
   (torque_limiter_gain
    :reader torque_limiter_gain
    :initarg :torque_limiter_gain
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ForceController-request (<ForceController-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ForceController-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ForceController-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<ForceController-request> is deprecated: use sr_robot_msgs-srv:ForceController-request instead.")))

(cl:ensure-generic-function 'maxpwm-val :lambda-list '(m))
(cl:defmethod maxpwm-val ((m <ForceController-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:maxpwm-val is deprecated.  Use sr_robot_msgs-srv:maxpwm instead.")
  (maxpwm m))

(cl:ensure-generic-function 'sgleftref-val :lambda-list '(m))
(cl:defmethod sgleftref-val ((m <ForceController-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:sgleftref-val is deprecated.  Use sr_robot_msgs-srv:sgleftref instead.")
  (sgleftref m))

(cl:ensure-generic-function 'sgrightref-val :lambda-list '(m))
(cl:defmethod sgrightref-val ((m <ForceController-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:sgrightref-val is deprecated.  Use sr_robot_msgs-srv:sgrightref instead.")
  (sgrightref m))

(cl:ensure-generic-function 'f-val :lambda-list '(m))
(cl:defmethod f-val ((m <ForceController-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:f-val is deprecated.  Use sr_robot_msgs-srv:f instead.")
  (f m))

(cl:ensure-generic-function 'p-val :lambda-list '(m))
(cl:defmethod p-val ((m <ForceController-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:p-val is deprecated.  Use sr_robot_msgs-srv:p instead.")
  (p m))

(cl:ensure-generic-function 'i-val :lambda-list '(m))
(cl:defmethod i-val ((m <ForceController-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:i-val is deprecated.  Use sr_robot_msgs-srv:i instead.")
  (i m))

(cl:ensure-generic-function 'd-val :lambda-list '(m))
(cl:defmethod d-val ((m <ForceController-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:d-val is deprecated.  Use sr_robot_msgs-srv:d instead.")
  (d m))

(cl:ensure-generic-function 'imax-val :lambda-list '(m))
(cl:defmethod imax-val ((m <ForceController-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:imax-val is deprecated.  Use sr_robot_msgs-srv:imax instead.")
  (imax m))

(cl:ensure-generic-function 'deadband-val :lambda-list '(m))
(cl:defmethod deadband-val ((m <ForceController-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:deadband-val is deprecated.  Use sr_robot_msgs-srv:deadband instead.")
  (deadband m))

(cl:ensure-generic-function 'sign-val :lambda-list '(m))
(cl:defmethod sign-val ((m <ForceController-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:sign-val is deprecated.  Use sr_robot_msgs-srv:sign instead.")
  (sign m))

(cl:ensure-generic-function 'torque_limit-val :lambda-list '(m))
(cl:defmethod torque_limit-val ((m <ForceController-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:torque_limit-val is deprecated.  Use sr_robot_msgs-srv:torque_limit instead.")
  (torque_limit m))

(cl:ensure-generic-function 'torque_limiter_gain-val :lambda-list '(m))
(cl:defmethod torque_limiter_gain-val ((m <ForceController-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:torque_limiter_gain-val is deprecated.  Use sr_robot_msgs-srv:torque_limiter_gain instead.")
  (torque_limiter_gain m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ForceController-request>) ostream)
  "Serializes a message object of type '<ForceController-request>"
  (cl:let* ((signed (cl:slot-value msg 'maxpwm)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sgleftref)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sgrightref)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'f)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'p)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'i)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'd)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'imax)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'deadband)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sign)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'torque_limit)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'torque_limiter_gain)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ForceController-request>) istream)
  "Deserializes a message object of type '<ForceController-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'maxpwm) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sgleftref) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sgrightref) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'f) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'p) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'd) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'imax) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'deadband) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sign) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'torque_limit) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'torque_limiter_gain) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ForceController-request>)))
  "Returns string type for a service object of type '<ForceController-request>"
  "sr_robot_msgs/ForceControllerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ForceController-request)))
  "Returns string type for a service object of type 'ForceController-request"
  "sr_robot_msgs/ForceControllerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ForceController-request>)))
  "Returns md5sum for a message object of type '<ForceController-request>"
  "196995b160417ed9330477132c6b834a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ForceController-request)))
  "Returns md5sum for a message object of type 'ForceController-request"
  "196995b160417ed9330477132c6b834a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ForceController-request>)))
  "Returns full string definition for message of type '<ForceController-request>"
  (cl:format cl:nil "int16 maxpwm~%int16 sgleftref~%int16 sgrightref~%int16 f~%int16 p~%int16 i~%int16 d~%int16 imax~%int16 deadband~%int16 sign~%int16 torque_limit~%int16 torque_limiter_gain~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ForceController-request)))
  "Returns full string definition for message of type 'ForceController-request"
  (cl:format cl:nil "int16 maxpwm~%int16 sgleftref~%int16 sgrightref~%int16 f~%int16 p~%int16 i~%int16 d~%int16 imax~%int16 deadband~%int16 sign~%int16 torque_limit~%int16 torque_limiter_gain~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ForceController-request>))
  (cl:+ 0
     2
     2
     2
     2
     2
     2
     2
     2
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ForceController-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ForceController-request
    (cl:cons ':maxpwm (maxpwm msg))
    (cl:cons ':sgleftref (sgleftref msg))
    (cl:cons ':sgrightref (sgrightref msg))
    (cl:cons ':f (f msg))
    (cl:cons ':p (p msg))
    (cl:cons ':i (i msg))
    (cl:cons ':d (d msg))
    (cl:cons ':imax (imax msg))
    (cl:cons ':deadband (deadband msg))
    (cl:cons ':sign (sign msg))
    (cl:cons ':torque_limit (torque_limit msg))
    (cl:cons ':torque_limiter_gain (torque_limiter_gain msg))
))
;//! \htmlinclude ForceController-response.msg.html

(cl:defclass <ForceController-response> (roslisp-msg-protocol:ros-message)
  ((configured
    :reader configured
    :initarg :configured
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ForceController-response (<ForceController-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ForceController-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ForceController-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<ForceController-response> is deprecated: use sr_robot_msgs-srv:ForceController-response instead.")))

(cl:ensure-generic-function 'configured-val :lambda-list '(m))
(cl:defmethod configured-val ((m <ForceController-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:configured-val is deprecated.  Use sr_robot_msgs-srv:configured instead.")
  (configured m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ForceController-response>) ostream)
  "Serializes a message object of type '<ForceController-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'configured) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ForceController-response>) istream)
  "Deserializes a message object of type '<ForceController-response>"
    (cl:setf (cl:slot-value msg 'configured) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ForceController-response>)))
  "Returns string type for a service object of type '<ForceController-response>"
  "sr_robot_msgs/ForceControllerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ForceController-response)))
  "Returns string type for a service object of type 'ForceController-response"
  "sr_robot_msgs/ForceControllerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ForceController-response>)))
  "Returns md5sum for a message object of type '<ForceController-response>"
  "196995b160417ed9330477132c6b834a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ForceController-response)))
  "Returns md5sum for a message object of type 'ForceController-response"
  "196995b160417ed9330477132c6b834a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ForceController-response>)))
  "Returns full string definition for message of type '<ForceController-response>"
  (cl:format cl:nil "bool configured~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ForceController-response)))
  "Returns full string definition for message of type 'ForceController-response"
  (cl:format cl:nil "bool configured~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ForceController-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ForceController-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ForceController-response
    (cl:cons ':configured (configured msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ForceController)))
  'ForceController-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ForceController)))
  'ForceController-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ForceController)))
  "Returns string type for a service object of type '<ForceController>"
  "sr_robot_msgs/ForceController")