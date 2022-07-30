;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::ChangeControlType)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'ChangeControlType (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::CHANGECONTROLTYPE")
  (make-package "SR_ROBOT_MSGS::CHANGECONTROLTYPE"))
(unless (find-package "SR_ROBOT_MSGS::CHANGECONTROLTYPEREQUEST")
  (make-package "SR_ROBOT_MSGS::CHANGECONTROLTYPEREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::CHANGECONTROLTYPERESPONSE")
  (make-package "SR_ROBOT_MSGS::CHANGECONTROLTYPERESPONSE"))

(in-package "ROS")





(defclass sr_robot_msgs::ChangeControlTypeRequest
  :super ros::object
  :slots (_control_type ))

(defmethod sr_robot_msgs::ChangeControlTypeRequest
  (:init
   (&key
    ((:control_type __control_type) (instance sr_robot_msgs::ControlType :init))
    )
   (send-super :init)
   (setq _control_type __control_type)
   self)
  (:control_type
   (&rest __control_type)
   (if (keywordp (car __control_type))
       (send* _control_type __control_type)
     (progn
       (if __control_type (setq _control_type (car __control_type)))
       _control_type)))
  (:serialization-length
   ()
   (+
    ;; sr_robot_msgs/ControlType _control_type
    (send _control_type :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sr_robot_msgs/ControlType _control_type
       (send _control_type :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sr_robot_msgs/ControlType _control_type
     (send _control_type :deserialize buf ptr-) (incf ptr- (send _control_type :serialization-length))
   ;;
   self)
  )

(defclass sr_robot_msgs::ChangeControlTypeResponse
  :super ros::object
  :slots (_result ))

(defmethod sr_robot_msgs::ChangeControlTypeResponse
  (:init
   (&key
    ((:result __result) (instance sr_robot_msgs::ControlType :init))
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&rest __result)
   (if (keywordp (car __result))
       (send* _result __result)
     (progn
       (if __result (setq _result (car __result)))
       _result)))
  (:serialization-length
   ()
   (+
    ;; sr_robot_msgs/ControlType _result
    (send _result :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sr_robot_msgs/ControlType _result
       (send _result :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sr_robot_msgs/ControlType _result
     (send _result :deserialize buf ptr-) (incf ptr- (send _result :serialization-length))
   ;;
   self)
  )

(defclass sr_robot_msgs::ChangeControlType
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::ChangeControlType :md5sum-) "14cedf5030b722e2c8df2dc57f9cdb58")
(setf (get sr_robot_msgs::ChangeControlType :datatype-) "sr_robot_msgs/ChangeControlType")
(setf (get sr_robot_msgs::ChangeControlType :request) sr_robot_msgs::ChangeControlTypeRequest)
(setf (get sr_robot_msgs::ChangeControlType :response) sr_robot_msgs::ChangeControlTypeResponse)

(defmethod sr_robot_msgs::ChangeControlTypeRequest
  (:response () (instance sr_robot_msgs::ChangeControlTypeResponse :init)))

(setf (get sr_robot_msgs::ChangeControlTypeRequest :md5sum-) "14cedf5030b722e2c8df2dc57f9cdb58")
(setf (get sr_robot_msgs::ChangeControlTypeRequest :datatype-) "sr_robot_msgs/ChangeControlTypeRequest")
(setf (get sr_robot_msgs::ChangeControlTypeRequest :definition-)
      "ControlType control_type

================================================================================
MSG: sr_robot_msgs/ControlType
int16 control_type

int16 PWM=0
int16 FORCE=1

#used to query which control type we're using. won't change the control type
---
ControlType result

================================================================================
MSG: sr_robot_msgs/ControlType
int16 control_type

int16 PWM=0
int16 FORCE=1

#used to query which control type we're using. won't change the control type
")

(setf (get sr_robot_msgs::ChangeControlTypeResponse :md5sum-) "14cedf5030b722e2c8df2dc57f9cdb58")
(setf (get sr_robot_msgs::ChangeControlTypeResponse :datatype-) "sr_robot_msgs/ChangeControlTypeResponse")
(setf (get sr_robot_msgs::ChangeControlTypeResponse :definition-)
      "ControlType control_type

================================================================================
MSG: sr_robot_msgs/ControlType
int16 control_type

int16 PWM=0
int16 FORCE=1

#used to query which control type we're using. won't change the control type
---
ControlType result

================================================================================
MSG: sr_robot_msgs/ControlType
int16 control_type

int16 PWM=0
int16 FORCE=1

#used to query which control type we're using. won't change the control type
")



(provide :sr_robot_msgs/ChangeControlType "14cedf5030b722e2c8df2dc57f9cdb58")


