;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::SetEffortControllerGains)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'SetEffortControllerGains (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::SETEFFORTCONTROLLERGAINS")
  (make-package "SR_ROBOT_MSGS::SETEFFORTCONTROLLERGAINS"))
(unless (find-package "SR_ROBOT_MSGS::SETEFFORTCONTROLLERGAINSREQUEST")
  (make-package "SR_ROBOT_MSGS::SETEFFORTCONTROLLERGAINSREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::SETEFFORTCONTROLLERGAINSRESPONSE")
  (make-package "SR_ROBOT_MSGS::SETEFFORTCONTROLLERGAINSRESPONSE"))

(in-package "ROS")





(defclass sr_robot_msgs::SetEffortControllerGainsRequest
  :super ros::object
  :slots (_max_force _friction_deadband ))

(defmethod sr_robot_msgs::SetEffortControllerGainsRequest
  (:init
   (&key
    ((:max_force __max_force) 0.0)
    ((:friction_deadband __friction_deadband) 0)
    )
   (send-super :init)
   (setq _max_force (float __max_force))
   (setq _friction_deadband (round __friction_deadband))
   self)
  (:max_force
   (&optional __max_force)
   (if __max_force (setq _max_force __max_force)) _max_force)
  (:friction_deadband
   (&optional __friction_deadband)
   (if __friction_deadband (setq _friction_deadband __friction_deadband)) _friction_deadband)
  (:serialization-length
   ()
   (+
    ;; float64 _max_force
    8
    ;; int32 _friction_deadband
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _max_force
       (sys::poke _max_force (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32 _friction_deadband
       (write-long _friction_deadband s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _max_force
     (setq _max_force (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32 _friction_deadband
     (setq _friction_deadband (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass sr_robot_msgs::SetEffortControllerGainsResponse
  :super ros::object
  :slots ())

(defmethod sr_robot_msgs::SetEffortControllerGainsResponse
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

(defclass sr_robot_msgs::SetEffortControllerGains
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::SetEffortControllerGains :md5sum-) "96397d148b84b1d0a8fe84ee1744fece")
(setf (get sr_robot_msgs::SetEffortControllerGains :datatype-) "sr_robot_msgs/SetEffortControllerGains")
(setf (get sr_robot_msgs::SetEffortControllerGains :request) sr_robot_msgs::SetEffortControllerGainsRequest)
(setf (get sr_robot_msgs::SetEffortControllerGains :response) sr_robot_msgs::SetEffortControllerGainsResponse)

(defmethod sr_robot_msgs::SetEffortControllerGainsRequest
  (:response () (instance sr_robot_msgs::SetEffortControllerGainsResponse :init)))

(setf (get sr_robot_msgs::SetEffortControllerGainsRequest :md5sum-) "96397d148b84b1d0a8fe84ee1744fece")
(setf (get sr_robot_msgs::SetEffortControllerGainsRequest :datatype-) "sr_robot_msgs/SetEffortControllerGainsRequest")
(setf (get sr_robot_msgs::SetEffortControllerGainsRequest :definition-)
      "float64 max_force
int32 friction_deadband
---

")

(setf (get sr_robot_msgs::SetEffortControllerGainsResponse :md5sum-) "96397d148b84b1d0a8fe84ee1744fece")
(setf (get sr_robot_msgs::SetEffortControllerGainsResponse :datatype-) "sr_robot_msgs/SetEffortControllerGainsResponse")
(setf (get sr_robot_msgs::SetEffortControllerGainsResponse :definition-)
      "float64 max_force
int32 friction_deadband
---

")



(provide :sr_robot_msgs/SetEffortControllerGains "96397d148b84b1d0a8fe84ee1744fece")


