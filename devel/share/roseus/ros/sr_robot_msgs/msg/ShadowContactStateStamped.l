;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::ShadowContactStateStamped)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'ShadowContactStateStamped (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::SHADOWCONTACTSTATESTAMPED")
  (make-package "SR_ROBOT_MSGS::SHADOWCONTACTSTATESTAMPED"))

(in-package "ROS")
;;//! \htmlinclude ShadowContactStateStamped.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sr_robot_msgs::ShadowContactStateStamped
  :super ros::object
  :slots (_header _tangential_force _contact_position _contact_normal _Fnormal _Ltorque ))

(defmethod sr_robot_msgs::ShadowContactStateStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:tangential_force __tangential_force) (instance geometry_msgs::Vector3 :init))
    ((:contact_position __contact_position) (instance geometry_msgs::Point :init))
    ((:contact_normal __contact_normal) (instance geometry_msgs::Vector3 :init))
    ((:Fnormal __Fnormal) 0.0)
    ((:Ltorque __Ltorque) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _tangential_force __tangential_force)
   (setq _contact_position __contact_position)
   (setq _contact_normal __contact_normal)
   (setq _Fnormal (float __Fnormal))
   (setq _Ltorque (float __Ltorque))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:tangential_force
   (&rest __tangential_force)
   (if (keywordp (car __tangential_force))
       (send* _tangential_force __tangential_force)
     (progn
       (if __tangential_force (setq _tangential_force (car __tangential_force)))
       _tangential_force)))
  (:contact_position
   (&rest __contact_position)
   (if (keywordp (car __contact_position))
       (send* _contact_position __contact_position)
     (progn
       (if __contact_position (setq _contact_position (car __contact_position)))
       _contact_position)))
  (:contact_normal
   (&rest __contact_normal)
   (if (keywordp (car __contact_normal))
       (send* _contact_normal __contact_normal)
     (progn
       (if __contact_normal (setq _contact_normal (car __contact_normal)))
       _contact_normal)))
  (:Fnormal
   (&optional __Fnormal)
   (if __Fnormal (setq _Fnormal __Fnormal)) _Fnormal)
  (:Ltorque
   (&optional __Ltorque)
   (if __Ltorque (setq _Ltorque __Ltorque)) _Ltorque)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Vector3 _tangential_force
    (send _tangential_force :serialization-length)
    ;; geometry_msgs/Point _contact_position
    (send _contact_position :serialization-length)
    ;; geometry_msgs/Vector3 _contact_normal
    (send _contact_normal :serialization-length)
    ;; float64 _Fnormal
    8
    ;; float64 _Ltorque
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Vector3 _tangential_force
       (send _tangential_force :serialize s)
     ;; geometry_msgs/Point _contact_position
       (send _contact_position :serialize s)
     ;; geometry_msgs/Vector3 _contact_normal
       (send _contact_normal :serialize s)
     ;; float64 _Fnormal
       (sys::poke _Fnormal (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Ltorque
       (sys::poke _Ltorque (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Vector3 _tangential_force
     (send _tangential_force :deserialize buf ptr-) (incf ptr- (send _tangential_force :serialization-length))
   ;; geometry_msgs/Point _contact_position
     (send _contact_position :deserialize buf ptr-) (incf ptr- (send _contact_position :serialization-length))
   ;; geometry_msgs/Vector3 _contact_normal
     (send _contact_normal :deserialize buf ptr-) (incf ptr- (send _contact_normal :serialization-length))
   ;; float64 _Fnormal
     (setq _Fnormal (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Ltorque
     (setq _Ltorque (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get sr_robot_msgs::ShadowContactStateStamped :md5sum-) "a0f0d461efe98dfada1d88584c069890")
(setf (get sr_robot_msgs::ShadowContactStateStamped :datatype-) "sr_robot_msgs/ShadowContactStateStamped")
(setf (get sr_robot_msgs::ShadowContactStateStamped :definition-)
      "# All 3D vectors are referenced in the fingertip core center

Header header					# stamp
geometry_msgs/Vector3 tangential_force  	# tangential force (local shear force)
geometry_msgs/Point  contact_position		# contact position
geometry_msgs/Vector3 contact_normal      	# contact normal
float64 Fnormal					# amplitude of normal force (along normal)
float64 Ltorque					# amplitude of local torque (around normal)


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
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :sr_robot_msgs/ShadowContactStateStamped "a0f0d461efe98dfada1d88584c069890")


