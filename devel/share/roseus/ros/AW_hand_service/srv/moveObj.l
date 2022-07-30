;; Auto-generated. Do not edit!


(when (boundp 'AW_hand_service::moveObj)
  (if (not (find-package "AW_HAND_SERVICE"))
    (make-package "AW_HAND_SERVICE"))
  (shadow 'moveObj (find-package "AW_HAND_SERVICE")))
(unless (find-package "AW_HAND_SERVICE::MOVEOBJ")
  (make-package "AW_HAND_SERVICE::MOVEOBJ"))
(unless (find-package "AW_HAND_SERVICE::MOVEOBJREQUEST")
  (make-package "AW_HAND_SERVICE::MOVEOBJREQUEST"))
(unless (find-package "AW_HAND_SERVICE::MOVEOBJRESPONSE")
  (make-package "AW_HAND_SERVICE::MOVEOBJRESPONSE"))

(in-package "ROS")





(defclass AW_hand_service::moveObjRequest
  :super ros::object
  :slots (_x _y _z ))

(defmethod AW_hand_service::moveObjRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass AW_hand_service::moveObjResponse
  :super ros::object
  :slots (_objMoved ))

(defmethod AW_hand_service::moveObjResponse
  (:init
   (&key
    ((:objMoved __objMoved) nil)
    )
   (send-super :init)
   (setq _objMoved __objMoved)
   self)
  (:objMoved
   (&optional __objMoved)
   (if __objMoved (setq _objMoved __objMoved)) _objMoved)
  (:serialization-length
   ()
   (+
    ;; bool _objMoved
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _objMoved
       (if _objMoved (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _objMoved
     (setq _objMoved (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass AW_hand_service::moveObj
  :super ros::object
  :slots ())

(setf (get AW_hand_service::moveObj :md5sum-) "e273575340e93981085e010f5e57043f")
(setf (get AW_hand_service::moveObj :datatype-) "AW_hand_service/moveObj")
(setf (get AW_hand_service::moveObj :request) AW_hand_service::moveObjRequest)
(setf (get AW_hand_service::moveObj :response) AW_hand_service::moveObjResponse)

(defmethod AW_hand_service::moveObjRequest
  (:response () (instance AW_hand_service::moveObjResponse :init)))

(setf (get AW_hand_service::moveObjRequest :md5sum-) "e273575340e93981085e010f5e57043f")
(setf (get AW_hand_service::moveObjRequest :datatype-) "AW_hand_service/moveObjRequest")
(setf (get AW_hand_service::moveObjRequest :definition-)
      "float64 x
float64 y
float64 z
---
bool objMoved

")

(setf (get AW_hand_service::moveObjResponse :md5sum-) "e273575340e93981085e010f5e57043f")
(setf (get AW_hand_service::moveObjResponse :datatype-) "AW_hand_service/moveObjResponse")
(setf (get AW_hand_service::moveObjResponse :definition-)
      "float64 x
float64 y
float64 z
---
bool objMoved

")



(provide :AW_hand_service/moveObj "e273575340e93981085e010f5e57043f")


