;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::sendupdate)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'sendupdate (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::SENDUPDATE")
  (make-package "SR_ROBOT_MSGS::SENDUPDATE"))

(in-package "ROS")
;;//! \htmlinclude sendupdate.msg.html


(defclass sr_robot_msgs::sendupdate
  :super ros::object
  :slots (_sendupdate_length _sendupdate_list ))

(defmethod sr_robot_msgs::sendupdate
  (:init
   (&key
    ((:sendupdate_length __sendupdate_length) 0)
    ((:sendupdate_list __sendupdate_list) (let (r) (dotimes (i 0) (push (instance sr_robot_msgs::joint :init) r)) r))
    )
   (send-super :init)
   (setq _sendupdate_length (round __sendupdate_length))
   (setq _sendupdate_list __sendupdate_list)
   self)
  (:sendupdate_length
   (&optional __sendupdate_length)
   (if __sendupdate_length (setq _sendupdate_length __sendupdate_length)) _sendupdate_length)
  (:sendupdate_list
   (&rest __sendupdate_list)
   (if (keywordp (car __sendupdate_list))
       (send* _sendupdate_list __sendupdate_list)
     (progn
       (if __sendupdate_list (setq _sendupdate_list (car __sendupdate_list)))
       _sendupdate_list)))
  (:serialization-length
   ()
   (+
    ;; int8 _sendupdate_length
    1
    ;; sr_robot_msgs/joint[] _sendupdate_list
    (apply #'+ (send-all _sendupdate_list :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _sendupdate_length
       (write-byte _sendupdate_length s)
     ;; sr_robot_msgs/joint[] _sendupdate_list
     (write-long (length _sendupdate_list) s)
     (dolist (elem _sendupdate_list)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _sendupdate_length
     (setq _sendupdate_length (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _sendupdate_length 127) (setq _sendupdate_length (- _sendupdate_length 256)))
   ;; sr_robot_msgs/joint[] _sendupdate_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sendupdate_list (let (r) (dotimes (i n) (push (instance sr_robot_msgs::joint :init) r)) r))
     (dolist (elem- _sendupdate_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get sr_robot_msgs::sendupdate :md5sum-) "43a45fe046127fe123dc7e38e3ffdc36")
(setf (get sr_robot_msgs::sendupdate :datatype-) "sr_robot_msgs/sendupdate")
(setf (get sr_robot_msgs::sendupdate :definition-)
      "int8 sendupdate_length
joint[] sendupdate_list


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



(provide :sr_robot_msgs/sendupdate "43a45fe046127fe123dc7e38e3ffdc36")


