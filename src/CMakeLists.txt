cmake_minimum_required(VERSION 3.16)

project(buildroot LANGUAGES CXX)

set(DOXYFILE_IN ${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile.in)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_CXX_FLAGS_PROFILE "-g3 -pg -O  -fprofile-arcs")
set(CMAKE_CXX_LINK_FLAGS_PROFILE "-pg")

add_subdirectory(VALfiles)

if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/colin")
	add_subdirectory(colin)
endif()


