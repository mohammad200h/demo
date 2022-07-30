;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::RobotTeachMode)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'RobotTeachMode (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::ROBOTTEACHMODE")
  (make-package "SR_ROBOT_MSGS::ROBOTTEACHMODE"))
(unless (find-package "SR_ROBOT_MSGS::ROBOTTEACHMODEREQUEST")
  (make-package "SR_ROBOT_MSGS::ROBOTTEACHMODEREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::ROBOTTEACHMODERESPONSE")
  (make-package "SR_ROBOT_MSGS::ROBOTTEACHMODERESPONSE"))

(in-package "ROS")





(intern "*TRAJECTORY_MODE*" (find-package "SR_ROBOT_MSGS::ROBOTTEACHMODEREQUEST"))
(shadow '*TRAJECTORY_MODE* (find-package "SR_ROBOT_MSGS::ROBOTTEACHMODEREQUEST"))
(defconstant sr_robot_msgs::RobotTeachModeRequest::*TRAJECTORY_MODE* 0)
(intern "*TEACH_MODE*" (find-package "SR_ROBOT_MSGS::ROBOTTEACHMODEREQUEST"))
(shadow '*TEACH_MODE* (find-package "SR_ROBOT_MSGS::ROBOTTEACHMODEREQUEST"))
(defconstant sr_robot_msgs::RobotTeachModeRequest::*TEACH_MODE* 1)
(intern "*POSITION_MODE*" (find-package "SR_ROBOT_MSGS::ROBOTTEACHMODEREQUEST"))
(shadow '*POSITION_MODE* (find-package "SR_ROBOT_MSGS::ROBOTTEACHMODEREQUEST"))
(defconstant sr_robot_msgs::RobotTeachModeRequest::*POSITION_MODE* 2)
(defclass sr_robot_msgs::RobotTeachModeRequest
  :super ros::object
  :slots (_teach_mode _robot ))

(defmethod sr_robot_msgs::RobotTeachModeRequest
  (:init
   (&key
    ((:teach_mode __teach_mode) 0)
    ((:robot __robot) "")
    )
   (send-super :init)
   (setq _teach_mode (round __teach_mode))
   (setq _robot (string __robot))
   self)
  (:teach_mode
   (&optional __teach_mode)
   (if __teach_mode (setq _teach_mode __teach_mode)) _teach_mode)
  (:robot
   (&optional __robot)
   (if __robot (setq _robot __robot)) _robot)
  (:serialization-length
   ()
   (+
    ;; uint32 _teach_mode
    4
    ;; string _robot
    4 (length _robot)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _teach_mode
       (write-long _teach_mode s)
     ;; string _robot
       (write-long (length _robot) s) (princ _robot s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _teach_mode
     (setq _teach_mode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _robot
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robot (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(intern "*ERROR*" (find-package "SR_ROBOT_MSGS::ROBOTTEACHMODERESPONSE"))
(shadow '*ERROR* (find-package "SR_ROBOT_MSGS::ROBOTTEACHMODERESPONSE"))
(defconstant sr_robot_msgs::RobotTeachModeResponse::*ERROR* -1)
(intern "*SUCCESS*" (find-package "SR_ROBOT_MSGS::ROBOTTEACHMODERESPONSE"))
(shadow '*SUCCESS* (find-package "SR_ROBOT_MSGS::ROBOTTEACHMODERESPONSE"))
(defconstant sr_robot_msgs::RobotTeachModeResponse::*SUCCESS* 0)
(defclass sr_robot_msgs::RobotTeachModeResponse
  :super ros::object
  :slots (_result ))

(defmethod sr_robot_msgs::RobotTeachModeResponse
  (:init
   (&key
    ((:result __result) 0)
    )
   (send-super :init)
   (setq _result (round __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; int32 _result
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _result
       (write-long _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _result
     (setq _result (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass sr_robot_msgs::RobotTeachMode
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::RobotTeachMode :md5sum-) "c6613d1d4bc3ca4c55986e93b2eaff93")
(setf (get sr_robot_msgs::RobotTeachMode :datatype-) "sr_robot_msgs/RobotTeachMode")
(setf (get sr_robot_msgs::RobotTeachMode :request) sr_robot_msgs::RobotTeachModeRequest)
(setf (get sr_robot_msgs::RobotTeachMode :response) sr_robot_msgs::RobotTeachModeResponse)

(defmethod sr_robot_msgs::RobotTeachModeRequest
  (:response () (instance sr_robot_msgs::RobotTeachModeResponse :init)))

(setf (get sr_robot_msgs::RobotTeachModeRequest :md5sum-) "c6613d1d4bc3ca4c55986e93b2eaff93")
(setf (get sr_robot_msgs::RobotTeachModeRequest :datatype-) "sr_robot_msgs/RobotTeachModeRequest")
(setf (get sr_robot_msgs::RobotTeachModeRequest :definition-)
      "

uint32 TRAJECTORY_MODE=0

uint32 TEACH_MODE=1

uint32 POSITION_MODE=2


uint32 teach_mode
string robot
---

int32 ERROR=-1
int32 SUCCESS=0


int32 result

")

(setf (get sr_robot_msgs::RobotTeachModeResponse :md5sum-) "c6613d1d4bc3ca4c55986e93b2eaff93")
(setf (get sr_robot_msgs::RobotTeachModeResponse :datatype-) "sr_robot_msgs/RobotTeachModeResponse")
(setf (get sr_robot_msgs::RobotTeachModeResponse :definition-)
      "

uint32 TRAJECTORY_MODE=0

uint32 TEACH_MODE=1

uint32 POSITION_MODE=2


uint32 teach_mode
string robot
---

int32 ERROR=-1
int32 SUCCESS=0


int32 result

")



(provide :sr_robot_msgs/RobotTeachMode "c6613d1d4bc3ca4c55986e93b2eaff93")


