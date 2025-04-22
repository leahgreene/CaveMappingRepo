# Install script for directory: /home/leah/catkin_ws/src/gtsam/gtsam_unstable

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam_unstable" TYPE FILE FILES "/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam_unstable/dllexport.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgtsam_unstable.so.4.2.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgtsam_unstable.so.4"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam_unstable/libgtsam_unstable.so.4.2.0"
    "/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam_unstable/libgtsam_unstable.so.4"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgtsam_unstable.so.4.2.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgtsam_unstable.so.4"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam:/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam/3rdparty/metis/libmetis:"
           NEW_RPATH "")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgtsam_unstable.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgtsam_unstable.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgtsam_unstable.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam_unstable/libgtsam_unstable.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgtsam_unstable.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgtsam_unstable.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgtsam_unstable.so"
         OLD_RPATH "/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam:/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam/3rdparty/metis/libmetis:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgtsam_unstable.so")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam_unstable/base/cmake_install.cmake")
  include("/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam_unstable/geometry/cmake_install.cmake")
  include("/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam_unstable/linear/cmake_install.cmake")
  include("/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam_unstable/discrete/cmake_install.cmake")
  include("/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam_unstable/dynamics/cmake_install.cmake")
  include("/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam_unstable/nonlinear/cmake_install.cmake")
  include("/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam_unstable/slam/cmake_install.cmake")
  include("/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam_unstable/partition/cmake_install.cmake")
  include("/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam_unstable/examples/cmake_install.cmake")
  include("/home/leah/catkin_ws/build_isolated/gtsam/install/gtsam_unstable/timing/cmake_install.cmake")

endif()

