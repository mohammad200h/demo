;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::PlanTrajectoryFromPrefix)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'PlanTrajectoryFromPrefix (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::PLANTRAJECTORYFROMPREFIX")
  (make-package "SR_ROBOT_MSGS::PLANTRAJECTORYFROMPREFIX"))
(unless (find-package "SR_ROBOT_MSGS::PLANTRAJECTORYFROMPREFIXREQUEST")
  (make-package "SR_ROBOT_MSGS::PLANTRAJECTORYFROMPREFIXREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::PLANTRAJECTORYFROMPREFIXRESPONSE")
  (make-package "SR_ROBOT_MSGS::PLANTRAJECTORYFROMPREFIXRESPONSE"))

(in-package "ROS")





(defclass sr_robot_msgs::PlanTrajectoryFromPrefixRequest
  :super ros::object
  :slots (_prefix ))

(defmethod sr_robot_msgs::PlanTrajectoryFromPrefixRequest
  (:init
   (&key
    ((:prefix __prefix) "")
    )
   (send-super :init)
   (setq _prefix (string __prefix))
   self)
  (:prefix
   (&optional __prefix)
   (if __prefix (setq _prefix __prefix)) _prefix)
  (:serialization-length
   ()
   (+
    ;; string _prefix
    4 (length _prefix)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _prefix
       (write-long (length _prefix) s) (princ _prefix s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _prefix
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _prefix (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass sr_robot_msgs::PlanTrajectoryFromPrefixResponse
  :super ros::object
  :slots (_success ))

(defmethod sr_robot_msgs::PlanTrajectoryFromPrefixResponse
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

(defclass sr_robot_msgs::PlanTrajectoryFromPrefix
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::PlanTrajectoryFromPrefix :md5sum-) "2311a2368ccb73aeef583bd78e497f75")
(setf (get sr_robot_msgs::PlanTrajectoryFromPrefix :datatype-) "sr_robot_msgs/PlanTrajectoryFromPrefix")
(setf (get sr_robot_msgs::PlanTrajectoryFromPrefix :request) sr_robot_msgs::PlanTrajectoryFromPrefixRequest)
(setf (get sr_robot_msgs::PlanTrajectoryFromPrefix :response) sr_robot_msgs::PlanTrajectoryFromPrefixResponse)

(defmethod sr_robot_msgs::PlanTrajectoryFromPrefixRequest
  (:response () (instance sr_robot_msgs::PlanTrajectoryFromPrefixResponse :init)))

(setf (get sr_robot_msgs::PlanTrajectoryFromPrefixRequest :md5sum-) "2311a2368ccb73aeef583bd78e497f75")
(setf (get sr_robot_msgs::PlanTrajectoryFromPrefixRequest :datatype-) "sr_robot_msgs/PlanTrajectoryFromPrefixRequest")
(setf (get sr_robot_msgs::PlanTrajectoryFromPrefixRequest :definition-)
      "string prefix

---

bool success

")

(setf (get sr_robot_msgs::PlanTrajectoryFromPrefixResponse :md5sum-) "2311a2368ccb73aeef583bd78e497f75")
(setf (get sr_robot_msgs::PlanTrajectoryFromPrefixResponse :datatype-) "sr_robot_msgs/PlanTrajectoryFromPrefixResponse")
(setf (get sr_robot_msgs::PlanTrajectoryFromPrefixResponse :definition-)
      "string prefix

---

bool success

")



(provide :sr_robot_msgs/PlanTrajectoryFromPrefix "2311a2368ccb73aeef583bd78e497f75")


