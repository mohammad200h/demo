;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::ControlType)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'ControlType (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::CONTROLTYPE")
  (make-package "SR_ROBOT_MSGS::CONTROLTYPE"))

(in-package "ROS")
;;//! \htmlinclude ControlType.msg.html


(intern "*PWM*" (find-package "SR_ROBOT_MSGS::CONTROLTYPE"))
(shadow '*PWM* (find-package "SR_ROBOT_MSGS::CONTROLTYPE"))
(defconstant sr_robot_msgs::ControlType::*PWM* 0)
(intern "*FORCE*" (find-package "SR_ROBOT_MSGS::CONTROLTYPE"))
(shadow '*FORCE* (find-package "SR_ROBOT_MSGS::CONTROLTYPE"))
(defconstant sr_robot_msgs::ControlType::*FORCE* 1)
(intern "*QUERY*" (find-package "SR_ROBOT_MSGS::CONTROLTYPE"))
(shadow '*QUERY* (find-package "SR_ROBOT_MSGS::CONTROLTYPE"))
(defconstant sr_robot_msgs::ControlType::*QUERY* -1)
(defclass sr_robot_msgs::ControlType
  :super ros::object
  :slots (_control_type ))

(defmethod sr_robot_msgs::ControlType
  (:init
   (&key
    ((:control_type __control_type) 0)
    )
   (send-super :init)
   (setq _control_type (round __control_type))
   self)
  (:control_type
   (&optional __control_type)
   (if __control_type (setq _control_type __control_type)) _control_type)
  (:serialization-length
   ()
   (+
    ;; int16 _control_type
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _control_type
       (write-word _control_type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _control_type
     (setq _control_type (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get sr_robot_msgs::ControlType :md5sum-) "b998c8b3b8aa0f2f53f0eaa45ee462bd")
(setf (get sr_robot_msgs::ControlType :datatype-) "sr_robot_msgs/ControlType")
(setf (get sr_robot_msgs::ControlType :definition-)
      "int16 control_type

int16 PWM=0
int16 FORCE=1

#used to query which control type we're using. won't change the control type
int16 QUERY=-1
")



(provide :sr_robot_msgs/ControlType "b998c8b3b8aa0f2f53f0eaa45ee462bd")


