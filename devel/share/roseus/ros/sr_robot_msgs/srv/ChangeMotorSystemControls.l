;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::ChangeMotorSystemControls)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'ChangeMotorSystemControls (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::CHANGEMOTORSYSTEMCONTROLS")
  (make-package "SR_ROBOT_MSGS::CHANGEMOTORSYSTEMCONTROLS"))
(unless (find-package "SR_ROBOT_MSGS::CHANGEMOTORSYSTEMCONTROLSREQUEST")
  (make-package "SR_ROBOT_MSGS::CHANGEMOTORSYSTEMCONTROLSREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::CHANGEMOTORSYSTEMCONTROLSRESPONSE")
  (make-package "SR_ROBOT_MSGS::CHANGEMOTORSYSTEMCONTROLSRESPONSE"))

(in-package "ROS")





(defclass sr_robot_msgs::ChangeMotorSystemControlsRequest
  :super ros::object
  :slots (_motor_system_controls ))

(defmethod sr_robot_msgs::ChangeMotorSystemControlsRequest
  (:init
   (&key
    ((:motor_system_controls __motor_system_controls) (let (r) (dotimes (i 0) (push (instance sr_robot_msgs::MotorSystemControls :init) r)) r))
    )
   (send-super :init)
   (setq _motor_system_controls __motor_system_controls)
   self)
  (:motor_system_controls
   (&rest __motor_system_controls)
   (if (keywordp (car __motor_system_controls))
       (send* _motor_system_controls __motor_system_controls)
     (progn
       (if __motor_system_controls (setq _motor_system_controls (car __motor_system_controls)))
       _motor_system_controls)))
  (:serialization-length
   ()
   (+
    ;; sr_robot_msgs/MotorSystemControls[] _motor_system_controls
    (apply #'+ (send-all _motor_system_controls :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sr_robot_msgs/MotorSystemControls[] _motor_system_controls
     (write-long (length _motor_system_controls) s)
     (dolist (elem _motor_system_controls)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sr_robot_msgs/MotorSystemControls[] _motor_system_controls
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _motor_system_controls (let (r) (dotimes (i n) (push (instance sr_robot_msgs::MotorSystemControls :init) r)) r))
     (dolist (elem- _motor_system_controls)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(intern "*SUCCESS*" (find-package "SR_ROBOT_MSGS::CHANGEMOTORSYSTEMCONTROLSRESPONSE"))
(shadow '*SUCCESS* (find-package "SR_ROBOT_MSGS::CHANGEMOTORSYSTEMCONTROLSRESPONSE"))
(defconstant sr_robot_msgs::ChangeMotorSystemControlsResponse::*SUCCESS* 0)
(intern "*MOTOR_ID_OUT_OF_RANGE*" (find-package "SR_ROBOT_MSGS::CHANGEMOTORSYSTEMCONTROLSRESPONSE"))
(shadow '*MOTOR_ID_OUT_OF_RANGE* (find-package "SR_ROBOT_MSGS::CHANGEMOTORSYSTEMCONTROLSRESPONSE"))
(defconstant sr_robot_msgs::ChangeMotorSystemControlsResponse::*MOTOR_ID_OUT_OF_RANGE* -1)
(defclass sr_robot_msgs::ChangeMotorSystemControlsResponse
  :super ros::object
  :slots (_result ))

(defmethod sr_robot_msgs::ChangeMotorSystemControlsResponse
  (:init
   (&key
    ((:result __result) 0)
    )
   (send-super :init)
   (setq _result (round __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; int8 _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _result
       (write-byte _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _result
     (setq _result (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _result 127) (setq _result (- _result 256)))
   ;;
   self)
  )

(defclass sr_robot_msgs::ChangeMotorSystemControls
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::ChangeMotorSystemControls :md5sum-) "d953bca2f568403b8e2c3f41c87d9ac4")
(setf (get sr_robot_msgs::ChangeMotorSystemControls :datatype-) "sr_robot_msgs/ChangeMotorSystemControls")
(setf (get sr_robot_msgs::ChangeMotorSystemControls :request) sr_robot_msgs::ChangeMotorSystemControlsRequest)
(setf (get sr_robot_msgs::ChangeMotorSystemControls :response) sr_robot_msgs::ChangeMotorSystemControlsResponse)

(defmethod sr_robot_msgs::ChangeMotorSystemControlsRequest
  (:response () (instance sr_robot_msgs::ChangeMotorSystemControlsResponse :init)))

(setf (get sr_robot_msgs::ChangeMotorSystemControlsRequest :md5sum-) "d953bca2f568403b8e2c3f41c87d9ac4")
(setf (get sr_robot_msgs::ChangeMotorSystemControlsRequest :datatype-) "sr_robot_msgs/ChangeMotorSystemControlsRequest")
(setf (get sr_robot_msgs::ChangeMotorSystemControlsRequest :definition-)
      "MotorSystemControls[] motor_system_controls

================================================================================
MSG: sr_robot_msgs/MotorSystemControls
int8 motor_id                     # the id of the motor you want to control

bool enable_backlash_compensation # switch on/off backlash compensation at the motor level
bool increase_sgl_tracking        # increment the tracking value for the left gauge
bool decrease_sgl_tracking        # decrement the tracking value for the left gauge
bool increase_sgr_tracking        # increment the tracking value for the right gauge
bool decrease_sgr_tracking        # decrement the tracking value for the right gauge
bool initiate_jiggling            # starts jiggling the given motor
---
int8 result

int8 SUCCESS=0
int8 MOTOR_ID_OUT_OF_RANGE=-1
")

(setf (get sr_robot_msgs::ChangeMotorSystemControlsResponse :md5sum-) "d953bca2f568403b8e2c3f41c87d9ac4")
(setf (get sr_robot_msgs::ChangeMotorSystemControlsResponse :datatype-) "sr_robot_msgs/ChangeMotorSystemControlsResponse")
(setf (get sr_robot_msgs::ChangeMotorSystemControlsResponse :definition-)
      "MotorSystemControls[] motor_system_controls

================================================================================
MSG: sr_robot_msgs/MotorSystemControls
int8 motor_id                     # the id of the motor you want to control

bool enable_backlash_compensation # switch on/off backlash compensation at the motor level
bool increase_sgl_tracking        # increment the tracking value for the left gauge
bool decrease_sgl_tracking        # decrement the tracking value for the left gauge
bool increase_sgr_tracking        # increment the tracking value for the right gauge
bool decrease_sgr_tracking        # decrement the tracking value for the right gauge
bool initiate_jiggling            # starts jiggling the given motor
---
int8 result

int8 SUCCESS=0
int8 MOTOR_ID_OUT_OF_RANGE=-1
")



(provide :sr_robot_msgs/ChangeMotorSystemControls "d953bca2f568403b8e2c3f41c87d9ac4")


