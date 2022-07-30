;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::JointMuscleValveControllerCommand)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'JointMuscleValveControllerCommand (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::JOINTMUSCLEVALVECONTROLLERCOMMAND")
  (make-package "SR_ROBOT_MSGS::JOINTMUSCLEVALVECONTROLLERCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude JointMuscleValveControllerCommand.msg.html


(defclass sr_robot_msgs::JointMuscleValveControllerCommand
  :super ros::object
  :slots (_cmd_valve_muscle _cmd_duration_ms ))

(defmethod sr_robot_msgs::JointMuscleValveControllerCommand
  (:init
   (&key
    ((:cmd_valve_muscle __cmd_valve_muscle) (make-array 2 :initial-element 0 :element-type :integer))
    ((:cmd_duration_ms __cmd_duration_ms) (make-array 2 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _cmd_valve_muscle __cmd_valve_muscle)
   (setq _cmd_duration_ms __cmd_duration_ms)
   self)
  (:cmd_valve_muscle
   (&optional __cmd_valve_muscle)
   (if __cmd_valve_muscle (setq _cmd_valve_muscle __cmd_valve_muscle)) _cmd_valve_muscle)
  (:cmd_duration_ms
   (&optional __cmd_duration_ms)
   (if __cmd_duration_ms (setq _cmd_duration_ms __cmd_duration_ms)) _cmd_duration_ms)
  (:serialization-length
   ()
   (+
    ;; int8[2] _cmd_valve_muscle
    (* 1    2)
    ;; uint64[2] _cmd_duration_ms
    (* 8    2)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8[2] _cmd_valve_muscle
     (dotimes (i 2)
       (write-byte (elt _cmd_valve_muscle i) s)
       )
     ;; uint64[2] _cmd_duration_ms
     (dotimes (i 2)
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _cmd_duration_ms i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _cmd_duration_ms i)) (= (length ((elt _cmd_duration_ms i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _cmd_duration_ms i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _cmd_duration_ms i) . bv) 1) -1) s))
             ((and (class (elt _cmd_duration_ms i)) (= (length ((elt _cmd_duration_ms i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _cmd_duration_ms i) . bv) 0) s)
              (write-long (if (>= (elt _cmd_duration_ms i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _cmd_duration_ms i) s)(write-long (if (>= (elt _cmd_duration_ms i) 0) 0 #xffffffff) s)))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8[2] _cmd_valve_muscle
   (dotimes (i (length _cmd_valve_muscle))
     (setf (elt _cmd_valve_muscle i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _cmd_valve_muscle i) 127) (setf (elt _cmd_valve_muscle i) (- (elt _cmd_valve_muscle i) 256)))
     )
   ;; uint64[2] _cmd_duration_ms
   (dotimes (i (length _cmd_duration_ms))
     
#+(or :alpha :irix6 :x86_64)
      (setf (elt _cmd_duration_ms i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _cmd_duration_ms i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     )
   ;;
   self)
  )

(setf (get sr_robot_msgs::JointMuscleValveControllerCommand :md5sum-) "1a35a9f185150fc2bca2640471eeb55f")
(setf (get sr_robot_msgs::JointMuscleValveControllerCommand :datatype-) "sr_robot_msgs/JointMuscleValveControllerCommand")
(setf (get sr_robot_msgs::JointMuscleValveControllerCommand :definition-)
      "# This command will allow the user to specify a separate command for each of the two muscles that control the joint.
# The user will also specify a duration in ms for that command. During this duration the command will be sent to the hand
# every ms. 
# Once this duration period has elapsed, a command of 0 will be sent to the muscle (meaning both the filling and emptying valves for that 
# muscle remain closed), until a new command is received
# A duration of 0 means that there is no timeout, so the valve command will be sent to the muscle until a different valve command is received.
# BE CAREFUL WHEN USING A DURATION OF 0 AS THIS COULD EVENTUALLY DAMAGE THE MUSCLE

# Allowed values for the cmd_valve_muscle are integers from -4 to +4.
# +4 the filling valve is open during a full ms cycle. Emptying valve is closed
# +3 the filling valve is open during 0.75 ms and closed during 0.25 ms in a 1 ms cycle. Emptying valve is closed
# +2 the filling valve is open during 0.5 ms and closed during 0.5 ms in a 1 ms cycle. Emptying valve is closed
# +1 the filling valve is open during 0.25 ms and closed during 0.75 ms in a 1 ms cycle. Emptying valve is closed
# 0 both valves (filling and emptying) remain closed in a 1 ms cycle
# ...
# -3 the emptying valve is open during 0.75 ms and closed during 0.25 ms in a 1 ms cycle. Filling valve is closed
# -4 the emptying valve is open during a full ms cycle. Filling valve is closed

int8[2] cmd_valve_muscle
uint64[2] cmd_duration_ms




")



(provide :sr_robot_msgs/JointMuscleValveControllerCommand "1a35a9f185150fc2bca2640471eeb55f")


