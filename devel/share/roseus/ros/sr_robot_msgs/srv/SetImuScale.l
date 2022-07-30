;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::SetImuScale)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'SetImuScale (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::SETIMUSCALE")
  (make-package "SR_ROBOT_MSGS::SETIMUSCALE"))
(unless (find-package "SR_ROBOT_MSGS::SETIMUSCALEREQUEST")
  (make-package "SR_ROBOT_MSGS::SETIMUSCALEREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::SETIMUSCALERESPONSE")
  (make-package "SR_ROBOT_MSGS::SETIMUSCALERESPONSE"))

(in-package "ROS")





(defclass sr_robot_msgs::SetImuScaleRequest
  :super ros::object
  :slots (_scale ))

(defmethod sr_robot_msgs::SetImuScaleRequest
  (:init
   (&key
    ((:scale __scale) 0)
    )
   (send-super :init)
   (setq _scale (round __scale))
   self)
  (:scale
   (&optional __scale)
   (if __scale (setq _scale __scale)) _scale)
  (:serialization-length
   ()
   (+
    ;; int8 _scale
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _scale
       (write-byte _scale s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _scale
     (setq _scale (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _scale 127) (setq _scale (- _scale 256)))
   ;;
   self)
  )

(defclass sr_robot_msgs::SetImuScaleResponse
  :super ros::object
  :slots ())

(defmethod sr_robot_msgs::SetImuScaleResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass sr_robot_msgs::SetImuScale
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::SetImuScale :md5sum-) "f39b7f810a4fc89f40be566bb3e21265")
(setf (get sr_robot_msgs::SetImuScale :datatype-) "sr_robot_msgs/SetImuScale")
(setf (get sr_robot_msgs::SetImuScale :request) sr_robot_msgs::SetImuScaleRequest)
(setf (get sr_robot_msgs::SetImuScale :response) sr_robot_msgs::SetImuScaleResponse)

(defmethod sr_robot_msgs::SetImuScaleRequest
  (:response () (instance sr_robot_msgs::SetImuScaleResponse :init)))

(setf (get sr_robot_msgs::SetImuScaleRequest :md5sum-) "f39b7f810a4fc89f40be566bb3e21265")
(setf (get sr_robot_msgs::SetImuScaleRequest :datatype-) "sr_robot_msgs/SetImuScaleRequest")
(setf (get sr_robot_msgs::SetImuScaleRequest :definition-)
      "int8 scale
---

")

(setf (get sr_robot_msgs::SetImuScaleResponse :md5sum-) "f39b7f810a4fc89f40be566bb3e21265")
(setf (get sr_robot_msgs::SetImuScaleResponse :datatype-) "sr_robot_msgs/SetImuScaleResponse")
(setf (get sr_robot_msgs::SetImuScaleResponse :definition-)
      "int8 scale
---

")



(provide :sr_robot_msgs/SetImuScale "f39b7f810a4fc89f40be566bb3e21265")


