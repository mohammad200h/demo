;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::JointMusclePositionControllerState)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'JointMusclePositionControllerState (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::JOINTMUSCLEPOSITIONCONTROLLERSTATE")
  (make-package "SR_ROBOT_MSGS::JOINTMUSCLEPOSITIONCONTROLLERSTATE"))

(in-package "ROS")
;;//! \htmlinclude JointMusclePositionControllerState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sr_robot_msgs::JointMusclePositionControllerState
  :super ros::object
  :slots (_header _set_point _process_value _process_value_dot _error _time_step _pseudo_command _valve_muscle_0 _valve_muscle_1 _packed_valve _muscle_pressure_0 _muscle_pressure_1 _p _i _d _i_clamp ))

(defmethod sr_robot_msgs::JointMusclePositionControllerState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:set_point __set_point) 0.0)
    ((:process_value __process_value) 0.0)
    ((:process_value_dot __process_value_dot) 0.0)
    ((:error __error) 0.0)
    ((:time_step __time_step) 0.0)
    ((:pseudo_command __pseudo_command) 0.0)
    ((:valve_muscle_0 __valve_muscle_0) 0)
    ((:valve_muscle_1 __valve_muscle_1) 0)
    ((:packed_valve __packed_valve) 0.0)
    ((:muscle_pressure_0 __muscle_pressure_0) 0)
    ((:muscle_pressure_1 __muscle_pressure_1) 0)
    ((:p __p) 0.0)
    ((:i __i) 0.0)
    ((:d __d) 0.0)
    ((:i_clamp __i_clamp) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _set_point (float __set_point))
   (setq _process_value (float __process_value))
   (setq _process_value_dot (float __process_value_dot))
   (setq _error (float __error))
   (setq _time_step (float __time_step))
   (setq _pseudo_command (float __pseudo_command))
   (setq _valve_muscle_0 (round __valve_muscle_0))
   (setq _valve_muscle_1 (round __valve_muscle_1))
   (setq _packed_valve (float __packed_valve))
   (setq _muscle_pressure_0 (round __muscle_pressure_0))
   (setq _muscle_pressure_1 (round __muscle_pressure_1))
   (setq _p (float __p))
   (setq _i (float __i))
   (setq _d (float __d))
   (setq _i_clamp (float __i_clamp))
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
  (:error
   (&optional __error)
   (if __error (setq _error __error)) _error)
  (:time_step
   (&optional __time_step)
   (if __time_step (setq _time_step __time_step)) _time_step)
  (:pseudo_command
   (&optional __pseudo_command)
   (if __pseudo_command (setq _pseudo_command __pseudo_command)) _pseudo_command)
  (:valve_muscle_0
   (&optional __valve_muscle_0)
   (if __valve_muscle_0 (setq _valve_muscle_0 __valve_muscle_0)) _valve_muscle_0)
  (:valve_muscle_1
   (&optional __valve_muscle_1)
   (if __valve_muscle_1 (setq _valve_muscle_1 __valve_muscle_1)) _valve_muscle_1)
  (:packed_valve
   (&optional __packed_valve)
   (if __packed_valve (setq _packed_valve __packed_valve)) _packed_valve)
  (:muscle_pressure_0
   (&optional __muscle_pressure_0)
   (if __muscle_pressure_0 (setq _muscle_pressure_0 __muscle_pressure_0)) _muscle_pressure_0)
  (:muscle_pressure_1
   (&optional __muscle_pressure_1)
   (if __muscle_pressure_1 (setq _muscle_pressure_1 __muscle_pressure_1)) _muscle_pressure_1)
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
    ;; float64 _error
    8
    ;; float64 _time_step
    8
    ;; float64 _pseudo_command
    8
    ;; int8 _valve_muscle_0
    1
    ;; int8 _valve_muscle_1
    1
    ;; float64 _packed_valve
    8
    ;; uint16 _muscle_pressure_0
    2
    ;; uint16 _muscle_pressure_1
    2
    ;; float64 _p
    8
    ;; float64 _i
    8
    ;; float64 _d
    8
    ;; float64 _i_clamp
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
     ;; float64 _error
       (sys::poke _error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _time_step
       (sys::poke _time_step (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pseudo_command
       (sys::poke _pseudo_command (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int8 _valve_muscle_0
       (write-byte _valve_muscle_0 s)
     ;; int8 _valve_muscle_1
       (write-byte _valve_muscle_1 s)
     ;; float64 _packed_valve
       (sys::poke _packed_valve (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint16 _muscle_pressure_0
       (write-word _muscle_pressure_0 s)
     ;; uint16 _muscle_pressure_1
       (write-word _muscle_pressure_1 s)
     ;; float64 _p
       (sys::poke _p (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _i
       (sys::poke _i (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _d
       (sys::poke _d (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _i_clamp
       (sys::poke _i_clamp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
   ;; float64 _error
     (setq _error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _time_step
     (setq _time_step (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pseudo_command
     (setq _pseudo_command (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int8 _valve_muscle_0
     (setq _valve_muscle_0 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _valve_muscle_0 127) (setq _valve_muscle_0 (- _valve_muscle_0 256)))
   ;; int8 _valve_muscle_1
     (setq _valve_muscle_1 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _valve_muscle_1 127) (setq _valve_muscle_1 (- _valve_muscle_1 256)))
   ;; float64 _packed_valve
     (setq _packed_valve (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint16 _muscle_pressure_0
     (setq _muscle_pressure_0 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _muscle_pressure_1
     (setq _muscle_pressure_1 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float64 _p
     (setq _p (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _i
     (setq _i (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _d
     (setq _d (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _i_clamp
     (setq _i_clamp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get sr_robot_msgs::JointMusclePositionControllerState :md5sum-) "5a9f3e4da940842d5d2d35e00e1cd647")
(setf (get sr_robot_msgs::JointMusclePositionControllerState :datatype-) "sr_robot_msgs/JointMusclePositionControllerState")
(setf (get sr_robot_msgs::JointMusclePositionControllerState :definition-)
      "Header header
float64 set_point
float64 process_value
float64 process_value_dot
float64 error
float64 time_step
float64 pseudo_command
int8 valve_muscle_0
int8 valve_muscle_1
float64 packed_valve
uint16 muscle_pressure_0
uint16 muscle_pressure_1
float64 p
float64 i
float64 d
float64 i_clamp


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



(provide :sr_robot_msgs/JointMusclePositionControllerState "5a9f3e4da940842d5d2d35e00e1cd647")


