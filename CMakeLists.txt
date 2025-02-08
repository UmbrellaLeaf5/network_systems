# language: CMake

cmake_minimum_required(VERSION 3.20)

project(project)
include(settings.cmake)

# Lesson folders
file(GLOB_RECURSE DIRS LIST_DIRECTORIES true ".")

foreach(DIR ${DIRS})
  if(IS_DIRECTORY ${DIR})
    if(${DIR} MATCHES "${PROJECT_NAME}/${LESSON_PREFIX}[^/]*$")
      add_subdirectory(${DIR})
    endif()
  endif()
endforeach()

# Library
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/${LIB_NAME})