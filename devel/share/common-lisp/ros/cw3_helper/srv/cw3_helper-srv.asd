
(cl:in-package :asdf)

(defsystem "cw3_helper-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ChangeCollisionObject" :depends-on ("_package_ChangeCollisionObject"))
    (:file "_package_ChangeCollisionObject" :depends-on ("_package"))
  ))