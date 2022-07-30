;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::ListNamedTrajectories)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'ListNamedTrajectories (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::LISTNAMEDTRAJECTORIES")
  (make-package "SR_ROBOT_MSGS::LISTNAMEDTRAJECTORIES"))
(unless (find-package "SR_ROBOT_MSGS::LISTNAMEDTRAJECTORIESREQUEST")
  (make-package "SR_ROBOT_MSGS::LISTNAMEDTRAJECTORIESREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::LISTNAMEDTRAJECTORIESRESPONSE")
  (make-package "SR_ROBOT_MSGS::LISTNAMEDTRAJECTORIESRESPONSE"))

(in-package "ROS")





(defclass sr_robot_msgs::ListNamedTrajectoriesRequest
  :super ros::object
  :slots ())

(defmethod sr_robot_msgs::ListNamedTrajectoriesRequest
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

(defclass sr_robot_msgs::ListNamedTrajectoriesResponse
  :super ros::object
  :slots (_names ))

(defmethod sr_robot_msgs::ListNamedTrajectoriesResponse
  (:init
   (&key
    ((:names __names) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _names __names)
   self)
  (:names
   (&optional __names)
   (if __names (setq _names __names)) _names)
  (:serialization-length
   ()
   (+
    ;; string[] _names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _names)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _names
     (write-long (length _names) s)
     (dolist (elem _names)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass sr_robot_msgs::ListNamedTrajectories
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::ListNamedTrajectories :md5sum-) "dc7ae3609524b18034e49294a4ce670e")
(setf (get sr_robot_msgs::ListNamedTrajectories :datatype-) "sr_robot_msgs/ListNamedTrajectories")
(setf (get sr_robot_msgs::ListNamedTrajectories :request) sr_robot_msgs::ListNamedTrajectoriesRequest)
(setf (get sr_robot_msgs::ListNamedTrajectories :response) sr_robot_msgs::ListNamedTrajectoriesResponse)

(defmethod sr_robot_msgs::ListNamedTrajectoriesRequest
  (:response () (instance sr_robot_msgs::ListNamedTrajectoriesResponse :init)))

(setf (get sr_robot_msgs::ListNamedTrajectoriesRequest :md5sum-) "dc7ae3609524b18034e49294a4ce670e")
(setf (get sr_robot_msgs::ListNamedTrajectoriesRequest :datatype-) "sr_robot_msgs/ListNamedTrajectoriesRequest")
(setf (get sr_robot_msgs::ListNamedTrajectoriesRequest :definition-)
      "---

string[] names

")

(setf (get sr_robot_msgs::ListNamedTrajectoriesResponse :md5sum-) "dc7ae3609524b18034e49294a4ce670e")
(setf (get sr_robot_msgs::ListNamedTrajectoriesResponse :datatype-) "sr_robot_msgs/ListNamedTrajectoriesResponse")
(setf (get sr_robot_msgs::ListNamedTrajectoriesResponse :definition-)
      "---

string[] names

")



(provide :sr_robot_msgs/ListNamedTrajectories "dc7ae3609524b18034e49294a4ce670e")


