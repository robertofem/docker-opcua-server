find_package(open62541 1.3.6 REQUIRED)

add_executable(${PROJECT_NAME})

target_sources(
  ${PROJECT_NAME}
  PRIVATE
    server.cpp
)

# Enable all the warnings
target_compile_options(${PROJECT_NAME}
  PRIVATE
    "-Wall" "-pedantic" "-Wextra"
)

target_include_directories(
  ${PROJECT_NAME}
  PUBLIC
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>
)

target_link_libraries(
  ${PROJECT_NAME}
  PUBLIC
    open62541::open62541
)

target_compile_features(
  ${PROJECT_NAME}
  PUBLIC
    cxx_std_17
)