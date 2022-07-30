;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::SetMixedPositionVelocityPidGains)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'SetMixedPositionVelocityPidGains (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::SETMIXEDPOSITIONVELOCITYPIDGAINS")
  (make-package "SR_ROBOT_MSGS::SETMIXEDPOSITIONVELOCITYPIDGAINS"))
(unless (find-package "SR_ROBOT_MSGS::SETMIXEDPOSITIONVELOCITYPIDGAINSREQUEST")
  (make-package "SR_ROBOT_MSGS::SETMIXEDPOSITIONVELOCITYPIDGAINSREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::SETMIXEDPOSITIONVELOCITYPIDGAINSRESPONSE")
  (make-package "SR_ROBOT_MSGS::SETMIXEDPOSITIONVELOCITYPIDGAINSRESPONSE"))

(in-package "ROS")





(defclass sr_robot_msgs::SetMixedPositionVelocityPidGainsRequest
  :super ros::object
  :slots (_position_p _position_i _position_d _position_i_clamp _min_velocity _max_velocity _position_deadband _velocity_p _velocity_i _velocity_d _velocity_i_clamp _max_force _friction_deadband ))

(defmethod sr_robot_msgs::SetMixedPositionVelocityPidGainsRequest
  (:init
   (&key
    ((:position_p __position_p) 0.0)
    ((:position_i __position_i) 0.0)
    ((:position_d __position_d) 0.0)
    ((:position_i_clamp __position_i_clamp) 0.0)
    ((:min_velocity __min_velocity) 0.0)
    ((:max_velocity __max_velocity) 0.0)
    ((:position_deadband __position_deadband) 0.0)
    ((:velocity_p __velocity_p) 0.0)
    ((:velocity_i __velocity_i) 0.0)
    ((:velocity_d __velocity_d) 0.0)
    ((:velocity_i_clamp __velocity_i_clamp) 0.0)
    ((:max_force __max_force) 0.0)
    ((:friction_deadband __friction_deadband) 0)
    )
   (send-super :init)
   (setq _position_p (float __position_p))
   (setq _position_i (float __position_i))
   (setq _position_d (float __position_d))
   (setq _position_i_clamp (float __position_i_clamp))
   (setq _min_velocity (float __min_velocity))
   (setq _max_velocity (float __max_velocity))
   (setq _position_deadband (float __position_deadband))
   (setq _velocity_p (float __velocity_p))
   (setq _velocity_i (float __velocity_i))
   (setq _velocity_d (float __velocity_d))
   (setq _velocity_i_clamp (float __velocity_i_clamp))
   (setq _max_force (float __max_force))
   (setq _friction_deadband (round __friction_deadband))
   self)
  (:position_p
   (&optional __position_p)
   (if __position_p (setq _position_p __position_p)) _position_p)
  (:position_i
   (&optional __position_i)
   (if __position_i (setq _position_i __position_i)) _position_i)
  (:position_d
   (&optional __position_d)
   (if __position_d (setq _position_d __position_d)) _position_d)
  (:position_i_clamp
   (&optional __position_i_clamp)
   (if __position_i_clamp (setq _position_i_clamp __position_i_clamp)) _position_i_clamp)
  (:min_velocity
   (&optional __min_velocity)
   (if __min_velocity (setq _min_velocity __min_velocity)) _min_velocity)
  (:max_velocity
   (&optional __max_velocity)
   (if __max_velocity (setq _max_velocity __max_velocity)) _max_velocity)
  (:position_deadband
   (&optional __position_deadband)
   (if __position_deadband (setq _position_deadband __position_deadband)) _position_deadband)
  (:velocity_p
   (&optional __velocity_p)
   (if __velocity_p (setq _velocity_p __velocity_p)) _velocity_p)
  (:velocity_i
   (&optional __velocity_i)
   (if __velocity_i (setq _velocity_i __velocity_i)) _velocity_i)
  (:velocity_d
   (&optional __velocity_d)
   (if __velocity_d (setq _velocity_d __velocity_d)) _velocity_d)
  (:velocity_i_clamp
   (&optional __velocity_i_clamp)
   (if __velocity_i_clamp (setq _velocity_i_clamp __velocity_i_clamp)) _velocity_i_clamp)
  (:max_force
   (&optional __max_force)
   (if __max_force (setq _max_force __max_force)) _max_force)
  (:friction_deadband
   (&optional __friction_deadband)
   (if __friction_deadband (setq _friction_deadband __friction_deadband)) _friction_deadband)
  (:serialization-length
   ()
   (+
    ;; float64 _position_p
    8
    ;; float64 _position_i
    8
    ;; float64 _position_d
    8
    ;; float64 _position_i_clamp
    8
    ;; float64 _min_velocity
    8
    ;; float64 _max_velocity
    8
    ;; float64 _position_deadband
    8
    ;; float64 _velocity_p
    8
    ;; float64 _velocity_i
    8
    ;; float64 _velocity_d
    8
    ;; float64 _velocity_i_clamp
    8
    ;; float64 _max_force
    8
    ;; int32 _friction_deadband
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _position_p
       (sys::poke _position_p (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position_i
       (sys::poke _position_i (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position_d
       (sys::poke _position_d (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position_i_clamp
       (sys::poke _position_i_clamp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _min_velocity
       (sys::poke _min_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _max_velocity
       (sys::poke _max_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position_deadband
       (sys::poke _position_deadband (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity_p
       (sys::poke _velocity_p (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity_i
       (sys::poke _velocity_i (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity_d
       (sys::poke _velocity_d (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity_i_clamp
       (sys::poke _velocity_i_clamp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _max_force
       (sys::poke _max_force (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32 _friction_deadband
       (write-long _friction_deadband s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _position_p
     (setq _position_p (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position_i
     (setq _position_i (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position_d
     (setq _position_d (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position_i_clamp
     (setq _position_i_clamp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _min_velocity
     (setq _min_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _max_velocity
     (setq _max_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position_deadband
     (setq _position_deadband (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity_p
     (setq _velocity_p (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity_i
     (setq _velocity_i (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity_d
     (setq _velocity_d (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity_i_clamp
     (setq _velocity_i_clamp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _max_force
     (setq _max_force (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32 _friction_deadband
     (setq _friction_deadband (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass sr_robot_msgs::SetMixedPositionVelocityPidGainsResponse
  :super ros::object
  :slots ())

(defmethod sr_robot_msgs::SetMixedPositionVelocityPidGainsResponse
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

(defclass sr_robot_msgs::SetMixedPositionVelocityPidGains
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::SetMixedPositionVelocityPidGains :md5sum-) "ff95ce4d442c9454d3d943f0c999da89")
(setf (get sr_robot_msgs::SetMixedPositionVelocityPidGains :datatype-) "sr_robot_msgs/SetMixedPositionVelocityPidGains")
(setf (get sr_robot_msgs::SetMixedPositionVelocityPidGains :request) sr_robot_msgs::SetMixedPositionVelocityPidGainsRequest)
(setf (get sr_robot_msgs::SetMixedPositionVelocityPidGains :response) sr_robot_msgs::SetMixedPositionVelocityPidGainsResponse)

(defmethod sr_robot_msgs::SetMixedPositionVelocityPidGainsRequest
  (:response () (instance sr_robot_msgs::SetMixedPositionVelocityPidGainsResponse :init)))

(setf (get sr_robot_msgs::SetMixedPositionVelocityPidGainsRequest :md5sum-) "ff95ce4d442c9454d3d943f0c999da89")
(setf (get sr_robot_msgs::SetMixedPositionVelocityPidGainsRequest :datatype-) "sr_robot_msgs/SetMixedPositionVelocityPidGainsRequest")
(setf (get sr_robot_msgs::SetMixedPositionVelocityPidGainsRequest :definition-)
      "float64 position_p
float64 position_i
float64 position_d
float64 position_i_clamp
float64 min_velocity
float64 max_velocity
float64 position_deadband

float64 velocity_p
float64 velocity_i
float64 velocity_d
float64 velocity_i_clamp
float64 max_force

int32 friction_deadband
---

")

(setf (get sr_robot_msgs::SetMixedPositionVelocityPidGainsResponse :md5sum-) "ff95ce4d442c9454d3d943f0c999da89")
(setf (get sr_robot_msgs::SetMixedPositionVelocityPidGainsResponse :datatype-) "sr_robot_msgs/SetMixedPositionVelocityPidGainsResponse")
(setf (get sr_robot_msgs::SetMixedPositionVelocityPidGainsResponse :definition-)
      "float64 position_p
float64 position_i
float64 position_d
float64 position_i_clamp
float64 min_velocity
float64 max_velocity
float64 position_deadband

float64 velocity_p
float64 velocity_i
float64 velocity_d
float64 velocity_i_clamp
float64 max_force

int32 friction_deadband
---

")



(provide :sr_robot_msgs/SetMixedPositionVelocityPidGains "ff95ce4d442c9454d3d943f0c999da89")


