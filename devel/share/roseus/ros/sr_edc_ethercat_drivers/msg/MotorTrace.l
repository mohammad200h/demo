;; Auto-generated. Do not edit!


(when (boundp 'sr_edc_ethercat_drivers::MotorTrace)
  (if (not (find-package "SR_EDC_ETHERCAT_DRIVERS"))
    (make-package "SR_EDC_ETHERCAT_DRIVERS"))
  (shadow 'MotorTrace (find-package "SR_EDC_ETHERCAT_DRIVERS")))
(unless (find-package "SR_EDC_ETHERCAT_DRIVERS::MOTORTRACE")
  (make-package "SR_EDC_ETHERCAT_DRIVERS::MOTORTRACE"))

(in-package "ROS")
;;//! \htmlinclude MotorTrace.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sr_edc_ethercat_drivers::MotorTrace
  :super ros::object
  :slots (_header _reason _actuator_info _samples ))

(defmethod sr_edc_ethercat_drivers::MotorTrace
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:reason __reason) "")
    ((:actuator_info __actuator_info) (instance sr_edc_ethercat_drivers::ActuatorInfo :init))
    ((:samples __samples) (let (r) (dotimes (i 0) (push (instance sr_edc_ethercat_drivers::MotorTraceSample :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _reason (string __reason))
   (setq _actuator_info __actuator_info)
   (setq _samples __samples)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:reason
   (&optional __reason)
   (if __reason (setq _reason __reason)) _reason)
  (:actuator_info
   (&rest __actuator_info)
   (if (keywordp (car __actuator_info))
       (send* _actuator_info __actuator_info)
     (progn
       (if __actuator_info (setq _actuator_info (car __actuator_info)))
       _actuator_info)))
  (:samples
   (&rest __samples)
   (if (keywordp (car __samples))
       (send* _samples __samples)
     (progn
       (if __samples (setq _samples (car __samples)))
       _samples)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _reason
    4 (length _reason)
    ;; sr_edc_ethercat_drivers/ActuatorInfo _actuator_info
    (send _actuator_info :serialization-length)
    ;; sr_edc_ethercat_drivers/MotorTraceSample[] _samples
    (apply #'+ (send-all _samples :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _reason
       (write-long (length _reason) s) (princ _reason s)
     ;; sr_edc_ethercat_drivers/ActuatorInfo _actuator_info
       (send _actuator_info :serialize s)
     ;; sr_edc_ethercat_drivers/MotorTraceSample[] _samples
     (write-long (length _samples) s)
     (dolist (elem _samples)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _reason
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _reason (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; sr_edc_ethercat_drivers/ActuatorInfo _actuator_info
     (send _actuator_info :deserialize buf ptr-) (incf ptr- (send _actuator_info :serialization-length))
   ;; sr_edc_ethercat_drivers/MotorTraceSample[] _samples
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _samples (let (r) (dotimes (i n) (push (instance sr_edc_ethercat_drivers::MotorTraceSample :init) r)) r))
     (dolist (elem- _samples)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get sr_edc_ethercat_drivers::MotorTrace :md5sum-) "d06300e55fe6989d2795bc4072205fe1")
(setf (get sr_edc_ethercat_drivers::MotorTrace :datatype-) "sr_edc_ethercat_drivers/MotorTrace")
(setf (get sr_edc_ethercat_drivers::MotorTrace :definition-)
      "Header header
string reason
sr_edc_ethercat_drivers/ActuatorInfo actuator_info
sr_edc_ethercat_drivers/MotorTraceSample[] samples

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
MSG: sr_edc_ethercat_drivers/ActuatorInfo
string name
float64 slow_motor_current_limit
float64 quick_motor_current_limit
float64 duty_limit
float64 max_duty
================================================================================
MSG: sr_edc_ethercat_drivers/MotorTraceSample
float64 commanded_effort
float64 slow_effort_limit
float64 quick_effort_limit
float64 motor_current
float64 motor_supply_voltage
float64 hbridge_duty
float64 temperature
float64 force_sensor_1
float64 force_sensor_2
float64 force_sensor_3
float64 motor_velocity
float64 velocity
float64 position

")



(provide :sr_edc_ethercat_drivers/MotorTrace "d06300e55fe6989d2795bc4072205fe1")


