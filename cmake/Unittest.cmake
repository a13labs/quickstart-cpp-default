function(ListTests RESULT CURDIR)
  file(GLOB CHILDREN RELATIVE ${CURDIR} ${CURDIR}/test\_*)
  message(STATUS "Searching for tests in '${CURDIR}'")
  set(UNITTESTS "")
  foreach(child ${CHILDREN})
    if(IS_DIRECTORY ${CURDIR}/${child})
      list(APPEND UNITTESTS ${child})
    endif()
  endforeach()
  set(${RESULT} ${UNITTESTS} PARENT_SCOPE)
endfunction()

function(GenerateUnitTest UNITTEST)

    if(NOT IS_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/${UNITTEST}")
      message(FATAL_ERROR "Test does not exists '${UNITTEST}'")
    endif()

    message(STATUS "Adding test '${UNITTEST}'")
    file(GLOB_RECURSE TEST_SRCS "${CMAKE_CURRENT_SOURCE_DIR}/${UNITTEST}/*.cpp")
    file(GLOB_RECURSE TEST_HDRS "${CMAKE_CURRENT_SOURCE_DIR}/${UNITTEST}/*.hpp")
    
    add_executable(
      ${UNITTEST} 
      ${TEST_SRCS}
      ${TEST_HDRS} 
    )
    
    # Unit Testing
    # https://github.com/google/googletest.git
    target_link_libraries(
        ${UNITTEST}
        PUBLIC 
        gtest_main
    )
    
    add_test(
        NAME  "${UNITTEST}"
        COMMAND "${UNITTEST}"
    ) 

endfunction(GenerateUnitTest)
