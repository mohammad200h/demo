;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::UBI0All)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'UBI0All (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::UBI0ALL")
  (make-package "SR_ROBOT_MSGS::UBI0ALL"))

(in-package "ROS")
;;//! \htmlinclude UBI0All.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sr_robot_msgs::UBI0All
  :super ros::object
  :slots (_header _tactiles ))

(defmethod sr_robot_msgs::UBI0All
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:tactiles __tactiles) (let (r) (dotimes (i 5) (push (instance sr_robot_msgs::UBI0 :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _tactiles __tactiles)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:tactiles
   (&rest __tactiles)
   (if (keywordp (car __tactiles))
       (send* _tactiles __tactiles)
     (progn
       (if __tactiles (setq _tactiles (car __tactiles)))
       _tactiles)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; sr_robot_msgs/UBI0[5] _tactiles
    (apply #'+ (send-all _tactiles :serialization-length))
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; sr_robot_msgs/UBI0[5] _tactiles
     (dolist (elem _tactiles)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; sr_robot_msgs/UBI0[5] _tactiles
   (dotimes (i 5)
     (send (elt _tactiles i) :deserialize buf ptr-) (incf ptr- (send (elt _tactiles i) :serialization-length))
     )
   ;;
   self)
  )

(setf (get sr_robot_msgs::UBI0All :md5sum-) "22c64fd8e1fb1637211317013726a341")
(setf (get sr_robot_msgs::UBI0All :datatype-) "sr_robot_msgs/UBI0All")
(setf (get sr_robot_msgs::UBI0All :definition-)
      "Header header
UBI0[5] tactiles

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: sr_robot_msgs/UBI0
uint16[12] distal

")



(provide :sr_robot_msgs/UBI0All "22c64fd8e1fb1637211317013726a341")


