cmake_minimum_required(VERSION 3.10)

# Project Name
project(OpenGL-Template)

# build type (Debug/Release)
set(CMAKE_BUILD_TYPE Debug)

set(CMAKE_CXX_FLAGS "${CMAKE_CSS_FLAGS} -Wall -Werror -std=c++14")
set (source_dir "${PROJECT_SOURCE_DIR}/src/")
file (GLOB source_files "${source_dir}/*.cpp")


# defines output directories
set (FullOutputDir "${CMAKE_SOURCE_DIR}/bin/${CMAKE_SYSTEM_NAME}/${CMAKE_BUILD_TYPE}")
set (CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${FullOutputDir}/static libs")
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY "${FullOutputDir}")
set (CMAKE_RUNTIME_OUTPUT_DIRECTORY "${FullOutputDir}")


# add_library(log SHARED "./src/log.cpp") 
# adds dynamic lib (compiles files to dynamic lib -> ".dll" on windows; ".so" on linux), needs to be specified

add_executable(OpenGL-Template ${source_files})

# links header files from ./inc directory
target_include_directories(OpenGL-Template PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/inc)

#####

# C++ standard settigns
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Find GLFW & GLEW
find_package(PkgConfig REQUIRED)
pkg_search_module(GLFW REQUIRED glfw3)
pkg_search_module(GLEW REQUIRED glew)

# OpenGL headers and libraries
include_directories(${GLFW_INCLUDE_DIRS} ${GLEW_INCLUDE_DIRS})
target_link_libraries(OpenGL-Template ${GLFW_LIBRARIES} ${GLEW_LIBRARIES} ${CMAKE_DL_LIBS})