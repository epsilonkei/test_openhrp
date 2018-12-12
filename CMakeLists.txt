project(test_openhrp)

cmake_minimum_required(VERSION 2.4.6)

find_package(catkin COMPONENTS cmake_modules euslisp)
find_package(Boost REQUIRED)

include_directories(${PROJECT_SOURCE_DIR}/src)

if(EXISTS ${PROJECT_SOURCE_DIR}/3rdparty/eigen3)
  message("  -- local eigen detected ${PROJECT_SOURCE_DIR}/3rdparty/eigen3")
  include_directories(${PROJECT_SOURCE_DIR}/3rdparty/eigen3)
else()
  message("  -- find installed eigen")
  find_package(Eigen REQUIRED)
  include_directories(${Eigen_INCLUDE_DIRS})
  include_directories(${EIGEN_INCLUDE_DIRS})
  include_directories(${Boost_INCLUDE_DIR})
endif()

link_directories(${Boost_LIBRARY_DIR})

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake_modules/)

# OpenHRP
find_package(OpenHRP REQUIRED)
include_directories(${OPENHRP_INCLUDE_DIRS})
link_directories(${OPENHRP_LIBRARY_DIRS})
if(UNIX)
    # remove -O2 ... from ${OPENHRP_DEFINITIONS}
    message(STATUS "OPENHRP_DEFINITIONS: ${OPENHRP_DEFINITIONS}")
    message(STATUS "REMOVE -Ox option from OPENHRP_DEFINITIONS, use CMAKE_BUILD_TYPE")
    string(REGEX REPLACE "[ ]+-O[0-9][ ]+" " " OPENHRP_DEFINITIONS "${OPENHRP_DEFINITIONS}")
    message(STATUS "OPENHRP_DEFINITIONS: ${OPENHRP_DEFINITIONS}")
    add_definitions(${OPENHRP_DEFINITIONS})
endif()

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)
set(CMAKE_CXX_FLAGS "-std=c++0x -O2")

set(CMAKE_INSTALL_RPATH "$ORIGIN/../lib:$ORIGIN/../../../lib:${OPENHRP_LIBRARY_DIRS}")

catkin_package()

add_library(test_openhrp SHARED src/impl_test_openhrp.cpp ${Boost_LIBRARIES} ${OPENHRP_LIBRARY_DIRS})
target_link_libraries(test_openhrp ${Boost_LIBRARIES} ${OPENHRP_LIBRARY_DIRS})

execute_process(COMMAND ln -snf ${CATKIN_DEVEL_PREFIX}/lib/libtest_openhrp.so ${PROJECT_SOURCE_DIR}/euslisp/libtest_openhrp.so)

install(TARGETS test_openhrp DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/lib)
