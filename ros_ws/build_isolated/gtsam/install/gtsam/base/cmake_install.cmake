# Install script for directory: /home/leah/catkin_ws/src/gtsam/gtsam/base

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/leah/catkin_ws/install_isolated")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam/base" TYPE FILE FILES
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/ConcurrentMap.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/DSFMap.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/DSFVector.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/FastDefaultAllocator.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/FastList.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/FastMap.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/FastSet.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/FastVector.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/GenericValue.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/Group.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/Lie.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/Manifold.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/Matrix.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/MatrixSerialization.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/OptionalJacobian.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/ProductLieGroup.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/SymmetricBlockMatrix.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/Testable.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/TestableAssertions.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/ThreadsafeException.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/Value.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/Vector.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/VectorSerialization.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/VectorSpace.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/VerticalBlockMatrix.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/WeightedSampler.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/chartTesting.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/cholesky.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/concepts.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/debug.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/lieProxies.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/make_shared.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/numericalDerivative.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/serialization.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/serializationTestHelpers.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/testLie.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/timing.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/treeTraversal-inst.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/types.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/utilities.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam/base/treeTraversal" TYPE FILE FILES
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/treeTraversal/parallelTraversalTasks.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/base/treeTraversal/statistics.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam/base/tests/cmake_install.cmake")

endif()

