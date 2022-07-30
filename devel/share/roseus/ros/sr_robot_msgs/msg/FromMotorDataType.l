;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::FromMotorDataType)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'FromMotorDataType (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::FROMMOTORDATATYPE")
  (make-package "SR_ROBOT_MSGS::FROMMOTORDATATYPE"))

(in-package "ROS")
;;//! \htmlinclude FromMotorDataType.msg.html


(defclass sr_robot_msgs::FromMotorDataType
  :super ros::object
  :slots (_data ))

(defmethod sr_robot_msgs::FromMotorDataType
  (:init
   (&key
    ((:data __data) 0)
    )
   (send-super :init)
   (setq _data (round __data))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; int16 _data
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _data
       (write-word _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _data
     (setq _data (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get sr_robot_msgs::FromMotorDataType :md5sum-) "8524586e34fbd7cb1c08c5f5f1ca0e57")
(setf (get sr_robot_msgs::FromMotorDataType :datatype-) "sr_robot_msgs/FromMotorDataType")
(setf (get sr_robot_msgs::FromMotorDataType :definition-)
      "int16 data
")



(provide :sr_robot_msgs/FromMotorDataType "8524586e34fbd7cb1c08c5f5f1ca0e57")


