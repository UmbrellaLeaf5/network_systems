# language: CMake

# Project setup
set(REPO_LANGUAGES CXX)
set(REPO_FOLDER ${CMAKE_CURRENT_LIST_DIR})

get_filename_component(PROJECT_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)
project(${PROJECT_NAME} LANGUAGES ${REPO_LANGUAGES})

# Set C++ settings
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "-Wall -Wextra -pedantic -std=c++23 -O2")

# less speed, more warnings = less potential errors in code
# flags using source: https://codeforces.com/blog/entry/15547?locale=ru
# set(CMAKE_CXX_FLAGS " -Wall -Wextra -pedantic -std=c++23 -O2 -Wfloat-equal -Wconversion -Wlogical-op -Wduplicated-cond")

# Set local vars
set(HEADERS_FORMAT "*.hpp")
set(SOURCES_FORMAT "*.cpp")

set(LIB_NAME "lib")
find_library(${LIB_NAME} ../)

set(LESSON_PREFIX "lesson_")
set(TASK_PREFIX "task_")
set(EXAMPLE_PREFIX "example_")

# Functions

# Copy non-source subproject files to binary folder
function(CopyExtraFiles)
  file(GLOB_RECURSE EXTRA_FILES "${CMAKE_CURRENT_SOURCE_DIR}/*")
  file(GLOB_RECURSE PROJECT_FILES ${SOURCES_FORMAT} ${HEADERS_FORMAT})

  list(REMOVE_ITEM EXTRA_FILES ${PROJECT_FILES})

  file(COPY ${EXTRA_FILES} DESTINATION ${PROJECT_BINARY_DIR})
endfunction()
