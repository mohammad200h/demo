;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::PlanNamedTrajectory)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'PlanNamedTrajectory (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::PLANNAMEDTRAJECTORY")
  (make-package "SR_ROBOT_MSGS::PLANNAMEDTRAJECTORY"))
(unless (find-package "SR_ROBOT_MSGS::PLANNAMEDTRAJECTORYREQUEST")
  (make-package "SR_ROBOT_MSGS::PLANNAMEDTRAJECTORYREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::PLANNAMEDTRAJECTORYRESPONSE")
  (make-package "SR_ROBOT_MSGS::PLANNAMEDTRAJECTORYRESPONSE"))

(in-package "ROS")





(defclass sr_robot_msgs::PlanNamedTrajectoryRequest
  :super ros::object
  :slots (_name ))

(defmethod sr_robot_msgs::PlanNamedTrajectoryRequest
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass sr_robot_msgs::PlanNamedTrajectoryResponse
  :super ros::object
  :slots (_success ))

(defmethod sr_robot_msgs::PlanNamedTrajectoryResponse
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

(defclass sr_robot_msgs::PlanNamedTrajectory
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::PlanNamedTrajectory :md5sum-) "d08a3b641c2f8680fbdfb1ea2e17a3e1")
(setf (get sr_robot_msgs::PlanNamedTrajectory :datatype-) "sr_robot_msgs/PlanNamedTrajectory")
(setf (get sr_robot_msgs::PlanNamedTrajectory :request) sr_robot_msgs::PlanNamedTrajectoryRequest)
(setf (get sr_robot_msgs::PlanNamedTrajectory :response) sr_robot_msgs::PlanNamedTrajectoryResponse)

(defmethod sr_robot_msgs::PlanNamedTrajectoryRequest
  (:response () (instance sr_robot_msgs::PlanNamedTrajectoryResponse :init)))

(setf (get sr_robot_msgs::PlanNamedTrajectoryRequest :md5sum-) "d08a3b641c2f8680fbdfb1ea2e17a3e1")
(setf (get sr_robot_msgs::PlanNamedTrajectoryRequest :datatype-) "sr_robot_msgs/PlanNamedTrajectoryRequest")
(setf (get sr_robot_msgs::PlanNamedTrajectoryRequest :definition-)
      "string name

---

bool success

")

(setf (get sr_robot_msgs::PlanNamedTrajectoryResponse :md5sum-) "d08a3b641c2f8680fbdfb1ea2e17a3e1")
(setf (get sr_robot_msgs::PlanNamedTrajectoryResponse :datatype-) "sr_robot_msgs/PlanNamedTrajectoryResponse")
(setf (get sr_robot_msgs::PlanNamedTrajectoryResponse :definition-)
      "string name

---

bool success

")



(provide :sr_robot_msgs/PlanNamedTrajectory "d08a3b641c2f8680fbdfb1ea2e17a3e1")


