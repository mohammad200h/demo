;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::contrlr)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'contrlr (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::CONTRLR")
  (make-package "SR_ROBOT_MSGS::CONTRLR"))

(in-package "ROS")
;;//! \htmlinclude contrlr.msg.html


(defclass sr_robot_msgs::contrlr
  :super ros::object
  :slots (_contrlr_name _list_of_parameters _length_of_list ))

(defmethod sr_robot_msgs::contrlr
  (:init
   (&key
    ((:contrlr_name __contrlr_name) "")
    ((:list_of_parameters __list_of_parameters) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:length_of_list __length_of_list) 0)
    )
   (send-super :init)
   (setq _contrlr_name (string __contrlr_name))
   (setq _list_of_parameters __list_of_parameters)
   (setq _length_of_list (round __length_of_list))
   self)
  (:contrlr_name
   (&optional __contrlr_name)
   (if __contrlr_name (setq _contrlr_name __contrlr_name)) _contrlr_name)
  (:list_of_parameters
   (&optional __list_of_parameters)
   (if __list_of_parameters (setq _list_of_parameters __list_of_parameters)) _list_of_parameters)
  (:length_of_list
   (&optional __length_of_list)
   (if __length_of_list (setq _length_of_list __length_of_list)) _length_of_list)
  (:serialization-length
   ()
   (+
    ;; string _contrlr_name
    4 (length _contrlr_name)
    ;; string[] _list_of_parameters
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _list_of_parameters)) 4
    ;; uint8 _length_of_list
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _contrlr_name
       (write-long (length _contrlr_name) s) (princ _contrlr_name s)
     ;; string[] _list_of_parameters
     (write-long (length _list_of_parameters) s)
     (dolist (elem _list_of_parameters)
       (write-long (length elem) s) (princ elem s)
       )
     ;; uint8 _length_of_list
       (write-byte _length_of_list s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _contrlr_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _contrlr_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string[] _list_of_parameters
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _list_of_parameters (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _list_of_parameters i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; uint8 _length_of_list
     (setq _length_of_list (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get sr_robot_msgs::contrlr :md5sum-) "7b2aa60305c5a9ab0ff05803e4d2ab85")
(setf (get sr_robot_msgs::contrlr :datatype-) "sr_robot_msgs/contrlr")
(setf (get sr_robot_msgs::contrlr :definition-)
      "# the contrlr name (e.g. smart_motor_ff2)
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



(provide :sr_robot_msgs/contrlr "7b2aa60305c5a9ab0ff05803e4d2ab85")


