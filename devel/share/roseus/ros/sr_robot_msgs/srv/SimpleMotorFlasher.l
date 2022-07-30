;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::SimpleMotorFlasher)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'SimpleMotorFlasher (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::SIMPLEMOTORFLASHER")
  (make-package "SR_ROBOT_MSGS::SIMPLEMOTORFLASHER"))
(unless (find-package "SR_ROBOT_MSGS::SIMPLEMOTORFLASHERREQUEST")
  (make-package "SR_ROBOT_MSGS::SIMPLEMOTORFLASHERREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::SIMPLEMOTORFLASHERRESPONSE")
  (make-package "SR_ROBOT_MSGS::SIMPLEMOTORFLASHERRESPONSE"))

(in-package "ROS")





(defclass sr_robot_msgs::SimpleMotorFlasherRequest
  :super ros::object
  :slots (_firmware _motor_id ))

(defmethod sr_robot_msgs::SimpleMotorFlasherRequest
  (:init
   (&key
    ((:firmware __firmware) "")
    ((:motor_id __motor_id) 0)
    )
   (send-super :init)
   (setq _firmware (string __firmware))
   (setq _motor_id (round __motor_id))
   self)
  (:firmware
   (&optional __firmware)
   (if __firmware (setq _firmware __firmware)) _firmware)
  (:motor_id
   (&optional __motor_id)
   (if __motor_id (setq _motor_id __motor_id)) _motor_id)
  (:serialization-length
   ()
   (+
    ;; string _firmware
    4 (length _firmware)
    ;; int8 _motor_id
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _firmware
       (write-long (length _firmware) s) (princ _firmware s)
     ;; int8 _motor_id
       (write-byte _motor_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _firmware
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _firmware (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int8 _motor_id
     (setq _motor_id (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _motor_id 127) (setq _motor_id (- _motor_id 256)))
   ;;
   self)
  )

(intern "*SUCCESS*" (find-package "SR_ROBOT_MSGS::SIMPLEMOTORFLASHERRESPONSE"))
(shadow '*SUCCESS* (find-package "SR_ROBOT_MSGS::SIMPLEMOTORFLASHERRESPONSE"))
(defconstant sr_robot_msgs::SimpleMotorFlasherResponse::*SUCCESS* 0)
(intern "*FAIL*" (find-package "SR_ROBOT_MSGS::SIMPLEMOTORFLASHERRESPONSE"))
(shadow '*FAIL* (find-package "SR_ROBOT_MSGS::SIMPLEMOTORFLASHERRESPONSE"))
(defconstant sr_robot_msgs::SimpleMotorFlasherResponse::*FAIL* 1)
(defclass sr_robot_msgs::SimpleMotorFlasherResponse
  :super ros::object
  :slots (_value ))

(defmethod sr_robot_msgs::SimpleMotorFlasherResponse
  (:init
   (&key
    ((:value __value) 0)
    )
   (send-super :init)
   (setq _value (round __value))
   self)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; int32 _value
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _value
       (write-long _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _value
     (setq _value (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass sr_robot_msgs::SimpleMotorFlasher
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::SimpleMotorFlasher :md5sum-) "b5e4cd4b44ed54dd8f018caf24a9e0c1")
(setf (get sr_robot_msgs::SimpleMotorFlasher :datatype-) "sr_robot_msgs/SimpleMotorFlasher")
(setf (get sr_robot_msgs::SimpleMotorFlasher :request) sr_robot_msgs::SimpleMotorFlasherRequest)
(setf (get sr_robot_msgs::SimpleMotorFlasher :response) sr_robot_msgs::SimpleMotorFlasherResponse)

(defmethod sr_robot_msgs::SimpleMotorFlasherRequest
  (:response () (instance sr_robot_msgs::SimpleMotorFlasherResponse :init)))

(setf (get sr_robot_msgs::SimpleMotorFlasherRequest :md5sum-) "b5e4cd4b44ed54dd8f018caf24a9e0c1")
(setf (get sr_robot_msgs::SimpleMotorFlasherRequest :datatype-) "sr_robot_msgs/SimpleMotorFlasherRequest")
(setf (get sr_robot_msgs::SimpleMotorFlasherRequest :definition-)
      "string firmware
int8 motor_id
---
int32 value

int32 SUCCESS = 0
int32 FAIL = 1

")

(setf (get sr_robot_msgs::SimpleMotorFlasherResponse :md5sum-) "b5e4cd4b44ed54dd8f018caf24a9e0c1")
(setf (get sr_robot_msgs::SimpleMotorFlasherResponse :datatype-) "sr_robot_msgs/SimpleMotorFlasherResponse")
(setf (get sr_robot_msgs::SimpleMotorFlasherResponse :definition-)
      "string firmware
int8 motor_id
---
int32 value

int32 SUCCESS = 0
int32 FAIL = 1

")



(provide :sr_robot_msgs/SimpleMotorFlasher "b5e4cd4b44ed54dd8f018caf24a9e0c1")


