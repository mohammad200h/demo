;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::ManualSelfTest)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'ManualSelfTest (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::MANUALSELFTEST")
  (make-package "SR_ROBOT_MSGS::MANUALSELFTEST"))
(unless (find-package "SR_ROBOT_MSGS::MANUALSELFTESTREQUEST")
  (make-package "SR_ROBOT_MSGS::MANUALSELFTESTREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::MANUALSELFTESTRESPONSE")
  (make-package "SR_ROBOT_MSGS::MANUALSELFTESTRESPONSE"))

(in-package "ROS")





(defclass sr_robot_msgs::ManualSelfTestRequest
  :super ros::object
  :slots (_message ))

(defmethod sr_robot_msgs::ManualSelfTestRequest
  (:init
   (&key
    ((:message __message) "")
    )
   (send-super :init)
   (setq _message (string __message))
   self)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass sr_robot_msgs::ManualSelfTestResponse
  :super ros::object
  :slots (_ok _message ))

(defmethod sr_robot_msgs::ManualSelfTestResponse
  (:init
   (&key
    ((:ok __ok) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _ok __ok)
   (setq _message (string __message))
   self)
  (:ok
   (&optional __ok)
   (if __ok (setq _ok __ok)) _ok)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _ok
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _ok
       (if _ok (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _ok
     (setq _ok (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass sr_robot_msgs::ManualSelfTest
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::ManualSelfTest :md5sum-) "d83c7b589c767d269944dfef6ec6a6dc")
(setf (get sr_robot_msgs::ManualSelfTest :datatype-) "sr_robot_msgs/ManualSelfTest")
(setf (get sr_robot_msgs::ManualSelfTest :request) sr_robot_msgs::ManualSelfTestRequest)
(setf (get sr_robot_msgs::ManualSelfTest :response) sr_robot_msgs::ManualSelfTestResponse)

(defmethod sr_robot_msgs::ManualSelfTestRequest
  (:response () (instance sr_robot_msgs::ManualSelfTestResponse :init)))

(setf (get sr_robot_msgs::ManualSelfTestRequest :md5sum-) "d83c7b589c767d269944dfef6ec6a6dc")
(setf (get sr_robot_msgs::ManualSelfTestRequest :datatype-) "sr_robot_msgs/ManualSelfTestRequest")
(setf (get sr_robot_msgs::ManualSelfTestRequest :definition-)
      "string message
---
bool ok
string message
")

(setf (get sr_robot_msgs::ManualSelfTestResponse :md5sum-) "d83c7b589c767d269944dfef6ec6a6dc")
(setf (get sr_robot_msgs::ManualSelfTestResponse :datatype-) "sr_robot_msgs/ManualSelfTestResponse")
(setf (get sr_robot_msgs::ManualSelfTestResponse :definition-)
      "string message
---
bool ok
string message
")



(provide :sr_robot_msgs/ManualSelfTest "d83c7b589c767d269944dfef6ec6a6dc")


