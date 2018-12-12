#!/usr/bin/env roseus

(if (not (find-package "TEST_OPENHRP")) (make-package "TEST_OPENHRP"))
;; (setq *eusrobot-package-name* "TEST_OPENHRP")
(setq test_openhrp::*eusrobot-plugin* (load-foreign (format nil "~A/euslisp/libtest_openhrp.so" (ros::rospack-find "test_openhrp"))))

(In-package "TEST_OPENHRP")
(let* ((lib test_openhrp::*eusrobot-plugin*))
  (defforeign _rpy-from-rot lib "test_rpy_from_rot" (:string :string) :integer)
  )
