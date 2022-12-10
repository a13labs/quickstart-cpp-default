set(CPP_APP_PRJ "${APP_SHORT}_main")

# Add all source files recursively
FILE(GLOB_RECURSE CPP_APP_SRCS "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")
FILE(GLOB_RECURSE CPP_APP_HDRS "${CMAKE_CURRENT_SOURCE_DIR}/*.hpp")

# Add executable
add_executable(
  ${CPP_APP_PRJ} 
  ${CPP_APP_SRCS} 
  ${CPP_APP_HDRS}
)

target_compile_features(
  ${CPP_APP_PRJ} PUBLIC ${APP_CPP_STD}
)

install(
  TARGETS ${CPP_APP_PRJ}
  RUNTIME 
  DESTINATION ${CMAKE_INSTALL_PREFIX}
  CONFIGURATIONS All
)
