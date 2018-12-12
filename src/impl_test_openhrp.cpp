#include <boost/shared_ptr.hpp>
#include "test_openhrp.cpp"

boost::shared_ptr<test_openhrp> toh(new test_openhrp());

extern "C" {
  int test_rpy_from_rot(double* rot, double* rpy) { toh->rpy_from_rot(rot, rpy); return 0; }
};
