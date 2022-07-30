;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::cartesian_position)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'cartesian_position (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::CARTESIAN_POSITION")
  (make-package "SR_ROBOT_MSGS::CARTESIAN_POSITION"))

(in-package "ROS")
;;//! \htmlinclude cartesian_position.msg.html


(defclass sr_robot_msgs::cartesian_position
  :super ros::object
  :slots (_tip_name _tip_pos_x _tip_pos_y _tip_pos_z _tip_orientation_rho _tip_orientation_theta _tip_orientation_sigma ))

(defmethod sr_robot_msgs::cartesian_position
  (:init
   (&key
    ((:tip_name __tip_name) "")
    ((:tip_pos_x __tip_pos_x) 0.0)
    ((:tip_pos_y __tip_pos_y) 0.0)
    ((:tip_pos_z __tip_pos_z) 0.0)
    ((:tip_orientation_rho __tip_orientation_rho) 0.0)
    ((:tip_orientation_theta __tip_orientation_theta) 0.0)
    ((:tip_orientation_sigma __tip_orientation_sigma) 0.0)
    )
   (send-super :init)
   (setq _tip_name (string __tip_name))
   (setq _tip_pos_x (float __tip_pos_x))
   (setq _tip_pos_y (float __tip_pos_y))
   (setq _tip_pos_z (float __tip_pos_z))
   (setq _tip_orientation_rho (float __tip_orientation_rho))
   (setq _tip_orientation_theta (float __tip_orientation_theta))
   (setq _tip_orientation_sigma (float __tip_orientation_sigma))
   self)
  (:tip_name
   (&optional __tip_name)
   (if __tip_name (setq _tip_name __tip_name)) _tip_name)
  (:tip_pos_x
   (&optional __tip_pos_x)
   (if __tip_pos_x (setq _tip_pos_x __tip_pos_x)) _tip_pos_x)
  (:tip_pos_y
   (&optional __tip_pos_y)
   (if __tip_pos_y (setq _tip_pos_y __tip_pos_y)) _tip_pos_y)
  (:tip_pos_z
   (&optional __tip_pos_z)
   (if __tip_pos_z (setq _tip_pos_z __tip_pos_z)) _tip_pos_z)
  (:tip_orientation_rho
   (&optional __tip_orientation_rho)
   (if __tip_orientation_rho (setq _tip_orientation_rho __tip_orientation_rho)) _tip_orientation_rho)
  (:tip_orientation_theta
   (&optional __tip_orientation_theta)
   (if __tip_orientation_theta (setq _tip_orientation_theta __tip_orientation_theta)) _tip_orientation_theta)
  (:tip_orientation_sigma
   (&optional __tip_orientation_sigma)
   (if __tip_orientation_sigma (setq _tip_orientation_sigma __tip_orientation_sigma)) _tip_orientation_sigma)
  (:serialization-length
   ()
   (+
    ;; string _tip_name
    4 (length _tip_name)
    ;; float32 _tip_pos_x
    4
    ;; float32 _tip_pos_y
    4
    ;; float32 _tip_pos_z
    4
    ;; float32 _tip_orientation_rho
    4
    ;; float32 _tip_orientation_theta
    4
    ;; float32 _tip_orientation_sigma
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _tip_name
       (write-long (length _tip_name) s) (princ _tip_name s)
     ;; float32 _tip_pos_x
       (sys::poke _tip_pos_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _tip_pos_y
       (sys::poke _tip_pos_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _tip_pos_z
       (sys::poke _tip_pos_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _tip_orientation_rho
       (sys::poke _tip_orientation_rho (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _tip_orientation_theta
       (sys::poke _tip_orientation_theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _tip_orientation_sigma
       (sys::poke _tip_orientation_sigma (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _tip_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _tip_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _tip_pos_x
     (setq _tip_pos_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _tip_pos_y
     (setq _tip_pos_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _tip_pos_z
     (setq _tip_pos_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _tip_orientation_rho
     (setq _tip_orientation_rho (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _tip_orientation_theta
     (setq _tip_orientation_theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _tip_orientation_sigma
     (setq _tip_orientation_sigma (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sr_robot_msgs::cartesian_position :md5sum-) "cfc3f1750a36a668eb93288ed1128f42")
(setf (get sr_robot_msgs::cartesian_position :datatype-) "sr_robot_msgs/cartesian_position")
(setf (get sr_robot_msgs::cartesian_position :definition-)
      "string  tip_name
float32 tip_pos_x
float32 tip_pos_y
float32 tip_pos_z
float32 tip_orientation_rho
float32 tip_orientation_theta
float32 tip_orientation_sigma


")



(provide :sr_robot_msgs/cartesian_position "cfc3f1750a36a668eb93288ed1128f42")


