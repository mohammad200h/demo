;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::SetTeachMode)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'SetTeachMode (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::SETTEACHMODE")
  (make-package "SR_ROBOT_MSGS::SETTEACHMODE"))
(unless (find-package "SR_ROBOT_MSGS::SETTEACHMODEREQUEST")
  (make-package "SR_ROBOT_MSGS::SETTEACHMODEREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::SETTEACHMODERESPONSE")
  (make-package "SR_ROBOT_MSGS::SETTEACHMODERESPONSE"))

(in-package "ROS")





(defclass sr_robot_msgs::SetTeachModeRequest
  :super ros::object
  :slots (_teach_mode ))

(defmethod sr_robot_msgs::SetTeachModeRequest
  (:init
   (&key
    ((:teach_mode __teach_mode) nil)
    )
   (send-super :init)
   (setq _teach_mode __teach_mode)
   self)
  (:teach_mode
   (&optional __teach_mode)
   (if __teach_mode (setq _teach_mode __teach_mode)) _teach_mode)
  (:serialization-length
   ()
   (+
    ;; bool _teach_mode
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _teach_mode
       (if _teach_mode (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _teach_mode
     (setq _teach_mode (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass sr_robot_msgs::SetTeachModeResponse
  :super ros::object
  :slots (_success ))

(defmethod sr_robot_msgs::SetTeachModeResponse
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

(defclass sr_robot_msgs::SetTeachMode
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::SetTeachMode :md5sum-) "f1d4dfab21529bcec06249bcf0db7d58")
(setf (get sr_robot_msgs::SetTeachMode :datatype-) "sr_robot_msgs/SetTeachMode")
(setf (get sr_robot_msgs::SetTeachMode :request) sr_robot_msgs::SetTeachModeRequest)
(setf (get sr_robot_msgs::SetTeachMode :response) sr_robot_msgs::SetTeachModeResponse)

(defmethod sr_robot_msgs::SetTeachModeRequest
  (:response () (instance sr_robot_msgs::SetTeachModeResponse :init)))

(setf (get sr_robot_msgs::SetTeachModeRequest :md5sum-) "f1d4dfab21529bcec06249bcf0db7d58")
(setf (get sr_robot_msgs::SetTeachModeRequest :datatype-) "sr_robot_msgs/SetTeachModeRequest")
(setf (get sr_robot_msgs::SetTeachModeRequest :definition-)
      "bool teach_mode
---
bool success


")

(setf (get sr_robot_msgs::SetTeachModeResponse :md5sum-) "f1d4dfab21529bcec06249bcf0db7d58")
(setf (get sr_robot_msgs::SetTeachModeResponse :datatype-) "sr_robot_msgs/SetTeachModeResponse")
(setf (get sr_robot_msgs::SetTeachModeResponse :definition-)
      "bool teach_mode
---
bool success


")



(provide :sr_robot_msgs/SetTeachMode "f1d4dfab21529bcec06249bcf0db7d58")


