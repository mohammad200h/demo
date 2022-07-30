;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::is_hand_occupied)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'is_hand_occupied (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::IS_HAND_OCCUPIED")
  (make-package "SR_ROBOT_MSGS::IS_HAND_OCCUPIED"))
(unless (find-package "SR_ROBOT_MSGS::IS_HAND_OCCUPIEDREQUEST")
  (make-package "SR_ROBOT_MSGS::IS_HAND_OCCUPIEDREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::IS_HAND_OCCUPIEDRESPONSE")
  (make-package "SR_ROBOT_MSGS::IS_HAND_OCCUPIEDRESPONSE"))

(in-package "ROS")





(defclass sr_robot_msgs::is_hand_occupiedRequest
  :super ros::object
  :slots ())

(defmethod sr_robot_msgs::is_hand_occupiedRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass sr_robot_msgs::is_hand_occupiedResponse
  :super ros::object
  :slots (_hand_occupied ))

(defmethod sr_robot_msgs::is_hand_occupiedResponse
  (:init
   (&key
    ((:hand_occupied __hand_occupied) nil)
    )
   (send-super :init)
   (setq _hand_occupied __hand_occupied)
   self)
  (:hand_occupied
   (&optional __hand_occupied)
   (if __hand_occupied (setq _hand_occupied __hand_occupied)) _hand_occupied)
  (:serialization-length
   ()
   (+
    ;; bool _hand_occupied
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _hand_occupied
       (if _hand_occupied (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _hand_occupied
     (setq _hand_occupied (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass sr_robot_msgs::is_hand_occupied
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::is_hand_occupied :md5sum-) "62624a9d19535f7a135d1ce1fc0d0450")
(setf (get sr_robot_msgs::is_hand_occupied :datatype-) "sr_robot_msgs/is_hand_occupied")
(setf (get sr_robot_msgs::is_hand_occupied :request) sr_robot_msgs::is_hand_occupiedRequest)
(setf (get sr_robot_msgs::is_hand_occupied :response) sr_robot_msgs::is_hand_occupiedResponse)

(defmethod sr_robot_msgs::is_hand_occupiedRequest
  (:response () (instance sr_robot_msgs::is_hand_occupiedResponse :init)))

(setf (get sr_robot_msgs::is_hand_occupiedRequest :md5sum-) "62624a9d19535f7a135d1ce1fc0d0450")
(setf (get sr_robot_msgs::is_hand_occupiedRequest :datatype-) "sr_robot_msgs/is_hand_occupiedRequest")
(setf (get sr_robot_msgs::is_hand_occupiedRequest :definition-)
      "---
bool hand_occupied
")

(setf (get sr_robot_msgs::is_hand_occupiedResponse :md5sum-) "62624a9d19535f7a135d1ce1fc0d0450")
(setf (get sr_robot_msgs::is_hand_occupiedResponse :datatype-) "sr_robot_msgs/is_hand_occupiedResponse")
(setf (get sr_robot_msgs::is_hand_occupiedResponse :definition-)
      "---
bool hand_occupied
")



(provide :sr_robot_msgs/is_hand_occupied "62624a9d19535f7a135d1ce1fc0d0450")


