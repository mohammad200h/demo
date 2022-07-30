;; Auto-generated. Do not edit!


(when (boundp 'cw3_helper::ChangeCollisionObject)
  (if (not (find-package "CW3_HELPER"))
    (make-package "CW3_HELPER"))
  (shadow 'ChangeCollisionObject (find-package "CW3_HELPER")))
(unless (find-package "CW3_HELPER::CHANGECOLLISIONOBJECT")
  (make-package "CW3_HELPER::CHANGECOLLISIONOBJECT"))
(unless (find-package "CW3_HELPER::CHANGECOLLISIONOBJECTREQUEST")
  (make-package "CW3_HELPER::CHANGECOLLISIONOBJECTREQUEST"))
(unless (find-package "CW3_HELPER::CHANGECOLLISIONOBJECTRESPONSE")
  (make-package "CW3_HELPER::CHANGECOLLISIONOBJECTRESPONSE"))

(in-package "ROS")





(defclass cw3_helper::ChangeCollisionObjectRequest
  :super ros::object
  :slots (_object_name ))

(defmethod cw3_helper::ChangeCollisionObjectRequest
  (:init
   (&key
    ((:object_name __object_name) "")
    )
   (send-super :init)
   (setq _object_name (string __object_name))
   self)
  (:object_name
   (&optional __object_name)
   (if __object_name (setq _object_name __object_name)) _object_name)
  (:serialization-length
   ()
   (+
    ;; string _object_name
    4 (length _object_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _object_name
       (write-long (length _object_name) s) (princ _object_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _object_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _object_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass cw3_helper::ChangeCollisionObjectResponse
  :super ros::object
  :slots (_success ))

(defmethod cw3_helper::ChangeCollisionObjectResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass cw3_helper::ChangeCollisionObject
  :super ros::object
  :slots ())

(setf (get cw3_helper::ChangeCollisionObject :md5sum-) "bc93e0d7ed716275a8d9336d083ffb50")
(setf (get cw3_helper::ChangeCollisionObject :datatype-) "cw3_helper/ChangeCollisionObject")
(setf (get cw3_helper::ChangeCollisionObject :request) cw3_helper::ChangeCollisionObjectRequest)
(setf (get cw3_helper::ChangeCollisionObject :response) cw3_helper::ChangeCollisionObjectResponse)

(defmethod cw3_helper::ChangeCollisionObjectRequest
  (:response () (instance cw3_helper::ChangeCollisionObjectResponse :init)))

(setf (get cw3_helper::ChangeCollisionObjectRequest :md5sum-) "bc93e0d7ed716275a8d9336d083ffb50")
(setf (get cw3_helper::ChangeCollisionObjectRequest :datatype-) "cw3_helper/ChangeCollisionObjectRequest")
(setf (get cw3_helper::ChangeCollisionObjectRequest :definition-)
      "string object_name
---
bool success
")

(setf (get cw3_helper::ChangeCollisionObjectResponse :md5sum-) "bc93e0d7ed716275a8d9336d083ffb50")
(setf (get cw3_helper::ChangeCollisionObjectResponse :datatype-) "cw3_helper/ChangeCollisionObjectResponse")
(setf (get cw3_helper::ChangeCollisionObjectResponse :definition-)
      "string object_name
---
bool success
")



(provide :cw3_helper/ChangeCollisionObject "bc93e0d7ed716275a8d9336d083ffb50")


