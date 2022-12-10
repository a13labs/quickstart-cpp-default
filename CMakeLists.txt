cmake_minimum_required(VERSION 3.5)

set(APP_NAME "CPP Application")
set(APP_DESCRIPTION "CPP Application Template" )
set(APP_VERSION_MAJOR 0)
set(APP_VERSION_MINOR 0)
set(APP_VERSION_RELEASE 1)
set(APP_SEMANTIC_VERSION "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_RELEASE}")
set(APP_HOMEPAGE_URL "https://example.org")

project(
    CPP_APP
    VERSION ${APP_VERSION_MAJOR}.${APP_VERSION_MINOR}.${APP_VERSION_RELEASE}
    DESCRIPTION ${APP_DESCRIPTION}
    HOMEPAGE_URL ${APP_HOMEPAGE_URL}
    LANGUAGES CXX C
)

if("${CMAKE_BUILD_TYPE}" STREQUAL "Debug")
    add_definitions(-DCPP_APP_DEBUG)
endif()

# Support both 32 and 64 bit builds
if (${CMAKE_SIZEOF_VOID_P} MATCHES 8)
    set(BUILD_ARCH "x64")
else ()
    set(BUILD_ARCH "x86")
endif ()

# Platform specific configuration
if(WIN32)
    add_definitions(-DCPP_APP_PLATFORM_WINDOWS)
elseif (UNIX)
    add_definitions(-DCPP_APP_PLATFORM_LINUX)
endif(WIN32)

if(CMAKE_COMPILER_IS_GNUCXX)
    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror")
    # POSIX Threads
find_package(Threads REQUIRED)
else()
    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -W3")
endif()

# Specify build paths
set(PROJECT_OUTPUT_DIR "${PROJECT_SOURCE_DIR}/output")
file(MAKE_DIRECTORY ${PROJECT_OUTPUT_DIR})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${PROJECT_OUTPUT_DIR}/lib")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PROJECT_OUTPUT_DIR}/lib")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_OUTPUT_DIR}/bin")
set(CMAKE_INSTALL_PREFIX "${PROJECT_OUTPUT_DIR}/dist")

# Activate Unit Testing
if(NOT DEFINED ENV{CPP_APP_NO_TESTS})
    add_definitions(-DCPP_APP_TESTS)
endif()

# Pass version variables to Application
configure_file(config.h.in config.h @ONLY)

# Allow config.h to be visible
include_directories(${CMAKE_CURRENT_BINARY_DIR})

# Application/Libraries Source
add_subdirectory(src)

# Unit Testing
# https://github.com/google/googletest.git
if(NOT DEFINED ENV{CPP_APP_NO_TESTS})
    include(3rdparty/CMakeLists.googletest.txt)
    enable_testing()
    include(Dart)
    add_subdirectory(tests)
endif() 

# Debug CMake Vars, uncomment to show CMake vars
# get_cmake_property(_variableNames VARIABLES)
# list (SORT _variableNames)
# foreach (_variableName ${_variableNames})
#     message(STATUS "${_variableName}=${${_variableName}}")
# endforeach()