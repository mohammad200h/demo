;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::ShadowPST)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'ShadowPST (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::SHADOWPST")
  (make-package "SR_ROBOT_MSGS::SHADOWPST"))

(in-package "ROS")
;;//! \htmlinclude ShadowPST.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sr_robot_msgs::ShadowPST
  :super ros::object
  :slots (_header _pressure _temperature ))

(defmethod sr_robot_msgs::ShadowPST
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:pressure __pressure) (make-array 0 :initial-element 0 :element-type :integer))
    ((:temperature __temperature) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _header __header)
   (setq _pressure __pressure)
   (setq _temperature __temperature)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:pressure
   (&optional __pressure)
   (if __pressure (setq _pressure __pressure)) _pressure)
  (:temperature
   (&optional __temperature)
   (if __temperature (setq _temperature __temperature)) _temperature)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int16[] _pressure
    (* 2    (length _pressure)) 4
    ;; int16[] _temperature
    (* 2    (length _temperature)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int16[] _pressure
     (write-long (length _pressure) s)
     (dotimes (i (length _pressure))
       (write-word (elt _pressure i) s)
       )
     ;; int16[] _temperature
     (write-long (length _temperature) s)
     (dotimes (i (length _temperature))
       (write-word (elt _temperature i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int16[] _pressure
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pressure (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _pressure i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; int16[] _temperature
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _temperature (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _temperature i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(setf (get sr_robot_msgs::ShadowPST :md5sum-) "ab86b3368a7316c12291b90583e1910e")
(setf (get sr_robot_msgs::ShadowPST :datatype-) "sr_robot_msgs/ShadowPST")
(setf (get sr_robot_msgs::ShadowPST :definition-)
      "Header header
int16[] pressure
int16[] temperature

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



(provide :sr_robot_msgs/ShadowPST "ab86b3368a7316c12291b90583e1910e")


