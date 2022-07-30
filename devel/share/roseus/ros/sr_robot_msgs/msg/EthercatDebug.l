;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::EthercatDebug)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'EthercatDebug (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::ETHERCATDEBUG")
  (make-package "SR_ROBOT_MSGS::ETHERCATDEBUG"))

(in-package "ROS")
;;//! \htmlinclude EthercatDebug.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sr_robot_msgs::EthercatDebug
  :super ros::object
  :slots (_header _sensors _motor_data_type _which_motors _which_motor_data_arrived _which_motor_data_had_errors _motor_data_packet_torque _motor_data_packet_misc _tactile_data_type _tactile_data_valid _tactile _idle_time_us ))

(defmethod sr_robot_msgs::EthercatDebug
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:sensors __sensors) (make-array 0 :initial-element 0 :element-type :integer))
    ((:motor_data_type __motor_data_type) (instance sr_robot_msgs::FromMotorDataType :init))
    ((:which_motors __which_motors) 0)
    ((:which_motor_data_arrived __which_motor_data_arrived) 0)
    ((:which_motor_data_had_errors __which_motor_data_had_errors) 0)
    ((:motor_data_packet_torque __motor_data_packet_torque) (make-array 0 :initial-element 0 :element-type :integer))
    ((:motor_data_packet_misc __motor_data_packet_misc) (make-array 0 :initial-element 0 :element-type :integer))
    ((:tactile_data_type __tactile_data_type) 0)
    ((:tactile_data_valid __tactile_data_valid) 0)
    ((:tactile __tactile) (make-array 0 :initial-element 0 :element-type :integer))
    ((:idle_time_us __idle_time_us) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _sensors __sensors)
   (setq _motor_data_type __motor_data_type)
   (setq _which_motors (round __which_motors))
   (setq _which_motor_data_arrived (round __which_motor_data_arrived))
   (setq _which_motor_data_had_errors (round __which_motor_data_had_errors))
   (setq _motor_data_packet_torque __motor_data_packet_torque)
   (setq _motor_data_packet_misc __motor_data_packet_misc)
   (setq _tactile_data_type (round __tactile_data_type))
   (setq _tactile_data_valid (round __tactile_data_valid))
   (setq _tactile __tactile)
   (setq _idle_time_us (round __idle_time_us))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:sensors
   (&optional __sensors)
   (if __sensors (setq _sensors __sensors)) _sensors)
  (:motor_data_type
   (&rest __motor_data_type)
   (if (keywordp (car __motor_data_type))
       (send* _motor_data_type __motor_data_type)
     (progn
       (if __motor_data_type (setq _motor_data_type (car __motor_data_type)))
       _motor_data_type)))
  (:which_motors
   (&optional __which_motors)
   (if __which_motors (setq _which_motors __which_motors)) _which_motors)
  (:which_motor_data_arrived
   (&optional __which_motor_data_arrived)
   (if __which_motor_data_arrived (setq _which_motor_data_arrived __which_motor_data_arrived)) _which_motor_data_arrived)
  (:which_motor_data_had_errors
   (&optional __which_motor_data_had_errors)
   (if __which_motor_data_had_errors (setq _which_motor_data_had_errors __which_motor_data_had_errors)) _which_motor_data_had_errors)
  (:motor_data_packet_torque
   (&optional __motor_data_packet_torque)
   (if __motor_data_packet_torque (setq _motor_data_packet_torque __motor_data_packet_torque)) _motor_data_packet_torque)
  (:motor_data_packet_misc
   (&optional __motor_data_packet_misc)
   (if __motor_data_packet_misc (setq _motor_data_packet_misc __motor_data_packet_misc)) _motor_data_packet_misc)
  (:tactile_data_type
   (&optional __tactile_data_type)
   (if __tactile_data_type (setq _tactile_data_type __tactile_data_type)) _tactile_data_type)
  (:tactile_data_valid
   (&optional __tactile_data_valid)
   (if __tactile_data_valid (setq _tactile_data_valid __tactile_data_valid)) _tactile_data_valid)
  (:tactile
   (&optional __tactile)
   (if __tactile (setq _tactile __tactile)) _tactile)
  (:idle_time_us
   (&optional __idle_time_us)
   (if __idle_time_us (setq _idle_time_us __idle_time_us)) _idle_time_us)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int16[] _sensors
    (* 2    (length _sensors)) 4
    ;; sr_robot_msgs/FromMotorDataType _motor_data_type
    (send _motor_data_type :serialization-length)
    ;; int16 _which_motors
    2
    ;; int32 _which_motor_data_arrived
    4
    ;; int32 _which_motor_data_had_errors
    4
    ;; int16[] _motor_data_packet_torque
    (* 2    (length _motor_data_packet_torque)) 4
    ;; int16[] _motor_data_packet_misc
    (* 2    (length _motor_data_packet_misc)) 4
    ;; int32 _tactile_data_type
    4
    ;; int16 _tactile_data_valid
    2
    ;; int16[] _tactile
    (* 2    (length _tactile)) 4
    ;; int16 _idle_time_us
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int16[] _sensors
     (write-long (length _sensors) s)
     (dotimes (i (length _sensors))
       (write-word (elt _sensors i) s)
       )
     ;; sr_robot_msgs/FromMotorDataType _motor_data_type
       (send _motor_data_type :serialize s)
     ;; int16 _which_motors
       (write-word _which_motors s)
     ;; int32 _which_motor_data_arrived
       (write-long _which_motor_data_arrived s)
     ;; int32 _which_motor_data_had_errors
       (write-long _which_motor_data_had_errors s)
     ;; int16[] _motor_data_packet_torque
     (write-long (length _motor_data_packet_torque) s)
     (dotimes (i (length _motor_data_packet_torque))
       (write-word (elt _motor_data_packet_torque i) s)
       )
     ;; int16[] _motor_data_packet_misc
     (write-long (length _motor_data_packet_misc) s)
     (dotimes (i (length _motor_data_packet_misc))
       (write-word (elt _motor_data_packet_misc i) s)
       )
     ;; int32 _tactile_data_type
       (write-long _tactile_data_type s)
     ;; int16 _tactile_data_valid
       (write-word _tactile_data_valid s)
     ;; int16[] _tactile
     (write-long (length _tactile) s)
     (dotimes (i (length _tactile))
       (write-word (elt _tactile i) s)
       )
     ;; int16 _idle_time_us
       (write-word _idle_time_us s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int16[] _sensors
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sensors (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _sensors i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; sr_robot_msgs/FromMotorDataType _motor_data_type
     (send _motor_data_type :deserialize buf ptr-) (incf ptr- (send _motor_data_type :serialization-length))
   ;; int16 _which_motors
     (setq _which_motors (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int32 _which_motor_data_arrived
     (setq _which_motor_data_arrived (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _which_motor_data_had_errors
     (setq _which_motor_data_had_errors (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int16[] _motor_data_packet_torque
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _motor_data_packet_torque (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _motor_data_packet_torque i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; int16[] _motor_data_packet_misc
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _motor_data_packet_misc (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _motor_data_packet_misc i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; int32 _tactile_data_type
     (setq _tactile_data_type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int16 _tactile_data_valid
     (setq _tactile_data_valid (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16[] _tactile
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _tactile (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _tactile i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; int16 _idle_time_us
     (setq _idle_time_us (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get sr_robot_msgs::EthercatDebug :md5sum-) "ed9e30784a7d4571ecf4d526e7ff529f")
(setf (get sr_robot_msgs::EthercatDebug :datatype-) "sr_robot_msgs/EthercatDebug")
(setf (get sr_robot_msgs::EthercatDebug :definition-)
      "Header               header

int16[]              sensors
FromMotorDataType    motor_data_type
int16                which_motors
int32                which_motor_data_arrived
int32                which_motor_data_had_errors
int16[]              motor_data_packet_torque
int16[]              motor_data_packet_misc
int32                tactile_data_type
int16                tactile_data_valid
int16[]              tactile
int16                idle_time_us

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

================================================================================
MSG: sr_robot_msgs/FromMotorDataType
int16 data
")



(provide :sr_robot_msgs/EthercatDebug "ed9e30784a7d4571ecf4d526e7ff529f")


