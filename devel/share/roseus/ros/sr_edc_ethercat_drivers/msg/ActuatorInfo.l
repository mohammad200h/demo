;; Auto-generated. Do not edit!


(when (boundp 'sr_edc_ethercat_drivers::ActuatorInfo)
  (if (not (find-package "SR_EDC_ETHERCAT_DRIVERS"))
    (make-package "SR_EDC_ETHERCAT_DRIVERS"))
  (shadow 'ActuatorInfo (find-package "SR_EDC_ETHERCAT_DRIVERS")))
(unless (find-package "SR_EDC_ETHERCAT_DRIVERS::ACTUATORINFO")
  (make-package "SR_EDC_ETHERCAT_DRIVERS::ACTUATORINFO"))

(in-package "ROS")
;;//! \htmlinclude ActuatorInfo.msg.html


(defclass sr_edc_ethercat_drivers::ActuatorInfo
  :super ros::object
  :slots (_name _slow_motor_current_limit _quick_motor_current_limit _duty_limit _max_duty ))

(defmethod sr_edc_ethercat_drivers::ActuatorInfo
  (:init
   (&key
    ((:name __name) "")
    ((:slow_motor_current_limit __slow_motor_current_limit) 0.0)
    ((:quick_motor_current_limit __quick_motor_current_limit) 0.0)
    ((:duty_limit __duty_limit) 0.0)
    ((:max_duty __max_duty) 0.0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _slow_motor_current_limit (float __slow_motor_current_limit))
   (setq _quick_motor_current_limit (float __quick_motor_current_limit))
   (setq _duty_limit (float __duty_limit))
   (setq _max_duty (float __max_duty))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:slow_motor_current_limit
   (&optional __slow_motor_current_limit)
   (if __slow_motor_current_limit (setq _slow_motor_current_limit __slow_motor_current_limit)) _slow_motor_current_limit)
  (:quick_motor_current_limit
   (&optional __quick_motor_current_limit)
   (if __quick_motor_current_limit (setq _quick_motor_current_limit __quick_motor_current_limit)) _quick_motor_current_limit)
  (:duty_limit
   (&optional __duty_limit)
   (if __duty_limit (setq _duty_limit __duty_limit)) _duty_limit)
  (:max_duty
   (&optional __max_duty)
   (if __max_duty (setq _max_duty __max_duty)) _max_duty)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; float64 _slow_motor_current_limit
    8
    ;; float64 _quick_motor_current_limit
    8
    ;; float64 _duty_limit
    8
    ;; float64 _max_duty
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; float64 _slow_motor_current_limit
       (sys::poke _slow_motor_current_limit (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _quick_motor_current_limit
       (sys::poke _quick_motor_current_limit (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _duty_limit
       (sys::poke _duty_limit (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _max_duty
       (sys::poke _max_duty (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _slow_motor_current_limit
     (setq _slow_motor_current_limit (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _quick_motor_current_limit
     (setq _quick_motor_current_limit (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _duty_limit
     (setq _duty_limit (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _max_duty
     (setq _max_duty (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get sr_edc_ethercat_drivers::ActuatorInfo :md5sum-) "b69309b2980b8b35e7e2b52bad59330a")
(setf (get sr_edc_ethercat_drivers::ActuatorInfo :datatype-) "sr_edc_ethercat_drivers/ActuatorInfo")
(setf (get sr_edc_ethercat_drivers::ActuatorInfo :definition-)
      "string name
float64 slow_motor_current_limit
float64 quick_motor_current_limit
float64 duty_limit
float64 max_duty
")



(provide :sr_edc_ethercat_drivers/ActuatorInfo "b69309b2980b8b35e7e2b52bad59330a")


