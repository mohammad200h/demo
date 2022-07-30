;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::MotorSystemControls)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'MotorSystemControls (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::MOTORSYSTEMCONTROLS")
  (make-package "SR_ROBOT_MSGS::MOTORSYSTEMCONTROLS"))

(in-package "ROS")
;;//! \htmlinclude MotorSystemControls.msg.html


(defclass sr_robot_msgs::MotorSystemControls
  :super ros::object
  :slots (_motor_id _enable_backlash_compensation _increase_sgl_tracking _decrease_sgl_tracking _increase_sgr_tracking _decrease_sgr_tracking _initiate_jiggling _write_config_to_eeprom ))

(defmethod sr_robot_msgs::MotorSystemControls
  (:init
   (&key
    ((:motor_id __motor_id) 0)
    ((:enable_backlash_compensation __enable_backlash_compensation) nil)
    ((:increase_sgl_tracking __increase_sgl_tracking) nil)
    ((:decrease_sgl_tracking __decrease_sgl_tracking) nil)
    ((:increase_sgr_tracking __increase_sgr_tracking) nil)
    ((:decrease_sgr_tracking __decrease_sgr_tracking) nil)
    ((:initiate_jiggling __initiate_jiggling) nil)
    ((:write_config_to_eeprom __write_config_to_eeprom) nil)
    )
   (send-super :init)
   (setq _motor_id (round __motor_id))
   (setq _enable_backlash_compensation __enable_backlash_compensation)
   (setq _increase_sgl_tracking __increase_sgl_tracking)
   (setq _decrease_sgl_tracking __decrease_sgl_tracking)
   (setq _increase_sgr_tracking __increase_sgr_tracking)
   (setq _decrease_sgr_tracking __decrease_sgr_tracking)
   (setq _initiate_jiggling __initiate_jiggling)
   (setq _write_config_to_eeprom __write_config_to_eeprom)
   self)
  (:motor_id
   (&optional __motor_id)
   (if __motor_id (setq _motor_id __motor_id)) _motor_id)
  (:enable_backlash_compensation
   (&optional __enable_backlash_compensation)
   (if __enable_backlash_compensation (setq _enable_backlash_compensation __enable_backlash_compensation)) _enable_backlash_compensation)
  (:increase_sgl_tracking
   (&optional __increase_sgl_tracking)
   (if __increase_sgl_tracking (setq _increase_sgl_tracking __increase_sgl_tracking)) _increase_sgl_tracking)
  (:decrease_sgl_tracking
   (&optional __decrease_sgl_tracking)
   (if __decrease_sgl_tracking (setq _decrease_sgl_tracking __decrease_sgl_tracking)) _decrease_sgl_tracking)
  (:increase_sgr_tracking
   (&optional __increase_sgr_tracking)
   (if __increase_sgr_tracking (setq _increase_sgr_tracking __increase_sgr_tracking)) _increase_sgr_tracking)
  (:decrease_sgr_tracking
   (&optional __decrease_sgr_tracking)
   (if __decrease_sgr_tracking (setq _decrease_sgr_tracking __decrease_sgr_tracking)) _decrease_sgr_tracking)
  (:initiate_jiggling
   (&optional __initiate_jiggling)
   (if __initiate_jiggling (setq _initiate_jiggling __initiate_jiggling)) _initiate_jiggling)
  (:write_config_to_eeprom
   (&optional __write_config_to_eeprom)
   (if __write_config_to_eeprom (setq _write_config_to_eeprom __write_config_to_eeprom)) _write_config_to_eeprom)
  (:serialization-length
   ()
   (+
    ;; int8 _motor_id
    1
    ;; bool _enable_backlash_compensation
    1
    ;; bool _increase_sgl_tracking
    1
    ;; bool _decrease_sgl_tracking
    1
    ;; bool _increase_sgr_tracking
    1
    ;; bool _decrease_sgr_tracking
    1
    ;; bool _initiate_jiggling
    1
    ;; bool _write_config_to_eeprom
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _motor_id
       (write-byte _motor_id s)
     ;; bool _enable_backlash_compensation
       (if _enable_backlash_compensation (write-byte -1 s) (write-byte 0 s))
     ;; bool _increase_sgl_tracking
       (if _increase_sgl_tracking (write-byte -1 s) (write-byte 0 s))
     ;; bool _decrease_sgl_tracking
       (if _decrease_sgl_tracking (write-byte -1 s) (write-byte 0 s))
     ;; bool _increase_sgr_tracking
       (if _increase_sgr_tracking (write-byte -1 s) (write-byte 0 s))
     ;; bool _decrease_sgr_tracking
       (if _decrease_sgr_tracking (write-byte -1 s) (write-byte 0 s))
     ;; bool _initiate_jiggling
       (if _initiate_jiggling (write-byte -1 s) (write-byte 0 s))
     ;; bool _write_config_to_eeprom
       (if _write_config_to_eeprom (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _motor_id
     (setq _motor_id (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _motor_id 127) (setq _motor_id (- _motor_id 256)))
   ;; bool _enable_backlash_compensation
     (setq _enable_backlash_compensation (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _increase_sgl_tracking
     (setq _increase_sgl_tracking (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _decrease_sgl_tracking
     (setq _decrease_sgl_tracking (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _increase_sgr_tracking
     (setq _increase_sgr_tracking (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _decrease_sgr_tracking
     (setq _decrease_sgr_tracking (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _initiate_jiggling
     (setq _initiate_jiggling (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _write_config_to_eeprom
     (setq _write_config_to_eeprom (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get sr_robot_msgs::MotorSystemControls :md5sum-) "0686822f46acfde0133711bd613a20f1")
(setf (get sr_robot_msgs::MotorSystemControls :datatype-) "sr_robot_msgs/MotorSystemControls")
(setf (get sr_robot_msgs::MotorSystemControls :definition-)
      "int8 motor_id                     # the id of the motor you want to control

bool enable_backlash_compensation # switch on/off backlash compensation at the motor level
bool increase_sgl_tracking        # increment the tracking value for the left gauge
bool decrease_sgl_tracking        # decrement the tracking value for the left gauge
bool increase_sgr_tracking        # increment the tracking value for the right gauge
bool decrease_sgr_tracking        # decrement the tracking value for the right gauge
bool initiate_jiggling            # starts jiggling the given motor
bool write_config_to_eeprom       # write the current configuration to the eeprom
")



(provide :sr_robot_msgs/MotorSystemControls "0686822f46acfde0133711bd613a20f1")


