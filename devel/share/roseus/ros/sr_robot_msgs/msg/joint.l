;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::joint)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'joint (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::JOINT")
  (make-package "SR_ROBOT_MSGS::JOINT"))

(in-package "ROS")
;;//! \htmlinclude joint.msg.html


(defclass sr_robot_msgs::joint
  :super ros::object
  :slots (_joint_name _joint_position _joint_target _joint_torque _joint_temperature _joint_current _error_flag ))

(defmethod sr_robot_msgs::joint
  (:init
   (&key
    ((:joint_name __joint_name) "")
    ((:joint_position __joint_position) 0.0)
    ((:joint_target __joint_target) 0.0)
    ((:joint_torque __joint_torque) 0.0)
    ((:joint_temperature __joint_temperature) 0.0)
    ((:joint_current __joint_current) 0.0)
    ((:error_flag __error_flag) "")
    )
   (send-super :init)
   (setq _joint_name (string __joint_name))
   (setq _joint_position (float __joint_position))
   (setq _joint_target (float __joint_target))
   (setq _joint_torque (float __joint_torque))
   (setq _joint_temperature (float __joint_temperature))
   (setq _joint_current (float __joint_current))
   (setq _error_flag (string __error_flag))
   self)
  (:joint_name
   (&optional __joint_name)
   (if __joint_name (setq _joint_name __joint_name)) _joint_name)
  (:joint_position
   (&optional __joint_position)
   (if __joint_position (setq _joint_position __joint_position)) _joint_position)
  (:joint_target
   (&optional __joint_target)
   (if __joint_target (setq _joint_target __joint_target)) _joint_target)
  (:joint_torque
   (&optional __joint_torque)
   (if __joint_torque (setq _joint_torque __joint_torque)) _joint_torque)
  (:joint_temperature
   (&optional __joint_temperature)
   (if __joint_temperature (setq _joint_temperature __joint_temperature)) _joint_temperature)
  (:joint_current
   (&optional __joint_current)
   (if __joint_current (setq _joint_current __joint_current)) _joint_current)
  (:error_flag
   (&optional __error_flag)
   (if __error_flag (setq _error_flag __error_flag)) _error_flag)
  (:serialization-length
   ()
   (+
    ;; string _joint_name
    4 (length _joint_name)
    ;; float64 _joint_position
    8
    ;; float64 _joint_target
    8
    ;; float64 _joint_torque
    8
    ;; float64 _joint_temperature
    8
    ;; float64 _joint_current
    8
    ;; string _error_flag
    4 (length _error_flag)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _joint_name
       (write-long (length _joint_name) s) (princ _joint_name s)
     ;; float64 _joint_position
       (sys::poke _joint_position (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _joint_target
       (sys::poke _joint_target (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _joint_torque
       (sys::poke _joint_torque (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _joint_temperature
       (sys::poke _joint_temperature (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _joint_current
       (sys::poke _joint_current (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _error_flag
       (write-long (length _error_flag) s) (princ _error_flag s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _joint_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _joint_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _joint_position
     (setq _joint_position (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _joint_target
     (setq _joint_target (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _joint_torque
     (setq _joint_torque (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _joint_temperature
     (setq _joint_temperature (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _joint_current
     (setq _joint_current (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _error_flag
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _error_flag (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get sr_robot_msgs::joint :md5sum-) "4f0c5e71dfc214020935c3116ed47d6f")
(setf (get sr_robot_msgs::joint :datatype-) "sr_robot_msgs/joint")
(setf (get sr_robot_msgs::joint :definition-)
      "string  joint_name
float64 joint_position
float64 joint_target
float64 joint_torque
float64 joint_temperature
float64 joint_current
string  error_flag

")



(provide :sr_robot_msgs/joint "4f0c5e71dfc214020935c3116ed47d6f")


