cmake_minimum_required(VERSION 3.16)

project(colin2 LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules
    ${CMAKE_CURRENT_SOURCE_DIR}/../cmake/modules)


set(DOXYFILE_TARGET_SUFFIX colin)
include(UseDoxygen OPTIONAL)


find_package(Clp REQUIRED)
find_package(CoinUtils REQUIRED)
find_package(Cbc REQUIRED)
find_package(Cgl REQUIRED)
find_package(OSI REQUIRED)

if(CLP_LIB_PATH)
link_directories(${CLP_LIB_PATH})
endif(CLP_LIB_PATH)

set(COLIN_COIN_INCLUDE_DIRS
    ${CLP_INCLUDES}
    ${COINUTILS_INCLUDES}
    ${CBC_INCLUDES}
    ${CGL_INCLUDES}
    ${OSI_INCLUDES})

foreach(COLIN_INCLUDE_DIR ${COLIN_COIN_INCLUDE_DIRS})
if(EXISTS "${COLIN_INCLUDE_DIR}/coin")
list(APPEND COLIN_COIN_INCLUDE_DIRS "${COLIN_INCLUDE_DIR}/coin")
endif(EXISTS "${COLIN_INCLUDE_DIR}/coin")
endforeach(COLIN_INCLUDE_DIR)

list(REMOVE_DUPLICATES COLIN_COIN_INCLUDE_DIRS)

if(NOT COLIN_LIBS)
set(COLIN_LIBS
    ${CGL_LIBRARIES}
    ${CBC_LIBRARY}
    ${CBC_SOLVER_LIBRARY}
    ${CLP_LIBRARIES}
    ${COINUTILS_LIBRARIES}
    ${OSI_LIBRARIES}
    ${OSICLP_LIBRARIES})
endif(NOT COLIN_LIBS)

set(colin_build_srcs
    compressionsafescheduler.cpp
    colintotalordertransformer.cpp
    FFSolver.cpp
    FFEvent.cpp
    globals.cpp
    lpscheduler.cpp
    RPGBuilder.cpp
    RPGBuilderAnalysis.cpp
    RPGBuilderEvaluation.cpp
    RPGBuilderNumerics.cpp
    temporalanalysis.cpp
    minimalstate.cpp
    temporalconstraints.cpp
    numericanalysis.cpp
    solver.cpp)

#add_library(ColinCommon STATIC ${colin_build_srcs})
#target_link_libraries(ColinCommon ParsePDDL Inst Cgl Cbc )
#SET_TARGET_PROPERTIES(ColinCommon PROPERTIES COMPILE_FLAGS "-DTOTALORDERSTATES -DPOPF3ANALYSIS")

add_library(colin STATIC  ${colin_build_srcs} solver-clp.cpp)
target_compile_features(colin PUBLIC cxx_std_11)
target_compile_definitions(colin PRIVATE TOTALORDERSTATES POPF3ANALYSIS)
target_compile_options(colin PRIVATE -Wall)
target_include_directories(colin
    PRIVATE
        ${val_SOURCE_DIR}
        ${val_SOURCE_DIR}/parsing
        ${val_BINARY_DIR}
        ${CONCERT_INCLUDES}
        ${GSL_INCLUDES}
        ${COLIN_COIN_INCLUDE_DIRS})
target_link_libraries(colin
    PRIVATE
        Inst
        bz2
        z
        ${COLIN_LIBS})

if(STATIC_COLIN AND CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
target_link_options(colin PRIVATE -static)
endif()

add_executable(colin-planner colinMain.cpp)
target_compile_features(colin-planner PRIVATE cxx_std_11)
target_compile_definitions(colin-planner PRIVATE TOTALORDERSTATES POPF3ANALYSIS)
target_compile_options(colin-planner PRIVATE -Wall)
target_include_directories(colin-planner
    PRIVATE
        ${val_SOURCE_DIR}
        ${val_SOURCE_DIR}/parsing
        ${val_BINARY_DIR}
        ${CONCERT_INCLUDES}
        ${GSL_INCLUDES}
        ${COLIN_COIN_INCLUDE_DIRS})
target_link_libraries(colin-planner
    PRIVATE
        colin
        Inst
        VALCore
        ParsePDDL
        bz2
        z
        ${COLIN_LIBS})

