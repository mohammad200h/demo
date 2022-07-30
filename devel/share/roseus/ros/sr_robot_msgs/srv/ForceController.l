;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::ForceController)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'ForceController (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::FORCECONTROLLER")
  (make-package "SR_ROBOT_MSGS::FORCECONTROLLER"))
(unless (find-package "SR_ROBOT_MSGS::FORCECONTROLLERREQUEST")
  (make-package "SR_ROBOT_MSGS::FORCECONTROLLERREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::FORCECONTROLLERRESPONSE")
  (make-package "SR_ROBOT_MSGS::FORCECONTROLLERRESPONSE"))

(in-package "ROS")





(defclass sr_robot_msgs::ForceControllerRequest
  :super ros::object
  :slots (_maxpwm _sgleftref _sgrightref _f _p _i _d _imax _deadband _sign _torque_limit _torque_limiter_gain ))

(defmethod sr_robot_msgs::ForceControllerRequest
  (:init
   (&key
    ((:maxpwm __maxpwm) 0)
    ((:sgleftref __sgleftref) 0)
    ((:sgrightref __sgrightref) 0)
    ((:f __f) 0)
    ((:p __p) 0)
    ((:i __i) 0)
    ((:d __d) 0)
    ((:imax __imax) 0)
    ((:deadband __deadband) 0)
    ((:sign __sign) 0)
    ((:torque_limit __torque_limit) 0)
    ((:torque_limiter_gain __torque_limiter_gain) 0)
    )
   (send-super :init)
   (setq _maxpwm (round __maxpwm))
   (setq _sgleftref (round __sgleftref))
   (setq _sgrightref (round __sgrightref))
   (setq _f (round __f))
   (setq _p (round __p))
   (setq _i (round __i))
   (setq _d (round __d))
   (setq _imax (round __imax))
   (setq _deadband (round __deadband))
   (setq _sign (round __sign))
   (setq _torque_limit (round __torque_limit))
   (setq _torque_limiter_gain (round __torque_limiter_gain))
   self)
  (:maxpwm
   (&optional __maxpwm)
   (if __maxpwm (setq _maxpwm __maxpwm)) _maxpwm)
  (:sgleftref
   (&optional __sgleftref)
   (if __sgleftref (setq _sgleftref __sgleftref)) _sgleftref)
  (:sgrightref
   (&optional __sgrightref)
   (if __sgrightref (setq _sgrightref __sgrightref)) _sgrightref)
  (:f
   (&optional __f)
   (if __f (setq _f __f)) _f)
  (:p
   (&optional __p)
   (if __p (setq _p __p)) _p)
  (:i
   (&optional __i)
   (if __i (setq _i __i)) _i)
  (:d
   (&optional __d)
   (if __d (setq _d __d)) _d)
  (:imax
   (&optional __imax)
   (if __imax (setq _imax __imax)) _imax)
  (:deadband
   (&optional __deadband)
   (if __deadband (setq _deadband __deadband)) _deadband)
  (:sign
   (&optional __sign)
   (if __sign (setq _sign __sign)) _sign)
  (:torque_limit
   (&optional __torque_limit)
   (if __torque_limit (setq _torque_limit __torque_limit)) _torque_limit)
  (:torque_limiter_gain
   (&optional __torque_limiter_gain)
   (if __torque_limiter_gain (setq _torque_limiter_gain __torque_limiter_gain)) _torque_limiter_gain)
  (:serialization-length
   ()
   (+
    ;; int16 _maxpwm
    2
    ;; int16 _sgleftref
    2
    ;; int16 _sgrightref
    2
    ;; int16 _f
    2
    ;; int16 _p
    2
    ;; int16 _i
    2
    ;; int16 _d
    2
    ;; int16 _imax
    2
    ;; int16 _deadband
    2
    ;; int16 _sign
    2
    ;; int16 _torque_limit
    2
    ;; int16 _torque_limiter_gain
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _maxpwm
       (write-word _maxpwm s)
     ;; int16 _sgleftref
       (write-word _sgleftref s)
     ;; int16 _sgrightref
       (write-word _sgrightref s)
     ;; int16 _f
       (write-word _f s)
     ;; int16 _p
       (write-word _p s)
     ;; int16 _i
       (write-word _i s)
     ;; int16 _d
       (write-word _d s)
     ;; int16 _imax
       (write-word _imax s)
     ;; int16 _deadband
       (write-word _deadband s)
     ;; int16 _sign
       (write-word _sign s)
     ;; int16 _torque_limit
       (write-word _torque_limit s)
     ;; int16 _torque_limiter_gain
       (write-word _torque_limiter_gain s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _maxpwm
     (setq _maxpwm (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _sgleftref
     (setq _sgleftref (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _sgrightref
     (setq _sgrightref (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _f
     (setq _f (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _p
     (setq _p (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _i
     (setq _i (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _d
     (setq _d (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _imax
     (setq _imax (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _deadband
     (setq _deadband (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _sign
     (setq _sign (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _torque_limit
     (setq _torque_limit (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _torque_limiter_gain
     (setq _torque_limiter_gain (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass sr_robot_msgs::ForceControllerResponse
  :super ros::object
  :slots (_configured ))

(defmethod sr_robot_msgs::ForceControllerResponse
  (:init
   (&key
    ((:configured __configured) nil)
    )
   (send-super :init)
   (setq _configured __configured)
   self)
  (:configured
   (&optional __configured)
   (if __configured (setq _configured __configured)) _configured)
  (:serialization-length
   ()
   (+
    ;; bool _configured
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _configured
       (if _configured (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _configured
     (setq _configured (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass sr_robot_msgs::ForceController
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::ForceController :md5sum-) "196995b160417ed9330477132c6b834a")
(setf (get sr_robot_msgs::ForceController :datatype-) "sr_robot_msgs/ForceController")
(setf (get sr_robot_msgs::ForceController :request) sr_robot_msgs::ForceControllerRequest)
(setf (get sr_robot_msgs::ForceController :response) sr_robot_msgs::ForceControllerResponse)

(defmethod sr_robot_msgs::ForceControllerRequest
  (:response () (instance sr_robot_msgs::ForceControllerResponse :init)))

(setf (get sr_robot_msgs::ForceControllerRequest :md5sum-) "196995b160417ed9330477132c6b834a")
(setf (get sr_robot_msgs::ForceControllerRequest :datatype-) "sr_robot_msgs/ForceControllerRequest")
(setf (get sr_robot_msgs::ForceControllerRequest :definition-)
      "int16 maxpwm
int16 sgleftref
int16 sgrightref
int16 f
int16 p
int16 i
int16 d
int16 imax
int16 deadband
int16 sign
int16 torque_limit
int16 torque_limiter_gain
---
bool configured
")

(setf (get sr_robot_msgs::ForceControllerResponse :md5sum-) "196995b160417ed9330477132c6b834a")
(setf (get sr_robot_msgs::ForceControllerResponse :datatype-) "sr_robot_msgs/ForceControllerResponse")
(setf (get sr_robot_msgs::ForceControllerResponse :definition-)
      "int16 maxpwm
int16 sgleftref
int16 sgrightref
int16 f
int16 p
int16 i
int16 d
int16 imax
int16 deadband
int16 sign
int16 torque_limit
int16 torque_limiter_gain
---
bool configured
")



(provide :sr_robot_msgs/ForceController "196995b160417ed9330477132c6b834a")


