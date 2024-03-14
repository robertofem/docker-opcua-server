cmake_minimum_required(VERSION 3.20 FATAL_ERROR)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(
  server-opcua
  VERSION
    0.8.0
  LANGUAGES
    CXX C
)

add_subdirectory(src)