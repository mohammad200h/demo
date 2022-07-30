;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::command)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'command (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::COMMAND")
  (make-package "SR_ROBOT_MSGS::COMMAND"))

(in-package "ROS")
;;//! \htmlinclude command.msg.html


(defclass sr_robot_msgs::command
  :super ros::object
  :slots (_command_type _sendupdate_command _contrlr_command ))

(defmethod sr_robot_msgs::command
  (:init
   (&key
    ((:command_type __command_type) 0)
    ((:sendupdate_command __sendupdate_command) (instance sr_robot_msgs::sendupdate :init))
    ((:contrlr_command __contrlr_command) (instance sr_robot_msgs::contrlr :init))
    )
   (send-super :init)
   (setq _command_type (round __command_type))
   (setq _sendupdate_command __sendupdate_command)
   (setq _contrlr_command __contrlr_command)
   self)
  (:command_type
   (&optional __command_type)
   (if __command_type (setq _command_type __command_type)) _command_type)
  (:sendupdate_command
   (&rest __sendupdate_command)
   (if (keywordp (car __sendupdate_command))
       (send* _sendupdate_command __sendupdate_command)
     (progn
       (if __sendupdate_command (setq _sendupdate_command (car __sendupdate_command)))
       _sendupdate_command)))
  (:contrlr_command
   (&rest __contrlr_command)
   (if (keywordp (car __contrlr_command))
       (send* _contrlr_command __contrlr_command)
     (progn
       (if __contrlr_command (setq _contrlr_command (car __contrlr_command)))
       _contrlr_command)))
  (:serialization-length
   ()
   (+
    ;; int8 _command_type
    1
    ;; sr_robot_msgs/sendupdate _sendupdate_command
    (send _sendupdate_command :serialization-length)
    ;; sr_robot_msgs/contrlr _contrlr_command
    (send _contrlr_command :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _command_type
       (write-byte _command_type s)
     ;; sr_robot_msgs/sendupdate _sendupdate_command
       (send _sendupdate_command :serialize s)
     ;; sr_robot_msgs/contrlr _contrlr_command
       (send _contrlr_command :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _command_type
     (setq _command_type (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _command_type 127) (setq _command_type (- _command_type 256)))
   ;; sr_robot_msgs/sendupdate _sendupdate_command
     (send _sendupdate_command :deserialize buf ptr-) (incf ptr- (send _sendupdate_command :serialization-length))
   ;; sr_robot_msgs/contrlr _contrlr_command
     (send _contrlr_command :deserialize buf ptr-) (incf ptr- (send _contrlr_command :serialization-length))
   ;;
   self)
  )

(setf (get sr_robot_msgs::command :md5sum-) "2c927cc3decc25060b43219a05beb823")
(setf (get sr_robot_msgs::command :datatype-) "sr_robot_msgs/command")
(setf (get sr_robot_msgs::command :definition-)
      "# sendupdate is 1
# contrlr is 2
int8 command_type

sendupdate sendupdate_command
contrlr contrlr_command

================================================================================
MSG: sr_robot_msgs/sendupdate
int8 sendupdate_length
joint[] sendupdate_list


================================================================================
MSG: sr_robot_msgs/joint
string  joint_name
float64 joint_position
float64 joint_target
float64 joint_torque
float64 joint_temperature
float64 joint_current
string  error_flag

================================================================================
MSG: sr_robot_msgs/contrlr
# the contrlr name (e.g. smart_motor_ff2)
string   contrlr_name

# specify here a list of parameter_name:value
# e.g. p:10 sets the p value of the controller to 10
# the possible parameters are:
#int16  p
#int16  i
#int16  d
#int16  imax
#int16  target
#int16  sensor
#int16  valve 
#int16  deadband
#int16  offset
#int16  shift
#int16  max
#
## parameters for the motors
#int16  motor_maxforce
#int16  motor_safeforce
#int16  force_p
#int16  force_i
#int16  force_d
#int16  force_imax
#int16  force_out_shift
#int16  force_deadband
#int16  force_offset
#int16  sensor_imax
#int16  sensor_deadband
#int16  sensor_offset
#int16  max_temperature
#int16  max_current

string[] list_of_parameters

# the size of the list_of_parameters you are sending
uint8 	 length_of_list



")



(provide :sr_robot_msgs/command "2c927cc3decc25060b43219a05beb823")


