# Install script for directory: /home/leah/catkin_ws/src/gtsam/gtsam/slam

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam/slam" TYPE FILE FILES
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/AntiFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/BearingFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/BearingRangeFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/BetweenFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/BoundingConstraint.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/EssentialMatrixConstraint.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/EssentialMatrixFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/FrobeniusFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/GeneralSFMFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/InitializePose.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/InitializePose3.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/JacobianFactorQ.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/JacobianFactorQR.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/JacobianFactorSVD.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/KarcherMeanFactor-inl.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/KarcherMeanFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/OrientedPlane3Factor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/PoseRotationPrior.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/PoseTranslationPrior.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/PriorFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/ProjectionFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/RangeFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/ReferenceFrameFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/RegularImplicitSchurFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/RotateFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/SmartFactorBase.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/SmartFactorParams.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/SmartProjectionFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/SmartProjectionPoseFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/SmartProjectionRigFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/StereoFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/TriangulationFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/dataset.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/expressions.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/slam/lago.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam/slam/tests/cmake_install.cmake")

endif()

