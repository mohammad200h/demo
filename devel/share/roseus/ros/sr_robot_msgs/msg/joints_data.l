;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::joints_data)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'joints_data (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::JOINTS_DATA")
  (make-package "SR_ROBOT_MSGS::JOINTS_DATA"))

(in-package "ROS")
;;//! \htmlinclude joints_data.msg.html


(defclass sr_robot_msgs::joints_data
  :super ros::object
  :slots (_joints_list_length _joints_list ))

(defmethod sr_robot_msgs::joints_data
  (:init
   (&key
    ((:joints_list_length __joints_list_length) 0)
    ((:joints_list __joints_list) (let (r) (dotimes (i 0) (push (instance sr_robot_msgs::joint :init) r)) r))
    )
   (send-super :init)
   (setq _joints_list_length (round __joints_list_length))
   (setq _joints_list __joints_list)
   self)
  (:joints_list_length
   (&optional __joints_list_length)
   (if __joints_list_length (setq _joints_list_length __joints_list_length)) _joints_list_length)
  (:joints_list
   (&rest __joints_list)
   (if (keywordp (car __joints_list))
       (send* _joints_list __joints_list)
     (progn
       (if __joints_list (setq _joints_list (car __joints_list)))
       _joints_list)))
  (:serialization-length
   ()
   (+
    ;; int8 _joints_list_length
    1
    ;; sr_robot_msgs/joint[] _joints_list
    (apply #'+ (send-all _joints_list :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _joints_list_length
       (write-byte _joints_list_length s)
     ;; sr_robot_msgs/joint[] _joints_list
     (write-long (length _joints_list) s)
     (dolist (elem _joints_list)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _joints_list_length
     (setq _joints_list_length (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _joints_list_length 127) (setq _joints_list_length (- _joints_list_length 256)))
   ;; sr_robot_msgs/joint[] _joints_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joints_list (let (r) (dotimes (i n) (push (instance sr_robot_msgs::joint :init) r)) r))
     (dolist (elem- _joints_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get sr_robot_msgs::joints_data :md5sum-) "a7bd94657f253c468247048a545e88e5")
(setf (get sr_robot_msgs::joints_data :datatype-) "sr_robot_msgs/joints_data")
(setf (get sr_robot_msgs::joints_data :definition-)
      "int8 joints_list_length
joint[] joints_list

================================================================================
MSG: sr_robot_msgs/joint
string  joint_name
float64 joint_position
float64 joint_target
float64 joint_torque
float64 joint_temperature
float64 joint_current
string  error_flag

")



(provide :sr_robot_msgs/joints_data "a7bd94657f253c468247048a545e88e5")


