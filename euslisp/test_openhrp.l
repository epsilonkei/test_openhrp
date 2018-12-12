#!/usr/bin/env roseus

(if (not (find-package "TEST_OPENHRP")) (make-package "TEST_OPENHRP"))
;; (if (not (find-package "EUS_ROBOT_PBODY")) (make-package "EUS_ROBOT_PBODY"))
;; (if (not (find-package "EUS_ROBOT")) (make-package "EUS_ROBOT"))

(require "package://test_openhrp/euslisp/cpplib_test_openhrp.l")

(defvar test_openhrp::*rpy* (instantiate float-vector 3))
(defvar test_openhrp::*rot* (unit-matrix 3))

(defun test_openhrp::rpy-from-rot
    (&key (rot (unit-matrix 3)) (rpy (instantiate float-vector 3)))
  (test_openhrp::_rpy-from-rot rot rpy)
  )

(warning-message 1 "~%[test_openhrp] test_openhrp::rpy-from-rot~%")
