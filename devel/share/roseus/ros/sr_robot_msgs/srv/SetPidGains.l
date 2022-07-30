;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::SetPidGains)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'SetPidGains (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::SETPIDGAINS")
  (make-package "SR_ROBOT_MSGS::SETPIDGAINS"))
(unless (find-package "SR_ROBOT_MSGS::SETPIDGAINSREQUEST")
  (make-package "SR_ROBOT_MSGS::SETPIDGAINSREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::SETPIDGAINSRESPONSE")
  (make-package "SR_ROBOT_MSGS::SETPIDGAINSRESPONSE"))

(in-package "ROS")





(defclass sr_robot_msgs::SetPidGainsRequest
  :super ros::object
  :slots (_p _i _d _i_clamp _max_force _deadband _friction_deadband ))

(defmethod sr_robot_msgs::SetPidGainsRequest
  (:init
   (&key
    ((:p __p) 0.0)
    ((:i __i) 0.0)
    ((:d __d) 0.0)
    ((:i_clamp __i_clamp) 0.0)
    ((:max_force __max_force) 0.0)
    ((:deadband __deadband) 0.0)
    ((:friction_deadband __friction_deadband) 0)
    )
   (send-super :init)
   (setq _p (float __p))
   (setq _i (float __i))
   (setq _d (float __d))
   (setq _i_clamp (float __i_clamp))
   (setq _max_force (float __max_force))
   (setq _deadband (float __deadband))
   (setq _friction_deadband (round __friction_deadband))
   self)
  (:p
   (&optional __p)
   (if __p (setq _p __p)) _p)
  (:i
   (&optional __i)
   (if __i (setq _i __i)) _i)
  (:d
   (&optional __d)
   (if __d (setq _d __d)) _d)
  (:i_clamp
   (&optional __i_clamp)
   (if __i_clamp (setq _i_clamp __i_clamp)) _i_clamp)
  (:max_force
   (&optional __max_force)
   (if __max_force (setq _max_force __max_force)) _max_force)
  (:deadband
   (&optional __deadband)
   (if __deadband (setq _deadband __deadband)) _deadband)
  (:friction_deadband
   (&optional __friction_deadband)
   (if __friction_deadband (setq _friction_deadband __friction_deadband)) _friction_deadband)
  (:serialization-length
   ()
   (+
    ;; float64 _p
    8
    ;; float64 _i
    8
    ;; float64 _d
    8
    ;; float64 _i_clamp
    8
    ;; float64 _max_force
    8
    ;; float64 _deadband
    8
    ;; int32 _friction_deadband
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _p
       (sys::poke _p (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _i
       (sys::poke _i (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _d
       (sys::poke _d (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _i_clamp
       (sys::poke _i_clamp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _max_force
       (sys::poke _max_force (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _deadband
       (sys::poke _deadband (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32 _friction_deadband
       (write-long _friction_deadband s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _p
     (setq _p (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _i
     (setq _i (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _d
     (setq _d (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _i_clamp
     (setq _i_clamp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _max_force
     (setq _max_force (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _deadband
     (setq _deadband (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32 _friction_deadband
     (setq _friction_deadband (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass sr_robot_msgs::SetPidGainsResponse
  :super ros::object
  :slots ())

(defmethod sr_robot_msgs::SetPidGainsResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass sr_robot_msgs::SetPidGains
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::SetPidGains :md5sum-) "f9c5176e998bba30344c4892f975be3a")
(setf (get sr_robot_msgs::SetPidGains :datatype-) "sr_robot_msgs/SetPidGains")
(setf (get sr_robot_msgs::SetPidGains :request) sr_robot_msgs::SetPidGainsRequest)
(setf (get sr_robot_msgs::SetPidGains :response) sr_robot_msgs::SetPidGainsResponse)

(defmethod sr_robot_msgs::SetPidGainsRequest
  (:response () (instance sr_robot_msgs::SetPidGainsResponse :init)))

(setf (get sr_robot_msgs::SetPidGainsRequest :md5sum-) "f9c5176e998bba30344c4892f975be3a")
(setf (get sr_robot_msgs::SetPidGainsRequest :datatype-) "sr_robot_msgs/SetPidGainsRequest")
(setf (get sr_robot_msgs::SetPidGainsRequest :definition-)
      "float64 p
float64 i
float64 d
float64 i_clamp
float64 max_force
float64 deadband
int32 friction_deadband
---

")

(setf (get sr_robot_msgs::SetPidGainsResponse :md5sum-) "f9c5176e998bba30344c4892f975be3a")
(setf (get sr_robot_msgs::SetPidGainsResponse :datatype-) "sr_robot_msgs/SetPidGainsResponse")
(setf (get sr_robot_msgs::SetPidGainsResponse :definition-)
      "float64 p
float64 i
float64 d
float64 i_clamp
float64 max_force
float64 deadband
int32 friction_deadband
---

")



(provide :sr_robot_msgs/SetPidGains "f9c5176e998bba30344c4892f975be3a")


