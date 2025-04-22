# Install script for directory: /home/leah/catkin_ws/src/gtsam/cmake

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
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/leah/catkin_ws/install_isolated/lib/cmake/GTSAMCMakeTools/GTSAMCMakeToolsConfig.cmake;/home/leah/catkin_ws/install_isolated/lib/cmake/GTSAMCMakeTools/Config.cmake.in;/home/leah/catkin_ws/install_isolated/lib/cmake/GTSAMCMakeTools/dllexport.h.in;/home/leah/catkin_ws/install_isolated/lib/cmake/GTSAMCMakeTools/GtsamBuildTypes.cmake;/home/leah/catkin_ws/install_isolated/lib/cmake/GTSAMCMakeTools/GtsamMakeConfigFile.cmake;/home/leah/catkin_ws/install_isolated/lib/cmake/GTSAMCMakeTools/GtsamTesting.cmake;/home/leah/catkin_ws/install_isolated/lib/cmake/GTSAMCMakeTools/GtsamPrinting.cmake;/home/leah/catkin_ws/install_isolated/lib/cmake/GTSAMCMakeTools/FindNumPy.cmake;/home/leah/catkin_ws/install_isolated/lib/cmake/GTSAMCMakeTools/README.html")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/leah/catkin_ws/install_isolated/lib/cmake/GTSAMCMakeTools" TYPE FILE FILES
    "/home/leah/catkin_ws/src/gtsam/cmake/GTSAMCMakeToolsConfig.cmake"
    "/home/leah/catkin_ws/src/gtsam/cmake/Config.cmake.in"
    "/home/leah/catkin_ws/src/gtsam/cmake/dllexport.h.in"
    "/home/leah/catkin_ws/src/gtsam/cmake/GtsamBuildTypes.cmake"
    "/home/leah/catkin_ws/src/gtsam/cmake/GtsamMakeConfigFile.cmake"
    "/home/leah/catkin_ws/src/gtsam/cmake/GtsamTesting.cmake"
    "/home/leah/catkin_ws/src/gtsam/cmake/GtsamPrinting.cmake"
    "/home/leah/catkin_ws/src/gtsam/cmake/FindNumPy.cmake"
    "/home/leah/catkin_ws/src/gtsam/cmake/README.html"
    )
endif()

