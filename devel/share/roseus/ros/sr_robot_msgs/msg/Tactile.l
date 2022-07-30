;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::Tactile)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'Tactile (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::TACTILE")
  (make-package "SR_ROBOT_MSGS::TACTILE"))

(in-package "ROS")
;;//! \htmlinclude Tactile.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sr_robot_msgs::Tactile
  :super ros::object
  :slots (_data ))

(defmethod sr_robot_msgs::Tactile
  (:init
   (&key
    ((:data __data) (let (r) (dotimes (i 0) (push (instance std_msgs::Int16 :init) r)) r))
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Int16[] _data
    (apply #'+ (send-all _data :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Int16[] _data
     (write-long (length _data) s)
     (dolist (elem _data)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Int16[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (let (r) (dotimes (i n) (push (instance std_msgs::Int16 :init) r)) r))
     (dolist (elem- _data)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get sr_robot_msgs::Tactile :md5sum-) "0f9585f47779b9607f760bef85a254c0")
(setf (get sr_robot_msgs::Tactile :datatype-) "sr_robot_msgs/Tactile")
(setf (get sr_robot_msgs::Tactile :definition-)
      "std_msgs/Int16[] data

================================================================================
MSG: std_msgs/Int16
int16 data

")



(provide :sr_robot_msgs/Tactile "0f9585f47779b9607f760bef85a254c0")


