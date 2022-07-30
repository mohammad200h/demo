
(cl:in-package :asdf)

(defsystem "AW_hand_service-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "moveObj" :depends-on ("_package_moveObj"))
    (:file "_package_moveObj" :depends-on ("_package"))
    (:file "moveRobot" :depends-on ("_package_moveRobot"))
    (:file "_package_moveRobot" :depends-on ("_package"))
  ))