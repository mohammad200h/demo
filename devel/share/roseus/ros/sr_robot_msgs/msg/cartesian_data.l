;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::cartesian_data)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'cartesian_data (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::CARTESIAN_DATA")
  (make-package "SR_ROBOT_MSGS::CARTESIAN_DATA"))

(in-package "ROS")
;;//! \htmlinclude cartesian_data.msg.html


(defclass sr_robot_msgs::cartesian_data
  :super ros::object
  :slots (_cartesian_positions_length _cartesian_positions ))

(defmethod sr_robot_msgs::cartesian_data
  (:init
   (&key
    ((:cartesian_positions_length __cartesian_positions_length) 0)
    ((:cartesian_positions __cartesian_positions) (let (r) (dotimes (i 0) (push (instance sr_robot_msgs::cartesian_position :init) r)) r))
    )
   (send-super :init)
   (setq _cartesian_positions_length (round __cartesian_positions_length))
   (setq _cartesian_positions __cartesian_positions)
   self)
  (:cartesian_positions_length
   (&optional __cartesian_positions_length)
   (if __cartesian_positions_length (setq _cartesian_positions_length __cartesian_positions_length)) _cartesian_positions_length)
  (:cartesian_positions
   (&rest __cartesian_positions)
   (if (keywordp (car __cartesian_positions))
       (send* _cartesian_positions __cartesian_positions)
     (progn
       (if __cartesian_positions (setq _cartesian_positions (car __cartesian_positions)))
       _cartesian_positions)))
  (:serialization-length
   ()
   (+
    ;; int8 _cartesian_positions_length
    1
    ;; sr_robot_msgs/cartesian_position[] _cartesian_positions
    (apply #'+ (send-all _cartesian_positions :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _cartesian_positions_length
       (write-byte _cartesian_positions_length s)
     ;; sr_robot_msgs/cartesian_position[] _cartesian_positions
     (write-long (length _cartesian_positions) s)
     (dolist (elem _cartesian_positions)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _cartesian_positions_length
     (setq _cartesian_positions_length (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _cartesian_positions_length 127) (setq _cartesian_positions_length (- _cartesian_positions_length 256)))
   ;; sr_robot_msgs/cartesian_position[] _cartesian_positions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _cartesian_positions (let (r) (dotimes (i n) (push (instance sr_robot_msgs::cartesian_position :init) r)) r))
     (dolist (elem- _cartesian_positions)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get sr_robot_msgs::cartesian_data :md5sum-) "0efe699b2863e30a84ffabfdca8dfb19")
(setf (get sr_robot_msgs::cartesian_data :datatype-) "sr_robot_msgs/cartesian_data")
(setf (get sr_robot_msgs::cartesian_data :definition-)
      "int8                 cartesian_positions_length
cartesian_position[] cartesian_positions

================================================================================
MSG: sr_robot_msgs/cartesian_position
string  tip_name
float32 tip_pos_x
float32 tip_pos_y
float32 tip_pos_z
float32 tip_orientation_rho
float32 tip_orientation_theta
float32 tip_orientation_sigma


")



(provide :sr_robot_msgs/cartesian_data "0efe699b2863e30a84ffabfdca8dfb19")


