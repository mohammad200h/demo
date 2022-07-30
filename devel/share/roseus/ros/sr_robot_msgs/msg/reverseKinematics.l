;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::reverseKinematics)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'reverseKinematics (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::REVERSEKINEMATICS")
  (make-package "SR_ROBOT_MSGS::REVERSEKINEMATICS"))

(in-package "ROS")
;;//! \htmlinclude reverseKinematics.msg.html


(defclass sr_robot_msgs::reverseKinematics
  :super ros::object
  :slots (_finger_name ))

(defmethod sr_robot_msgs::reverseKinematics
  (:init
   (&key
    ((:finger_name __finger_name) "")
    )
   (send-super :init)
   (setq _finger_name (string __finger_name))
   self)
  (:finger_name
   (&optional __finger_name)
   (if __finger_name (setq _finger_name __finger_name)) _finger_name)
  (:serialization-length
   ()
   (+
    ;; string _finger_name
    4 (length _finger_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _finger_name
       (write-long (length _finger_name) s) (princ _finger_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _finger_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _finger_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get sr_robot_msgs::reverseKinematics :md5sum-) "db455ae8ce3e770363971b1e8e35fac4")
(setf (get sr_robot_msgs::reverseKinematics :datatype-) "sr_robot_msgs/reverseKinematics")
(setf (get sr_robot_msgs::reverseKinematics :definition-)
      "string  finger_name


")



(provide :sr_robot_msgs/reverseKinematics "db455ae8ce3e770363971b1e8e35fac4")


