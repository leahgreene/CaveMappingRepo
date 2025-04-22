# Install script for directory: /home/leah/catkin_ws/src/gtsam/gtsam/linear

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam/linear" TYPE FILE FILES
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/AcceleratedPowerMethod.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/BinaryJacobianFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/ConjugateGradientSolver.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/Errors.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/GaussianBayesNet.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/GaussianBayesTree-inl.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/GaussianBayesTree.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/GaussianConditional-inl.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/GaussianConditional.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/GaussianDensity.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/GaussianEliminationTree.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/GaussianFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/GaussianFactorGraph.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/GaussianISAM.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/GaussianJunctionTree.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/HessianFactor-inl.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/HessianFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/IterativeSolver.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/JacobianFactor-inl.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/JacobianFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/KalmanFilter.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/LossFunctions.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/NoiseModel.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/PCGSolver.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/PowerMethod.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/Preconditioner.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/RegularHessianFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/RegularJacobianFactor.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/Sampler.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/Scatter.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/SparseEigen.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/SubgraphBuilder.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/SubgraphPreconditioner.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/SubgraphSolver.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/VectorValues.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/iterative-inl.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/iterative.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/linearAlgorithms-inst.h"
    "/home/leah/catkin_ws/src/gtsam/gtsam/linear/linearExceptions.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam/linear/tests/cmake_install.cmake")

endif()

