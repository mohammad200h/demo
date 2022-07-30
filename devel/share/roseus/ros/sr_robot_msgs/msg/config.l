;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::config)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'config (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::CONFIG")
  (make-package "SR_ROBOT_MSGS::CONFIG"))

(in-package "ROS")
;;//! \htmlinclude config.msg.html


(defclass sr_robot_msgs::config
  :super ros::object
  :slots (_node_name _list_of_parameters _length_of_list ))

(defmethod sr_robot_msgs::config
  (:init
   (&key
    ((:node_name __node_name) "")
    ((:list_of_parameters __list_of_parameters) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:length_of_list __length_of_list) 0)
    )
   (send-super :init)
   (setq _node_name (string __node_name))
   (setq _list_of_parameters __list_of_parameters)
   (setq _length_of_list (round __length_of_list))
   self)
  (:node_name
   (&optional __node_name)
   (if __node_name (setq _node_name __node_name)) _node_name)
  (:list_of_parameters
   (&optional __list_of_parameters)
   (if __list_of_parameters (setq _list_of_parameters __list_of_parameters)) _list_of_parameters)
  (:length_of_list
   (&optional __length_of_list)
   (if __length_of_list (setq _length_of_list __length_of_list)) _length_of_list)
  (:serialization-length
   ()
   (+
    ;; string _node_name
    4 (length _node_name)
    ;; string[] _list_of_parameters
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _list_of_parameters)) 4
    ;; uint8 _length_of_list
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _node_name
       (write-long (length _node_name) s) (princ _node_name s)
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
   ;; string _node_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _node_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
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

(setf (get sr_robot_msgs::config :md5sum-) "aad3efafb735fbac1153457b0e7c6e24")
(setf (get sr_robot_msgs::config :datatype-) "sr_robot_msgs/config")
(setf (get sr_robot_msgs::config :definition-)
      "# modify the config of a node
# e.g. change the transmission rate
string   node_name
string[] list_of_parameters
uint8    length_of_list

")



(provide :sr_robot_msgs/config "aad3efafb735fbac1153457b0e7c6e24")


