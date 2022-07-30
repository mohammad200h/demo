;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::MidProxDataAll)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'MidProxDataAll (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::MIDPROXDATAALL")
  (make-package "SR_ROBOT_MSGS::MIDPROXDATAALL"))

(in-package "ROS")
;;//! \htmlinclude MidProxDataAll.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sr_robot_msgs::MidProxDataAll
  :super ros::object
  :slots (_header _sensors ))

(defmethod sr_robot_msgs::MidProxDataAll
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:sensors __sensors) (let (r) (dotimes (i 5) (push (instance sr_robot_msgs::MidProxData :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _sensors __sensors)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:sensors
   (&rest __sensors)
   (if (keywordp (car __sensors))
       (send* _sensors __sensors)
     (progn
       (if __sensors (setq _sensors (car __sensors)))
       _sensors)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; sr_robot_msgs/MidProxData[5] _sensors
    (apply #'+ (send-all _sensors :serialization-length))
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; sr_robot_msgs/MidProxData[5] _sensors
     (dolist (elem _sensors)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; sr_robot_msgs/MidProxData[5] _sensors
   (dotimes (i 5)
     (send (elt _sensors i) :deserialize buf ptr-) (incf ptr- (send (elt _sensors i) :serialization-length))
     )
   ;;
   self)
  )

(setf (get sr_robot_msgs::MidProxDataAll :md5sum-) "1e9012ec0a19b9d9e5a6680de1b6d873")
(setf (get sr_robot_msgs::MidProxDataAll :datatype-) "sr_robot_msgs/MidProxDataAll")
(setf (get sr_robot_msgs::MidProxDataAll :definition-)
      "Header header
MidProxData[5] sensors

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
MSG: sr_robot_msgs/MidProxData
uint16[4] middle
uint16[4] proximal

")



(provide :sr_robot_msgs/MidProxDataAll "1e9012ec0a19b9d9e5a6680de1b6d873")


