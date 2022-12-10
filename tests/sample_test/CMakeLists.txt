set(TEST_TARGET "sample_test")

file(GLOB_RECURSE TESTS_SRCS "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")

add_executable(${TEST_TARGET} ${TESTS_SRCS})

# Unit Testing
# https://github.com/google/googletest.git
target_link_libraries(
    ${TEST_TARGET}
    PUBLIC 
    gtest_main
)

# Add test Engine Core Tests
add_test(
    NAME  "sample_test"
    COMMAND "sample_test"
) 


