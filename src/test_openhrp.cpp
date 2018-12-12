// -*- mode: C++; coding: utf-8-unix; -*-

/**
 * @file  test_openhrp.cpp
 * @brief
 */

#include <hrpUtil/Eigen3d.h>

class test_openhrp {
public:
    hrp::Vector3 rpy;
    hrp::Matrix33 rot;
    test_openhrp() {}
    ~ test_openhrp() {}
    int rpy_from_rot(double* _rot, double* _rpy) {
        rot = Eigen::Map<hrp::Matrix33>(_rot, 3, 3).transpose();
        rpy = hrp::rpyFromRot(rot);
        Eigen::Map<hrp::Vector3>(_rpy, 3) = rpy;
        return 0;
    }
};
