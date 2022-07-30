;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::SetDebugData)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'SetDebugData (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::SETDEBUGDATA")
  (make-package "SR_ROBOT_MSGS::SETDEBUGDATA"))
(unless (find-package "SR_ROBOT_MSGS::SETDEBUGDATAREQUEST")
  (make-package "SR_ROBOT_MSGS::SETDEBUGDATAREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::SETDEBUGDATARESPONSE")
  (make-package "SR_ROBOT_MSGS::SETDEBUGDATARESPONSE"))

(in-package "ROS")





(defclass sr_robot_msgs::SetDebugDataRequest
  :super ros::object
  :slots (_motor_index _motor_data_type _publisher_index ))

(defmethod sr_robot_msgs::SetDebugDataRequest
  (:init
   (&key
    ((:motor_index __motor_index) 0)
    ((:motor_data_type __motor_data_type) 0)
    ((:publisher_index __publisher_index) 0)
    )
   (send-super :init)
   (setq _motor_index (round __motor_index))
   (setq _motor_data_type (round __motor_data_type))
   (setq _publisher_index (round __publisher_index))
   self)
  (:motor_index
   (&optional __motor_index)
   (if __motor_index (setq _motor_index __motor_index)) _motor_index)
  (:motor_data_type
   (&optional __motor_data_type)
   (if __motor_data_type (setq _motor_data_type __motor_data_type)) _motor_data_type)
  (:publisher_index
   (&optional __publisher_index)
   (if __publisher_index (setq _publisher_index __publisher_index)) _publisher_index)
  (:serialization-length
   ()
   (+
    ;; int16 _motor_index
    2
    ;; int16 _motor_data_type
    2
    ;; int16 _publisher_index
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _motor_index
       (write-word _motor_index s)
     ;; int16 _motor_data_type
       (write-word _motor_data_type s)
     ;; int16 _publisher_index
       (write-word _publisher_index s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _motor_index
     (setq _motor_index (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _motor_data_type
     (setq _motor_data_type (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _publisher_index
     (setq _publisher_index (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass sr_robot_msgs::SetDebugDataResponse
  :super ros::object
  :slots (_success ))

(defmethod sr_robot_msgs::SetDebugDataResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass sr_robot_msgs::SetDebugData
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::SetDebugData :md5sum-) "7e92428f248882f525037fe3b24dbbf1")
(setf (get sr_robot_msgs::SetDebugData :datatype-) "sr_robot_msgs/SetDebugData")
(setf (get sr_robot_msgs::SetDebugData :request) sr_robot_msgs::SetDebugDataRequest)
(setf (get sr_robot_msgs::SetDebugData :response) sr_robot_msgs::SetDebugDataResponse)

(defmethod sr_robot_msgs::SetDebugDataRequest
  (:response () (instance sr_robot_msgs::SetDebugDataResponse :init)))

(setf (get sr_robot_msgs::SetDebugDataRequest :md5sum-) "7e92428f248882f525037fe3b24dbbf1")
(setf (get sr_robot_msgs::SetDebugDataRequest :datatype-) "sr_robot_msgs/SetDebugDataRequest")
(setf (get sr_robot_msgs::SetDebugDataRequest :definition-)
      "



int16 motor_index
int16 motor_data_type
int16 publisher_index
---
bool success
")

(setf (get sr_robot_msgs::SetDebugDataResponse :md5sum-) "7e92428f248882f525037fe3b24dbbf1")
(setf (get sr_robot_msgs::SetDebugDataResponse :datatype-) "sr_robot_msgs/SetDebugDataResponse")
(setf (get sr_robot_msgs::SetDebugDataResponse :definition-)
      "



int16 motor_index
int16 motor_data_type
int16 publisher_index
---
bool success
")



(provide :sr_robot_msgs/SetDebugData "7e92428f248882f525037fe3b24dbbf1")


