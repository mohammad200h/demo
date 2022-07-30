;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::NullifyDemand)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'NullifyDemand (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::NULLIFYDEMAND")
  (make-package "SR_ROBOT_MSGS::NULLIFYDEMAND"))
(unless (find-package "SR_ROBOT_MSGS::NULLIFYDEMANDREQUEST")
  (make-package "SR_ROBOT_MSGS::NULLIFYDEMANDREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::NULLIFYDEMANDRESPONSE")
  (make-package "SR_ROBOT_MSGS::NULLIFYDEMANDRESPONSE"))

(in-package "ROS")





(defclass sr_robot_msgs::NullifyDemandRequest
  :super ros::object
  :slots (_nullify_demand ))

(defmethod sr_robot_msgs::NullifyDemandRequest
  (:init
   (&key
    ((:nullify_demand __nullify_demand) nil)
    )
   (send-super :init)
   (setq _nullify_demand __nullify_demand)
   self)
  (:nullify_demand
   (&optional __nullify_demand)
   (if __nullify_demand (setq _nullify_demand __nullify_demand)) _nullify_demand)
  (:serialization-length
   ()
   (+
    ;; bool _nullify_demand
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _nullify_demand
       (if _nullify_demand (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _nullify_demand
     (setq _nullify_demand (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass sr_robot_msgs::NullifyDemandResponse
  :super ros::object
  :slots ())

(defmethod sr_robot_msgs::NullifyDemandResponse
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

(defclass sr_robot_msgs::NullifyDemand
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::NullifyDemand :md5sum-) "e776288d81b4da212263a7a8b3f035b3")
(setf (get sr_robot_msgs::NullifyDemand :datatype-) "sr_robot_msgs/NullifyDemand")
(setf (get sr_robot_msgs::NullifyDemand :request) sr_robot_msgs::NullifyDemandRequest)
(setf (get sr_robot_msgs::NullifyDemand :response) sr_robot_msgs::NullifyDemandResponse)

(defmethod sr_robot_msgs::NullifyDemandRequest
  (:response () (instance sr_robot_msgs::NullifyDemandResponse :init)))

(setf (get sr_robot_msgs::NullifyDemandRequest :md5sum-) "e776288d81b4da212263a7a8b3f035b3")
(setf (get sr_robot_msgs::NullifyDemandRequest :datatype-) "sr_robot_msgs/NullifyDemandRequest")
(setf (get sr_robot_msgs::NullifyDemandRequest :definition-)
      "




bool nullify_demand
---

")

(setf (get sr_robot_msgs::NullifyDemandResponse :md5sum-) "e776288d81b4da212263a7a8b3f035b3")
(setf (get sr_robot_msgs::NullifyDemandResponse :datatype-) "sr_robot_msgs/NullifyDemandResponse")
(setf (get sr_robot_msgs::NullifyDemandResponse :definition-)
      "




bool nullify_demand
---

")



(provide :sr_robot_msgs/NullifyDemand "e776288d81b4da212263a7a8b3f035b3")


