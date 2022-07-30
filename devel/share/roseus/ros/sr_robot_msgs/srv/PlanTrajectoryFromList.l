;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::PlanTrajectoryFromList)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'PlanTrajectoryFromList (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::PLANTRAJECTORYFROMLIST")
  (make-package "SR_ROBOT_MSGS::PLANTRAJECTORYFROMLIST"))
(unless (find-package "SR_ROBOT_MSGS::PLANTRAJECTORYFROMLISTREQUEST")
  (make-package "SR_ROBOT_MSGS::PLANTRAJECTORYFROMLISTREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::PLANTRAJECTORYFROMLISTRESPONSE")
  (make-package "SR_ROBOT_MSGS::PLANTRAJECTORYFROMLISTRESPONSE"))

(in-package "ROS")





(defclass sr_robot_msgs::PlanTrajectoryFromListRequest
  :super ros::object
  :slots (_waypoint_names ))

(defmethod sr_robot_msgs::PlanTrajectoryFromListRequest
  (:init
   (&key
    ((:waypoint_names __waypoint_names) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _waypoint_names __waypoint_names)
   self)
  (:waypoint_names
   (&optional __waypoint_names)
   (if __waypoint_names (setq _waypoint_names __waypoint_names)) _waypoint_names)
  (:serialization-length
   ()
   (+
    ;; string[] _waypoint_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _waypoint_names)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _waypoint_names
     (write-long (length _waypoint_names) s)
     (dolist (elem _waypoint_names)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _waypoint_names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _waypoint_names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _waypoint_names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass sr_robot_msgs::PlanTrajectoryFromListResponse
  :super ros::object
  :slots (_success ))

(defmethod sr_robot_msgs::PlanTrajectoryFromListResponse
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

(defclass sr_robot_msgs::PlanTrajectoryFromList
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::PlanTrajectoryFromList :md5sum-) "605c45ffa41b85052c4f100368ed2b2d")
(setf (get sr_robot_msgs::PlanTrajectoryFromList :datatype-) "sr_robot_msgs/PlanTrajectoryFromList")
(setf (get sr_robot_msgs::PlanTrajectoryFromList :request) sr_robot_msgs::PlanTrajectoryFromListRequest)
(setf (get sr_robot_msgs::PlanTrajectoryFromList :response) sr_robot_msgs::PlanTrajectoryFromListResponse)

(defmethod sr_robot_msgs::PlanTrajectoryFromListRequest
  (:response () (instance sr_robot_msgs::PlanTrajectoryFromListResponse :init)))

(setf (get sr_robot_msgs::PlanTrajectoryFromListRequest :md5sum-) "605c45ffa41b85052c4f100368ed2b2d")
(setf (get sr_robot_msgs::PlanTrajectoryFromListRequest :datatype-) "sr_robot_msgs/PlanTrajectoryFromListRequest")
(setf (get sr_robot_msgs::PlanTrajectoryFromListRequest :definition-)
      "string[] waypoint_names

---

bool success

")

(setf (get sr_robot_msgs::PlanTrajectoryFromListResponse :md5sum-) "605c45ffa41b85052c4f100368ed2b2d")
(setf (get sr_robot_msgs::PlanTrajectoryFromListResponse :datatype-) "sr_robot_msgs/PlanTrajectoryFromListResponse")
(setf (get sr_robot_msgs::PlanTrajectoryFromListResponse :definition-)
      "string[] waypoint_names

---

bool success

")



(provide :sr_robot_msgs/PlanTrajectoryFromList "605c45ffa41b85052c4f100368ed2b2d")


