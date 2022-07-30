;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::Biotac)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'Biotac (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::BIOTAC")
  (make-package "SR_ROBOT_MSGS::BIOTAC"))

(in-package "ROS")
;;//! \htmlinclude Biotac.msg.html


(defclass sr_robot_msgs::Biotac
  :super ros::object
  :slots (_pac0 _pac1 _pdc _tac _tdc _electrodes ))

(defmethod sr_robot_msgs::Biotac
  (:init
   (&key
    ((:pac0 __pac0) 0)
    ((:pac1 __pac1) 0)
    ((:pdc __pdc) 0)
    ((:tac __tac) 0)
    ((:tdc __tdc) 0)
    ((:electrodes __electrodes) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _pac0 (round __pac0))
   (setq _pac1 (round __pac1))
   (setq _pdc (round __pdc))
   (setq _tac (round __tac))
   (setq _tdc (round __tdc))
   (setq _electrodes __electrodes)
   self)
  (:pac0
   (&optional __pac0)
   (if __pac0 (setq _pac0 __pac0)) _pac0)
  (:pac1
   (&optional __pac1)
   (if __pac1 (setq _pac1 __pac1)) _pac1)
  (:pdc
   (&optional __pdc)
   (if __pdc (setq _pdc __pdc)) _pdc)
  (:tac
   (&optional __tac)
   (if __tac (setq _tac __tac)) _tac)
  (:tdc
   (&optional __tdc)
   (if __tdc (setq _tdc __tdc)) _tdc)
  (:electrodes
   (&optional __electrodes)
   (if __electrodes (setq _electrodes __electrodes)) _electrodes)
  (:serialization-length
   ()
   (+
    ;; int16 _pac0
    2
    ;; int16 _pac1
    2
    ;; int16 _pdc
    2
    ;; int16 _tac
    2
    ;; int16 _tdc
    2
    ;; int16[] _electrodes
    (* 2    (length _electrodes)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _pac0
       (write-word _pac0 s)
     ;; int16 _pac1
       (write-word _pac1 s)
     ;; int16 _pdc
       (write-word _pdc s)
     ;; int16 _tac
       (write-word _tac s)
     ;; int16 _tdc
       (write-word _tdc s)
     ;; int16[] _electrodes
     (write-long (length _electrodes) s)
     (dotimes (i (length _electrodes))
       (write-word (elt _electrodes i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _pac0
     (setq _pac0 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _pac1
     (setq _pac1 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _pdc
     (setq _pdc (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _tac
     (setq _tac (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _tdc
     (setq _tdc (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16[] _electrodes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _electrodes (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _electrodes i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(setf (get sr_robot_msgs::Biotac :md5sum-) "8b5e6266fcf2902d0393e32e002093df")
(setf (get sr_robot_msgs::Biotac :datatype-) "sr_robot_msgs/Biotac")
(setf (get sr_robot_msgs::Biotac :definition-)
      "int16 pac0
int16 pac1
int16 pdc

int16 tac
int16 tdc

int16[] electrodes

")



(provide :sr_robot_msgs/Biotac "8b5e6266fcf2902d0393e32e002093df")


