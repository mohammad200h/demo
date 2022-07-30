;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::BiotacAll)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'BiotacAll (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::BIOTACALL")
  (make-package "SR_ROBOT_MSGS::BIOTACALL"))

(in-package "ROS")
;;//! \htmlinclude BiotacAll.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sr_robot_msgs::BiotacAll
  :super ros::object
  :slots (_header _tactiles ))

(defmethod sr_robot_msgs::BiotacAll
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:tactiles __tactiles) (let (r) (dotimes (i 5) (push (instance sr_robot_msgs::Biotac :init) r)) r))
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
    ;; sr_robot_msgs/Biotac[5] _tactiles
    (apply #'+ (send-all _tactiles :serialization-length))
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; sr_robot_msgs/Biotac[5] _tactiles
     (dolist (elem _tactiles)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; sr_robot_msgs/Biotac[5] _tactiles
   (dotimes (i 5)
     (send (elt _tactiles i) :deserialize buf ptr-) (incf ptr- (send (elt _tactiles i) :serialization-length))
     )
   ;;
   self)
  )

(setf (get sr_robot_msgs::BiotacAll :md5sum-) "e27dd065f854b80a2d092dd322ddfd40")
(setf (get sr_robot_msgs::BiotacAll :datatype-) "sr_robot_msgs/BiotacAll")
(setf (get sr_robot_msgs::BiotacAll :definition-)
      "Header header
Biotac[5] tactiles
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
MSG: sr_robot_msgs/Biotac
int16 pac0
int16 pac1
int16 pdc

int16 tac
int16 tdc

int16[] electrodes

")



(provide :sr_robot_msgs/BiotacAll "e27dd065f854b80a2d092dd322ddfd40")


