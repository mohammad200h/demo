;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::JointControllerState)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'JointControllerState (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::JOINTCONTROLLERSTATE")
  (make-package "SR_ROBOT_MSGS::JOINTCONTROLLERSTATE"))

(in-package "ROS")
;;//! \htmlinclude JointControllerState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sr_robot_msgs::JointControllerState
  :super ros::object
  :slots (_header _set_point _process_value _process_value_dot _commanded_velocity _error _time_step _command _measured_effort _friction_compensation _position_p _position_i _position_d _position_i_clamp _velocity_p _velocity_i _velocity_d _velocity_i_clamp ))

(defmethod sr_robot_msgs::JointControllerState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:set_point __set_point) 0.0)
    ((:process_value __process_value) 0.0)
    ((:process_value_dot __process_value_dot) 0.0)
    ((:commanded_velocity __commanded_velocity) 0.0)
    ((:error __error) 0.0)
    ((:time_step __time_step) 0.0)
    ((:command __command) 0.0)
    ((:measured_effort __measured_effort) 0.0)
    ((:friction_compensation __friction_compensation) 0.0)
    ((:position_p __position_p) 0.0)
    ((:position_i __position_i) 0.0)
    ((:position_d __position_d) 0.0)
    ((:position_i_clamp __position_i_clamp) 0.0)
    ((:velocity_p __velocity_p) 0.0)
    ((:velocity_i __velocity_i) 0.0)
    ((:velocity_d __velocity_d) 0.0)
    ((:velocity_i_clamp __velocity_i_clamp) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _set_point (float __set_point))
   (setq _process_value (float __process_value))
   (setq _process_value_dot (float __process_value_dot))
   (setq _commanded_velocity (float __commanded_velocity))
   (setq _error (float __error))
   (setq _time_step (float __time_step))
   (setq _command (float __command))
   (setq _measured_effort (float __measured_effort))
   (setq _friction_compensation (float __friction_compensation))
   (setq _position_p (float __position_p))
   (setq _position_i (float __position_i))
   (setq _position_d (float __position_d))
   (setq _position_i_clamp (float __position_i_clamp))
   (setq _velocity_p (float __velocity_p))
   (setq _velocity_i (float __velocity_i))
   (setq _velocity_d (float __velocity_d))
   (setq _velocity_i_clamp (float __velocity_i_clamp))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:set_point
   (&optional __set_point)
   (if __set_point (setq _set_point __set_point)) _set_point)
  (:process_value
   (&optional __process_value)
   (if __process_value (setq _process_value __process_value)) _process_value)
  (:process_value_dot
   (&optional __process_value_dot)
   (if __process_value_dot (setq _process_value_dot __process_value_dot)) _process_value_dot)
  (:commanded_velocity
   (&optional __commanded_velocity)
   (if __commanded_velocity (setq _commanded_velocity __commanded_velocity)) _commanded_velocity)
  (:error
   (&optional __error)
   (if __error (setq _error __error)) _error)
  (:time_step
   (&optional __time_step)
   (if __time_step (setq _time_step __time_step)) _time_step)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:measured_effort
   (&optional __measured_effort)
   (if __measured_effort (setq _measured_effort __measured_effort)) _measured_effort)
  (:friction_compensation
   (&optional __friction_compensation)
   (if __friction_compensation (setq _friction_compensation __friction_compensation)) _friction_compensation)
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
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _set_point
    8
    ;; float64 _process_value
    8
    ;; float64 _process_value_dot
    8
    ;; float64 _commanded_velocity
    8
    ;; float64 _error
    8
    ;; float64 _time_step
    8
    ;; float64 _command
    8
    ;; float64 _measured_effort
    8
    ;; float64 _friction_compensation
    8
    ;; float64 _position_p
    8
    ;; float64 _position_i
    8
    ;; float64 _position_d
    8
    ;; float64 _position_i_clamp
    8
    ;; float64 _velocity_p
    8
    ;; float64 _velocity_i
    8
    ;; float64 _velocity_d
    8
    ;; float64 _velocity_i_clamp
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _set_point
       (sys::poke _set_point (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _process_value
       (sys::poke _process_value (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _process_value_dot
       (sys::poke _process_value_dot (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _commanded_velocity
       (sys::poke _commanded_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _error
       (sys::poke _error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _time_step
       (sys::poke _time_step (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _command
       (sys::poke _command (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _measured_effort
       (sys::poke _measured_effort (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _friction_compensation
       (sys::poke _friction_compensation (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position_p
       (sys::poke _position_p (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position_i
       (sys::poke _position_i (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position_d
       (sys::poke _position_d (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position_i_clamp
       (sys::poke _position_i_clamp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity_p
       (sys::poke _velocity_p (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity_i
       (sys::poke _velocity_i (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity_d
       (sys::poke _velocity_d (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity_i_clamp
       (sys::poke _velocity_i_clamp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _set_point
     (setq _set_point (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _process_value
     (setq _process_value (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _process_value_dot
     (setq _process_value_dot (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _commanded_velocity
     (setq _commanded_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _error
     (setq _error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _time_step
     (setq _time_step (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _command
     (setq _command (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _measured_effort
     (setq _measured_effort (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _friction_compensation
     (setq _friction_compensation (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position_p
     (setq _position_p (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position_i
     (setq _position_i (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position_d
     (setq _position_d (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position_i_clamp
     (setq _position_i_clamp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity_p
     (setq _velocity_p (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity_i
     (setq _velocity_i (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity_d
     (setq _velocity_d (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity_i_clamp
     (setq _velocity_i_clamp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get sr_robot_msgs::JointControllerState :md5sum-) "6d5ccb5452fd11516b5e350fcf60090e")
(setf (get sr_robot_msgs::JointControllerState :datatype-) "sr_robot_msgs/JointControllerState")
(setf (get sr_robot_msgs::JointControllerState :definition-)
      "Header header
float64 set_point
float64 process_value
float64 process_value_dot
float64 commanded_velocity
float64 error
float64 time_step
float64 command
float64 measured_effort
float64 friction_compensation
float64 position_p
float64 position_i
float64 position_d
float64 position_i_clamp
float64 velocity_p
float64 velocity_i
float64 velocity_d
float64 velocity_i_clamp

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :sr_robot_msgs/JointControllerState "6d5ccb5452fd11516b5e350fcf60090e")


