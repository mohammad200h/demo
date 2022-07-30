;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::UBI0)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'UBI0 (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::UBI0")
  (make-package "SR_ROBOT_MSGS::UBI0"))

(in-package "ROS")
;;//! \htmlinclude UBI0.msg.html


(defclass sr_robot_msgs::UBI0
  :super ros::object
  :slots (_distal ))

(defmethod sr_robot_msgs::UBI0
  (:init
   (&key
    ((:distal __distal) (make-array 12 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _distal __distal)
   self)
  (:distal
   (&optional __distal)
   (if __distal (setq _distal __distal)) _distal)
  (:serialization-length
   ()
   (+
    ;; uint16[12] _distal
    (* 2    12)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16[12] _distal
     (dotimes (i 12)
       (write-word (elt _distal i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16[12] _distal
   (dotimes (i (length _distal))
     (setf (elt _distal i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;;
   self)
  )

(setf (get sr_robot_msgs::UBI0 :md5sum-) "f8ba754182dd029f486767184963c485")
(setf (get sr_robot_msgs::UBI0 :datatype-) "sr_robot_msgs/UBI0")
(setf (get sr_robot_msgs::UBI0 :definition-)
      "uint16[12] distal

")



(provide :sr_robot_msgs/UBI0 "f8ba754182dd029f486767184963c485")


