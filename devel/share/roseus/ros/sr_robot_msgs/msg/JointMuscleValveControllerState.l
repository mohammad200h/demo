;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::JointMuscleValveControllerState)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'JointMuscleValveControllerState (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::JOINTMUSCLEVALVECONTROLLERSTATE")
  (make-package "SR_ROBOT_MSGS::JOINTMUSCLEVALVECONTROLLERSTATE"))

(in-package "ROS")
;;//! \htmlinclude JointMuscleValveControllerState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sr_robot_msgs::JointMuscleValveControllerState
  :super ros::object
  :slots (_header _set_valve_muscle_0 _set_valve_muscle_1 _set_duration_muscle_0 _set_duration_muscle_1 _current_valve_muscle_0 _current_valve_muscle_1 _current_duration_muscle_0 _current_duration_muscle_1 _packed_valve _muscle_pressure_0 _muscle_pressure_1 _time_step ))

(defmethod sr_robot_msgs::JointMuscleValveControllerState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:set_valve_muscle_0 __set_valve_muscle_0) 0)
    ((:set_valve_muscle_1 __set_valve_muscle_1) 0)
    ((:set_duration_muscle_0 __set_duration_muscle_0) 0)
    ((:set_duration_muscle_1 __set_duration_muscle_1) 0)
    ((:current_valve_muscle_0 __current_valve_muscle_0) 0)
    ((:current_valve_muscle_1 __current_valve_muscle_1) 0)
    ((:current_duration_muscle_0 __current_duration_muscle_0) 0)
    ((:current_duration_muscle_1 __current_duration_muscle_1) 0)
    ((:packed_valve __packed_valve) 0.0)
    ((:muscle_pressure_0 __muscle_pressure_0) 0)
    ((:muscle_pressure_1 __muscle_pressure_1) 0)
    ((:time_step __time_step) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _set_valve_muscle_0 (round __set_valve_muscle_0))
   (setq _set_valve_muscle_1 (round __set_valve_muscle_1))
   (setq _set_duration_muscle_0 (round __set_duration_muscle_0))
   (setq _set_duration_muscle_1 (round __set_duration_muscle_1))
   (setq _current_valve_muscle_0 (round __current_valve_muscle_0))
   (setq _current_valve_muscle_1 (round __current_valve_muscle_1))
   (setq _current_duration_muscle_0 (round __current_duration_muscle_0))
   (setq _current_duration_muscle_1 (round __current_duration_muscle_1))
   (setq _packed_valve (float __packed_valve))
   (setq _muscle_pressure_0 (round __muscle_pressure_0))
   (setq _muscle_pressure_1 (round __muscle_pressure_1))
   (setq _time_step (float __time_step))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:set_valve_muscle_0
   (&optional __set_valve_muscle_0)
   (if __set_valve_muscle_0 (setq _set_valve_muscle_0 __set_valve_muscle_0)) _set_valve_muscle_0)
  (:set_valve_muscle_1
   (&optional __set_valve_muscle_1)
   (if __set_valve_muscle_1 (setq _set_valve_muscle_1 __set_valve_muscle_1)) _set_valve_muscle_1)
  (:set_duration_muscle_0
   (&optional __set_duration_muscle_0)
   (if __set_duration_muscle_0 (setq _set_duration_muscle_0 __set_duration_muscle_0)) _set_duration_muscle_0)
  (:set_duration_muscle_1
   (&optional __set_duration_muscle_1)
   (if __set_duration_muscle_1 (setq _set_duration_muscle_1 __set_duration_muscle_1)) _set_duration_muscle_1)
  (:current_valve_muscle_0
   (&optional __current_valve_muscle_0)
   (if __current_valve_muscle_0 (setq _current_valve_muscle_0 __current_valve_muscle_0)) _current_valve_muscle_0)
  (:current_valve_muscle_1
   (&optional __current_valve_muscle_1)
   (if __current_valve_muscle_1 (setq _current_valve_muscle_1 __current_valve_muscle_1)) _current_valve_muscle_1)
  (:current_duration_muscle_0
   (&optional __current_duration_muscle_0)
   (if __current_duration_muscle_0 (setq _current_duration_muscle_0 __current_duration_muscle_0)) _current_duration_muscle_0)
  (:current_duration_muscle_1
   (&optional __current_duration_muscle_1)
   (if __current_duration_muscle_1 (setq _current_duration_muscle_1 __current_duration_muscle_1)) _current_duration_muscle_1)
  (:packed_valve
   (&optional __packed_valve)
   (if __packed_valve (setq _packed_valve __packed_valve)) _packed_valve)
  (:muscle_pressure_0
   (&optional __muscle_pressure_0)
   (if __muscle_pressure_0 (setq _muscle_pressure_0 __muscle_pressure_0)) _muscle_pressure_0)
  (:muscle_pressure_1
   (&optional __muscle_pressure_1)
   (if __muscle_pressure_1 (setq _muscle_pressure_1 __muscle_pressure_1)) _muscle_pressure_1)
  (:time_step
   (&optional __time_step)
   (if __time_step (setq _time_step __time_step)) _time_step)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int8 _set_valve_muscle_0
    1
    ;; int8 _set_valve_muscle_1
    1
    ;; uint64 _set_duration_muscle_0
    8
    ;; uint64 _set_duration_muscle_1
    8
    ;; int8 _current_valve_muscle_0
    1
    ;; int8 _current_valve_muscle_1
    1
    ;; uint64 _current_duration_muscle_0
    8
    ;; uint64 _current_duration_muscle_1
    8
    ;; float64 _packed_valve
    8
    ;; uint16 _muscle_pressure_0
    2
    ;; uint16 _muscle_pressure_1
    2
    ;; float64 _time_step
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int8 _set_valve_muscle_0
       (write-byte _set_valve_muscle_0 s)
     ;; int8 _set_valve_muscle_1
       (write-byte _set_valve_muscle_1 s)
     ;; uint64 _set_duration_muscle_0
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _set_duration_muscle_0 (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _set_duration_muscle_0) (= (length (_set_duration_muscle_0 . bv)) 2)) ;; bignum
              (write-long (ash (elt (_set_duration_muscle_0 . bv) 0) 0) s)
              (write-long (ash (elt (_set_duration_muscle_0 . bv) 1) -1) s))
             ((and (class _set_duration_muscle_0) (= (length (_set_duration_muscle_0 . bv)) 1)) ;; big1
              (write-long (elt (_set_duration_muscle_0 . bv) 0) s)
              (write-long (if (>= _set_duration_muscle_0 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _set_duration_muscle_0 s)(write-long (if (>= _set_duration_muscle_0 0) 0 #xffffffff) s)))
     ;; uint64 _set_duration_muscle_1
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _set_duration_muscle_1 (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _set_duration_muscle_1) (= (length (_set_duration_muscle_1 . bv)) 2)) ;; bignum
              (write-long (ash (elt (_set_duration_muscle_1 . bv) 0) 0) s)
              (write-long (ash (elt (_set_duration_muscle_1 . bv) 1) -1) s))
             ((and (class _set_duration_muscle_1) (= (length (_set_duration_muscle_1 . bv)) 1)) ;; big1
              (write-long (elt (_set_duration_muscle_1 . bv) 0) s)
              (write-long (if (>= _set_duration_muscle_1 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _set_duration_muscle_1 s)(write-long (if (>= _set_duration_muscle_1 0) 0 #xffffffff) s)))
     ;; int8 _current_valve_muscle_0
       (write-byte _current_valve_muscle_0 s)
     ;; int8 _current_valve_muscle_1
       (write-byte _current_valve_muscle_1 s)
     ;; uint64 _current_duration_muscle_0
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _current_duration_muscle_0 (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _current_duration_muscle_0) (= (length (_current_duration_muscle_0 . bv)) 2)) ;; bignum
              (write-long (ash (elt (_current_duration_muscle_0 . bv) 0) 0) s)
              (write-long (ash (elt (_current_duration_muscle_0 . bv) 1) -1) s))
             ((and (class _current_duration_muscle_0) (= (length (_current_duration_muscle_0 . bv)) 1)) ;; big1
              (write-long (elt (_current_duration_muscle_0 . bv) 0) s)
              (write-long (if (>= _current_duration_muscle_0 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _current_duration_muscle_0 s)(write-long (if (>= _current_duration_muscle_0 0) 0 #xffffffff) s)))
     ;; uint64 _current_duration_muscle_1
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _current_duration_muscle_1 (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _current_duration_muscle_1) (= (length (_current_duration_muscle_1 . bv)) 2)) ;; bignum
              (write-long (ash (elt (_current_duration_muscle_1 . bv) 0) 0) s)
              (write-long (ash (elt (_current_duration_muscle_1 . bv) 1) -1) s))
             ((and (class _current_duration_muscle_1) (= (length (_current_duration_muscle_1 . bv)) 1)) ;; big1
              (write-long (elt (_current_duration_muscle_1 . bv) 0) s)
              (write-long (if (>= _current_duration_muscle_1 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _current_duration_muscle_1 s)(write-long (if (>= _current_duration_muscle_1 0) 0 #xffffffff) s)))
     ;; float64 _packed_valve
       (sys::poke _packed_valve (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint16 _muscle_pressure_0
       (write-word _muscle_pressure_0 s)
     ;; uint16 _muscle_pressure_1
       (write-word _muscle_pressure_1 s)
     ;; float64 _time_step
       (sys::poke _time_step (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int8 _set_valve_muscle_0
     (setq _set_valve_muscle_0 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _set_valve_muscle_0 127) (setq _set_valve_muscle_0 (- _set_valve_muscle_0 256)))
   ;; int8 _set_valve_muscle_1
     (setq _set_valve_muscle_1 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _set_valve_muscle_1 127) (setq _set_valve_muscle_1 (- _set_valve_muscle_1 256)))
   ;; uint64 _set_duration_muscle_0
     
#+(or :alpha :irix6 :x86_64)
      (setf _set_duration_muscle_0 (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _set_duration_muscle_0 (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; uint64 _set_duration_muscle_1
     
#+(or :alpha :irix6 :x86_64)
      (setf _set_duration_muscle_1 (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _set_duration_muscle_1 (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int8 _current_valve_muscle_0
     (setq _current_valve_muscle_0 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _current_valve_muscle_0 127) (setq _current_valve_muscle_0 (- _current_valve_muscle_0 256)))
   ;; int8 _current_valve_muscle_1
     (setq _current_valve_muscle_1 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _current_valve_muscle_1 127) (setq _current_valve_muscle_1 (- _current_valve_muscle_1 256)))
   ;; uint64 _current_duration_muscle_0
     
#+(or :alpha :irix6 :x86_64)
      (setf _current_duration_muscle_0 (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _current_duration_muscle_0 (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; uint64 _current_duration_muscle_1
     
#+(or :alpha :irix6 :x86_64)
      (setf _current_duration_muscle_1 (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _current_duration_muscle_1 (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _packed_valve
     (setq _packed_valve (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint16 _muscle_pressure_0
     (setq _muscle_pressure_0 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _muscle_pressure_1
     (setq _muscle_pressure_1 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float64 _time_step
     (setq _time_step (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get sr_robot_msgs::JointMuscleValveControllerState :md5sum-) "fc22942516cdb4d514558e60d7263d35")
(setf (get sr_robot_msgs::JointMuscleValveControllerState :datatype-) "sr_robot_msgs/JointMuscleValveControllerState")
(setf (get sr_robot_msgs::JointMuscleValveControllerState :definition-)
      "Header header
int8 set_valve_muscle_0
int8 set_valve_muscle_1
uint64 set_duration_muscle_0
uint64 set_duration_muscle_1
int8 current_valve_muscle_0
int8 current_valve_muscle_1
uint64 current_duration_muscle_0
uint64 current_duration_muscle_1
float64 packed_valve
uint16 muscle_pressure_0
uint16 muscle_pressure_1
float64 time_step


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



(provide :sr_robot_msgs/JointMuscleValveControllerState "fc22942516cdb4d514558e60d7263d35")


