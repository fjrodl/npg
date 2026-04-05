cmake_minimum_required(VERSION 3.16)

project(val LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_SOURCE_DIR}/..
        ${CMAKE_CURRENT_SOURCE_DIR}/../cmake/modules)

set(DOXYFILE_TARGET_SUFFIX val)
include(UseDoxygen OPTIONAL)

add_subdirectory(parsing)

set(libInst_SRCS
      SimpleEval.cpp
      FastEnvironment.cpp instantiation.cpp
      typecheck.cpp TypedAnalyser.cpp FuncAnalysis.cpp
      TIM.cpp TimSupport.cpp TypeStripWC.cpp
)

add_library(Inst STATIC ${libInst_SRCS})
target_compile_features(Inst PUBLIC cxx_std_11)
target_include_directories(Inst
        PUBLIC
                ${CMAKE_CURRENT_SOURCE_DIR}
                ${CMAKE_CURRENT_BINARY_DIR}
                ${ParsePDDL_SOURCE_DIR})

set(validate_SRCS
     Action.cpp Proposition.cpp FuncExp.cpp typecheck.cpp main.cpp
     Validator.cpp RepairAdvice.cpp LaTeXSupport.cpp State.cpp Plan.cpp Ownership.cpp
     Environment.cpp Polynomial.cpp Utils.cpp
     TrajectoryConstraints.cpp RobustAnalyse.cpp random.cpp Events.cpp PrettyPrinter.cpp)

set(VALCore_SRCS
     Action.cpp Proposition.cpp FuncExp.cpp typecheck.cpp
     Validator.cpp RepairAdvice.cpp LaTeXSupport.cpp State.cpp Plan.cpp Ownership.cpp
     Environment.cpp Polynomial.cpp Utils.cpp
     TrajectoryConstraints.cpp RobustAnalyse.cpp random.cpp Events.cpp PrettyPrinter.cpp)

add_library(VALCore STATIC ${VALCore_SRCS})
target_compile_features(VALCore PUBLIC cxx_std_11)
target_include_directories(VALCore
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_BINARY_DIR}
        ${ParsePDDL_SOURCE_DIR})

add_executable(validate main.cpp)
target_compile_features(validate PRIVATE cxx_std_11)
target_include_directories(validate
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_BINARY_DIR}
        ${ParsePDDL_SOURCE_DIR})

target_link_libraries(validate
        PRIVATE ParsePDDL VALCore
)

set(parser_SRCS
     parse.cpp
)

add_executable(parser ${parser_SRCS})
target_compile_features(parser PRIVATE cxx_std_11)
target_include_directories(parser
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_BINARY_DIR}
        ${ParsePDDL_SOURCE_DIR})

target_link_libraries(parser
        PRIVATE ParsePDDL
)


