;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::AuxSpiData)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'AuxSpiData (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::AUXSPIDATA")
  (make-package "SR_ROBOT_MSGS::AUXSPIDATA"))

(in-package "ROS")
;;//! \htmlinclude AuxSpiData.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sr_robot_msgs::AuxSpiData
  :super ros::object
  :slots (_header _sensors ))

(defmethod sr_robot_msgs::AuxSpiData
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:sensors __sensors) (make-array 16 :initial-element 0 :element-type :integer))
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
   (&optional __sensors)
   (if __sensors (setq _sensors __sensors)) _sensors)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint16[16] _sensors
    (* 2    16)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint16[16] _sensors
     (dotimes (i 16)
       (write-word (elt _sensors i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint16[16] _sensors
   (dotimes (i (length _sensors))
     (setf (elt _sensors i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;;
   self)
  )

(setf (get sr_robot_msgs::AuxSpiData :md5sum-) "0be98a0e10e956b06a48167fcb32ca84")
(setf (get sr_robot_msgs::AuxSpiData :datatype-) "sr_robot_msgs/AuxSpiData")
(setf (get sr_robot_msgs::AuxSpiData :definition-)
      "Header header
uint16[16] sensors

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

")



(provide :sr_robot_msgs/AuxSpiData "0be98a0e10e956b06a48167fcb32ca84")


