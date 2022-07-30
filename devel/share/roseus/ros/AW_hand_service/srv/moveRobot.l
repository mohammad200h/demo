;; Auto-generated. Do not edit!


(when (boundp 'AW_hand_service::moveRobot)
  (if (not (find-package "AW_HAND_SERVICE"))
    (make-package "AW_HAND_SERVICE"))
  (shadow 'moveRobot (find-package "AW_HAND_SERVICE")))
(unless (find-package "AW_HAND_SERVICE::MOVEROBOT")
  (make-package "AW_HAND_SERVICE::MOVEROBOT"))
(unless (find-package "AW_HAND_SERVICE::MOVEROBOTREQUEST")
  (make-package "AW_HAND_SERVICE::MOVEROBOTREQUEST"))
(unless (find-package "AW_HAND_SERVICE::MOVEROBOTRESPONSE")
  (make-package "AW_HAND_SERVICE::MOVEROBOTRESPONSE"))

(in-package "ROS")



(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass AW_hand_service::moveRobotRequest
  :super ros::object
  :slots (_obj_x _obj_y _obj_z ))

(defmethod AW_hand_service::moveRobotRequest
  (:init
   (&key
    ((:obj_x __obj_x) 0.0)
    ((:obj_y __obj_y) 0.0)
    ((:obj_z __obj_z) 0.0)
    )
   (send-super :init)
   (setq _obj_x (float __obj_x))
   (setq _obj_y (float __obj_y))
   (setq _obj_z (float __obj_z))
   self)
  (:obj_x
   (&optional __obj_x)
   (if __obj_x (setq _obj_x __obj_x)) _obj_x)
  (:obj_y
   (&optional __obj_y)
   (if __obj_y (setq _obj_y __obj_y)) _obj_y)
  (:obj_z
   (&optional __obj_z)
   (if __obj_z (setq _obj_z __obj_z)) _obj_z)
  (:serialization-length
   ()
   (+
    ;; float64 _obj_x
    8
    ;; float64 _obj_y
    8
    ;; float64 _obj_z
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _obj_x
       (sys::poke _obj_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _obj_y
       (sys::poke _obj_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _obj_z
       (sys::poke _obj_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _obj_x
     (setq _obj_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _obj_y
     (setq _obj_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _obj_z
     (setq _obj_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass AW_hand_service::moveRobotResponse
  :super ros::object
  :slots (_plan_executed _RobotJoints ))

(defmethod AW_hand_service::moveRobotResponse
  (:init
   (&key
    ((:plan_executed __plan_executed) nil)
    ((:RobotJoints __RobotJoints) (instance sensor_msgs::JointState :init))
    )
   (send-super :init)
   (setq _plan_executed __plan_executed)
   (setq _RobotJoints __RobotJoints)
   self)
  (:plan_executed
   (&optional __plan_executed)
   (if __plan_executed (setq _plan_executed __plan_executed)) _plan_executed)
  (:RobotJoints
   (&rest __RobotJoints)
   (if (keywordp (car __RobotJoints))
       (send* _RobotJoints __RobotJoints)
     (progn
       (if __RobotJoints (setq _RobotJoints (car __RobotJoints)))
       _RobotJoints)))
  (:serialization-length
   ()
   (+
    ;; bool _plan_executed
    1
    ;; sensor_msgs/JointState _RobotJoints
    (send _RobotJoints :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _plan_executed
       (if _plan_executed (write-byte -1 s) (write-byte 0 s))
     ;; sensor_msgs/JointState _RobotJoints
       (send _RobotJoints :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _plan_executed
     (setq _plan_executed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; sensor_msgs/JointState _RobotJoints
     (send _RobotJoints :deserialize buf ptr-) (incf ptr- (send _RobotJoints :serialization-length))
   ;;
   self)
  )

(defclass AW_hand_service::moveRobot
  :super ros::object
  :slots ())

(setf (get AW_hand_service::moveRobot :md5sum-) "a379339920dab0da344b2dbd1b8b7fc8")
(setf (get AW_hand_service::moveRobot :datatype-) "AW_hand_service/moveRobot")
(setf (get AW_hand_service::moveRobot :request) AW_hand_service::moveRobotRequest)
(setf (get AW_hand_service::moveRobot :response) AW_hand_service::moveRobotResponse)

(defmethod AW_hand_service::moveRobotRequest
  (:response () (instance AW_hand_service::moveRobotResponse :init)))

(setf (get AW_hand_service::moveRobotRequest :md5sum-) "a379339920dab0da344b2dbd1b8b7fc8")
(setf (get AW_hand_service::moveRobotRequest :datatype-) "AW_hand_service/moveRobotRequest")
(setf (get AW_hand_service::moveRobotRequest :definition-)
      "float64 obj_x
float64 obj_y
float64 obj_z
---
bool plan_executed
sensor_msgs/JointState RobotJoints



================================================================================
MSG: sensor_msgs/JointState
# This is a message that holds data to describe the state of a set of torque controlled joints. 
#
# The state of each joint (revolute or prismatic) is defined by:
#  * the position of the joint (rad or m),
#  * the velocity of the joint (rad/s or m/s) and 
#  * the effort that is applied in the joint (Nm or N).
#
# Each joint is uniquely identified by its name
# The header specifies the time at which the joint states were recorded. All the joint states
# in one message have to be recorded at the same time.
#
# This message consists of a multiple arrays, one for each part of the joint state. 
# The goal is to make each of the fields optional. When e.g. your joints have no
# effort associated with them, you can leave the effort array empty. 
#
# All arrays in this message should have the same size, or be empty.
# This is the only way to uniquely associate the joint name with the correct
# states.


Header header

string[] name
float64[] position
float64[] velocity
float64[] effort

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

(setf (get AW_hand_service::moveRobotResponse :md5sum-) "a379339920dab0da344b2dbd1b8b7fc8")
(setf (get AW_hand_service::moveRobotResponse :datatype-) "AW_hand_service/moveRobotResponse")
(setf (get AW_hand_service::moveRobotResponse :definition-)
      "float64 obj_x
float64 obj_y
float64 obj_z
---
bool plan_executed
sensor_msgs/JointState RobotJoints



================================================================================
MSG: sensor_msgs/JointState
# This is a message that holds data to describe the state of a set of torque controlled joints. 
#
# The state of each joint (revolute or prismatic) is defined by:
#  * the position of the joint (rad or m),
#  * the velocity of the joint (rad/s or m/s) and 
#  * the effort that is applied in the joint (Nm or N).
#
# Each joint is uniquely identified by its name
# The header specifies the time at which the joint states were recorded. All the joint states
# in one message have to be recorded at the same time.
#
# This message consists of a multiple arrays, one for each part of the joint state. 
# The goal is to make each of the fields optional. When e.g. your joints have no
# effort associated with them, you can leave the effort array empty. 
#
# All arrays in this message should have the same size, or be empty.
# This is the only way to uniquely associate the joint name with the correct
# states.


Header header

string[] name
float64[] position
float64[] velocity
float64[] effort

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



(provide :AW_hand_service/moveRobot "a379339920dab0da344b2dbd1b8b7fc8")


