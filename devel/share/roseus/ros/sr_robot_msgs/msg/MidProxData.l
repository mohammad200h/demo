;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::MidProxData)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'MidProxData (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::MIDPROXDATA")
  (make-package "SR_ROBOT_MSGS::MIDPROXDATA"))

(in-package "ROS")
;;//! \htmlinclude MidProxData.msg.html


(defclass sr_robot_msgs::MidProxData
  :super ros::object
  :slots (_middle _proximal ))

(defmethod sr_robot_msgs::MidProxData
  (:init
   (&key
    ((:middle __middle) (make-array 4 :initial-element 0 :element-type :integer))
    ((:proximal __proximal) (make-array 4 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _middle __middle)
   (setq _proximal __proximal)
   self)
  (:middle
   (&optional __middle)
   (if __middle (setq _middle __middle)) _middle)
  (:proximal
   (&optional __proximal)
   (if __proximal (setq _proximal __proximal)) _proximal)
  (:serialization-length
   ()
   (+
    ;; uint16[4] _middle
    (* 2    4)
    ;; uint16[4] _proximal
    (* 2    4)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16[4] _middle
     (dotimes (i 4)
       (write-word (elt _middle i) s)
       )
     ;; uint16[4] _proximal
     (dotimes (i 4)
       (write-word (elt _proximal i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16[4] _middle
   (dotimes (i (length _middle))
     (setf (elt _middle i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;; uint16[4] _proximal
   (dotimes (i (length _proximal))
     (setf (elt _proximal i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;;
   self)
  )

(setf (get sr_robot_msgs::MidProxData :md5sum-) "8ae5331748e57fcbdb20b7e2f086fcbf")
(setf (get sr_robot_msgs::MidProxData :datatype-) "sr_robot_msgs/MidProxData")
(setf (get sr_robot_msgs::MidProxData :definition-)
      "uint16[4] middle
uint16[4] proximal

")



(provide :sr_robot_msgs/MidProxData "8ae5331748e57fcbdb20b7e2f086fcbf")


