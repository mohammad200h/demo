;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::which_fingers_are_touching)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'which_fingers_are_touching (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::WHICH_FINGERS_ARE_TOUCHING")
  (make-package "SR_ROBOT_MSGS::WHICH_FINGERS_ARE_TOUCHING"))
(unless (find-package "SR_ROBOT_MSGS::WHICH_FINGERS_ARE_TOUCHINGREQUEST")
  (make-package "SR_ROBOT_MSGS::WHICH_FINGERS_ARE_TOUCHINGREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::WHICH_FINGERS_ARE_TOUCHINGRESPONSE")
  (make-package "SR_ROBOT_MSGS::WHICH_FINGERS_ARE_TOUCHINGRESPONSE"))

(in-package "ROS")





(defclass sr_robot_msgs::which_fingers_are_touchingRequest
  :super ros::object
  :slots (_force_thresholds ))

(defmethod sr_robot_msgs::which_fingers_are_touchingRequest
  (:init
   (&key
    ((:force_thresholds __force_thresholds) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _force_thresholds __force_thresholds)
   self)
  (:force_thresholds
   (&optional __force_thresholds)
   (if __force_thresholds (setq _force_thresholds __force_thresholds)) _force_thresholds)
  (:serialization-length
   ()
   (+
    ;; float64[] _force_thresholds
    (* 8    (length _force_thresholds)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _force_thresholds
     (write-long (length _force_thresholds) s)
     (dotimes (i (length _force_thresholds))
       (sys::poke (elt _force_thresholds i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _force_thresholds
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _force_thresholds (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _force_thresholds i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass sr_robot_msgs::which_fingers_are_touchingResponse
  :super ros::object
  :slots (_touch_forces ))

(defmethod sr_robot_msgs::which_fingers_are_touchingResponse
  (:init
   (&key
    ((:touch_forces __touch_forces) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _touch_forces __touch_forces)
   self)
  (:touch_forces
   (&optional __touch_forces)
   (if __touch_forces (setq _touch_forces __touch_forces)) _touch_forces)
  (:serialization-length
   ()
   (+
    ;; float64[] _touch_forces
    (* 8    (length _touch_forces)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _touch_forces
     (write-long (length _touch_forces) s)
     (dotimes (i (length _touch_forces))
       (sys::poke (elt _touch_forces i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _touch_forces
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _touch_forces (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _touch_forces i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass sr_robot_msgs::which_fingers_are_touching
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::which_fingers_are_touching :md5sum-) "5db90fdcbce6b7b34ac0a1f94863f7e2")
(setf (get sr_robot_msgs::which_fingers_are_touching :datatype-) "sr_robot_msgs/which_fingers_are_touching")
(setf (get sr_robot_msgs::which_fingers_are_touching :request) sr_robot_msgs::which_fingers_are_touchingRequest)
(setf (get sr_robot_msgs::which_fingers_are_touching :response) sr_robot_msgs::which_fingers_are_touchingResponse)

(defmethod sr_robot_msgs::which_fingers_are_touchingRequest
  (:response () (instance sr_robot_msgs::which_fingers_are_touchingResponse :init)))

(setf (get sr_robot_msgs::which_fingers_are_touchingRequest :md5sum-) "5db90fdcbce6b7b34ac0a1f94863f7e2")
(setf (get sr_robot_msgs::which_fingers_are_touchingRequest :datatype-) "sr_robot_msgs/which_fingers_are_touchingRequest")
(setf (get sr_robot_msgs::which_fingers_are_touchingRequest :definition-)
      "



float64[] force_thresholds
---
float64[] touch_forces




")

(setf (get sr_robot_msgs::which_fingers_are_touchingResponse :md5sum-) "5db90fdcbce6b7b34ac0a1f94863f7e2")
(setf (get sr_robot_msgs::which_fingers_are_touchingResponse :datatype-) "sr_robot_msgs/which_fingers_are_touchingResponse")
(setf (get sr_robot_msgs::which_fingers_are_touchingResponse :definition-)
      "



float64[] force_thresholds
---
float64[] touch_forces




")



(provide :sr_robot_msgs/which_fingers_are_touching "5db90fdcbce6b7b34ac0a1f94863f7e2")


