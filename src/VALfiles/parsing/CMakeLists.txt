cmake_minimum_required(VERSION 3.16)

project(ParsePDDL LANGUAGES CXX)

find_package(BISON REQUIRED)
find_package(FLEX REQUIRED)

add_custom_command(
       OUTPUT
        ${CMAKE_CURRENT_BINARY_DIR}/lex.yy.cc
       COMMAND
        ${FLEX_EXECUTABLE}
       ARGS
       -+  --outfile=${CMAKE_CURRENT_BINARY_DIR}/lex.yy.cc ${CMAKE_CURRENT_SOURCE_DIR}/pddl+.lex
       DEPENDS
        ${CMAKE_CURRENT_SOURCE_DIR}/pddl+.lex
       VERBATIM
)

add_custom_command(
       OUTPUT
        ${CMAKE_CURRENT_BINARY_DIR}/pddl+.cpp
       COMMAND
        ${BISON_EXECUTABLE}
       ARGS
        ${CMAKE_CURRENT_SOURCE_DIR}/pddl+.yacc -o ${CMAKE_CURRENT_BINARY_DIR}/pddl+.cpp
       DEPENDS
        ${CMAKE_CURRENT_SOURCE_DIR}/pddl+.yacc ${CMAKE_CURRENT_BINARY_DIR}/lex.yy.cc
       COMMAND
        ${CMAKE_CURRENT_SOURCE_DIR}/fixyywrap ${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_SOURCE_DIR}
           VERBATIM
)

set(libParsePDDL_SRCS
      pddl+.cpp ptree.cpp DebugWriteController.cpp
)

add_library(ParsePDDL STATIC ${libParsePDDL_SRCS})
target_compile_features(ParsePDDL PUBLIC cxx_std_11)
target_include_directories(ParsePDDL
        PUBLIC
                ${CMAKE_CURRENT_SOURCE_DIR}
                ${CMAKE_CURRENT_BINARY_DIR})

