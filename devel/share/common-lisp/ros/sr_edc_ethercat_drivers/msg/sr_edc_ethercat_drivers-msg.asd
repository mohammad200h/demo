
(cl:in-package :asdf)

(defsystem "sr_edc_ethercat_drivers-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ActuatorInfo" :depends-on ("_package_ActuatorInfo"))
    (:file "_package_ActuatorInfo" :depends-on ("_package"))
    (:file "MotorTrace" :depends-on ("_package_MotorTrace"))
    (:file "_package_MotorTrace" :depends-on ("_package"))
    (:file "MotorTraceSample" :depends-on ("_package_MotorTraceSample"))
    (:file "_package_MotorTraceSample" :depends-on ("_package"))
  ))