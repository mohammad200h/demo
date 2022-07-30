;; Auto-generated. Do not edit!


(when (boundp 'sr_edc_ethercat_drivers::MotorTraceSample)
  (if (not (find-package "SR_EDC_ETHERCAT_DRIVERS"))
    (make-package "SR_EDC_ETHERCAT_DRIVERS"))
  (shadow 'MotorTraceSample (find-package "SR_EDC_ETHERCAT_DRIVERS")))
(unless (find-package "SR_EDC_ETHERCAT_DRIVERS::MOTORTRACESAMPLE")
  (make-package "SR_EDC_ETHERCAT_DRIVERS::MOTORTRACESAMPLE"))

(in-package "ROS")
;;//! \htmlinclude MotorTraceSample.msg.html


(defclass sr_edc_ethercat_drivers::MotorTraceSample
  :super ros::object
  :slots (_commanded_effort _slow_effort_limit _quick_effort_limit _motor_current _motor_supply_voltage _hbridge_duty _temperature _force_sensor_1 _force_sensor_2 _force_sensor_3 _motor_velocity _velocity _position ))

(defmethod sr_edc_ethercat_drivers::MotorTraceSample
  (:init
   (&key
    ((:commanded_effort __commanded_effort) 0.0)
    ((:slow_effort_limit __slow_effort_limit) 0.0)
    ((:quick_effort_limit __quick_effort_limit) 0.0)
    ((:motor_current __motor_current) 0.0)
    ((:motor_supply_voltage __motor_supply_voltage) 0.0)
    ((:hbridge_duty __hbridge_duty) 0.0)
    ((:temperature __temperature) 0.0)
    ((:force_sensor_1 __force_sensor_1) 0.0)
    ((:force_sensor_2 __force_sensor_2) 0.0)
    ((:force_sensor_3 __force_sensor_3) 0.0)
    ((:motor_velocity __motor_velocity) 0.0)
    ((:velocity __velocity) 0.0)
    ((:position __position) 0.0)
    )
   (send-super :init)
   (setq _commanded_effort (float __commanded_effort))
   (setq _slow_effort_limit (float __slow_effort_limit))
   (setq _quick_effort_limit (float __quick_effort_limit))
   (setq _motor_current (float __motor_current))
   (setq _motor_supply_voltage (float __motor_supply_voltage))
   (setq _hbridge_duty (float __hbridge_duty))
   (setq _temperature (float __temperature))
   (setq _force_sensor_1 (float __force_sensor_1))
   (setq _force_sensor_2 (float __force_sensor_2))
   (setq _force_sensor_3 (float __force_sensor_3))
   (setq _motor_velocity (float __motor_velocity))
   (setq _velocity (float __velocity))
   (setq _position (float __position))
   self)
  (:commanded_effort
   (&optional __commanded_effort)
   (if __commanded_effort (setq _commanded_effort __commanded_effort)) _commanded_effort)
  (:slow_effort_limit
   (&optional __slow_effort_limit)
   (if __slow_effort_limit (setq _slow_effort_limit __slow_effort_limit)) _slow_effort_limit)
  (:quick_effort_limit
   (&optional __quick_effort_limit)
   (if __quick_effort_limit (setq _quick_effort_limit __quick_effort_limit)) _quick_effort_limit)
  (:motor_current
   (&optional __motor_current)
   (if __motor_current (setq _motor_current __motor_current)) _motor_current)
  (:motor_supply_voltage
   (&optional __motor_supply_voltage)
   (if __motor_supply_voltage (setq _motor_supply_voltage __motor_supply_voltage)) _motor_supply_voltage)
  (:hbridge_duty
   (&optional __hbridge_duty)
   (if __hbridge_duty (setq _hbridge_duty __hbridge_duty)) _hbridge_duty)
  (:temperature
   (&optional __temperature)
   (if __temperature (setq _temperature __temperature)) _temperature)
  (:force_sensor_1
   (&optional __force_sensor_1)
   (if __force_sensor_1 (setq _force_sensor_1 __force_sensor_1)) _force_sensor_1)
  (:force_sensor_2
   (&optional __force_sensor_2)
   (if __force_sensor_2 (setq _force_sensor_2 __force_sensor_2)) _force_sensor_2)
  (:force_sensor_3
   (&optional __force_sensor_3)
   (if __force_sensor_3 (setq _force_sensor_3 __force_sensor_3)) _force_sensor_3)
  (:motor_velocity
   (&optional __motor_velocity)
   (if __motor_velocity (setq _motor_velocity __motor_velocity)) _motor_velocity)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:serialization-length
   ()
   (+
    ;; float64 _commanded_effort
    8
    ;; float64 _slow_effort_limit
    8
    ;; float64 _quick_effort_limit
    8
    ;; float64 _motor_current
    8
    ;; float64 _motor_supply_voltage
    8
    ;; float64 _hbridge_duty
    8
    ;; float64 _temperature
    8
    ;; float64 _force_sensor_1
    8
    ;; float64 _force_sensor_2
    8
    ;; float64 _force_sensor_3
    8
    ;; float64 _motor_velocity
    8
    ;; float64 _velocity
    8
    ;; float64 _position
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _commanded_effort
       (sys::poke _commanded_effort (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _slow_effort_limit
       (sys::poke _slow_effort_limit (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _quick_effort_limit
       (sys::poke _quick_effort_limit (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _motor_current
       (sys::poke _motor_current (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _motor_supply_voltage
       (sys::poke _motor_supply_voltage (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _hbridge_duty
       (sys::poke _hbridge_duty (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _temperature
       (sys::poke _temperature (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _force_sensor_1
       (sys::poke _force_sensor_1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _force_sensor_2
       (sys::poke _force_sensor_2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _force_sensor_3
       (sys::poke _force_sensor_3 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _motor_velocity
       (sys::poke _motor_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position
       (sys::poke _position (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _commanded_effort
     (setq _commanded_effort (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _slow_effort_limit
     (setq _slow_effort_limit (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _quick_effort_limit
     (setq _quick_effort_limit (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _motor_current
     (setq _motor_current (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _motor_supply_voltage
     (setq _motor_supply_voltage (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _hbridge_duty
     (setq _hbridge_duty (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _temperature
     (setq _temperature (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _force_sensor_1
     (setq _force_sensor_1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _force_sensor_2
     (setq _force_sensor_2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _force_sensor_3
     (setq _force_sensor_3 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _motor_velocity
     (setq _motor_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity
     (setq _velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position
     (setq _position (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get sr_edc_ethercat_drivers::MotorTraceSample :md5sum-) "f5faf420d7c29e68b1c6bfdff440ffb8")
(setf (get sr_edc_ethercat_drivers::MotorTraceSample :datatype-) "sr_edc_ethercat_drivers/MotorTraceSample")
(setf (get sr_edc_ethercat_drivers::MotorTraceSample :definition-)
      "float64 commanded_effort
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



(provide :sr_edc_ethercat_drivers/MotorTraceSample "f5faf420d7c29e68b1c6bfdff440ffb8")


