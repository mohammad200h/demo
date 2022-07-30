;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::ExecutePlannedTrajectory)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'ExecutePlannedTrajectory (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::EXECUTEPLANNEDTRAJECTORY")
  (make-package "SR_ROBOT_MSGS::EXECUTEPLANNEDTRAJECTORY"))
(unless (find-package "SR_ROBOT_MSGS::EXECUTEPLANNEDTRAJECTORYREQUEST")
  (make-package "SR_ROBOT_MSGS::EXECUTEPLANNEDTRAJECTORYREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::EXECUTEPLANNEDTRAJECTORYRESPONSE")
  (make-package "SR_ROBOT_MSGS::EXECUTEPLANNEDTRAJECTORYRESPONSE"))

(in-package "ROS")





(defclass sr_robot_msgs::ExecutePlannedTrajectoryRequest
  :super ros::object
  :slots ())

(defmethod sr_robot_msgs::ExecutePlannedTrajectoryRequest
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

(defclass sr_robot_msgs::ExecutePlannedTrajectoryResponse
  :super ros::object
  :slots (_success ))

(defmethod sr_robot_msgs::ExecutePlannedTrajectoryResponse
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

(defclass sr_robot_msgs::ExecutePlannedTrajectory
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::ExecutePlannedTrajectory :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get sr_robot_msgs::ExecutePlannedTrajectory :datatype-) "sr_robot_msgs/ExecutePlannedTrajectory")
(setf (get sr_robot_msgs::ExecutePlannedTrajectory :request) sr_robot_msgs::ExecutePlannedTrajectoryRequest)
(setf (get sr_robot_msgs::ExecutePlannedTrajectory :response) sr_robot_msgs::ExecutePlannedTrajectoryResponse)

(defmethod sr_robot_msgs::ExecutePlannedTrajectoryRequest
  (:response () (instance sr_robot_msgs::ExecutePlannedTrajectoryResponse :init)))

(setf (get sr_robot_msgs::ExecutePlannedTrajectoryRequest :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get sr_robot_msgs::ExecutePlannedTrajectoryRequest :datatype-) "sr_robot_msgs/ExecutePlannedTrajectoryRequest")
(setf (get sr_robot_msgs::ExecutePlannedTrajectoryRequest :definition-)
      "---

bool success

")

(setf (get sr_robot_msgs::ExecutePlannedTrajectoryResponse :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get sr_robot_msgs::ExecutePlannedTrajectoryResponse :datatype-) "sr_robot_msgs/ExecutePlannedTrajectoryResponse")
(setf (get sr_robot_msgs::ExecutePlannedTrajectoryResponse :definition-)
      "---

bool success

")



(provide :sr_robot_msgs/ExecutePlannedTrajectory "358e233cde0c8a8bcfea4ce193f8fc15")


