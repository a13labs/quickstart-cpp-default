function(ExternalCMakeGitDep PKG_NAME)

    set (PKG_FILE "3rdparty/${PKG_NAME}.cmake")
    set (PKG_LOCAL_FOLDER "${PKG_NAME}-download")
    set (PKG_WORK_DIR "${CMAKE_CURRENT_BINARY_DIR}/${PKG_LOCAL_FOLDER}")

    if(NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/${PKG_FILE}")
        message(FATAL_ERROR "Package configuration ${PKG_FILE} does not exists")
    endif()

    # Download and unpack package at configure time
    configure_file(
        ${PKG_FILE}
        ${PKG_LOCAL_FOLDER}/CMakeLists.txt
    )

    execute_process(
        COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" . 
        RESULT_VARIABLE result
        WORKING_DIRECTORY ${PKG_WORK_DIR}
    )

    if(result)
        message(FATAL_ERROR "CMake step for package ${PKG_NAME} failed: ${result}")
    endif()

    execute_process(
        COMMAND ${CMAKE_COMMAND} --build . 
        RESULT_VARIABLE result
        WORKING_DIRECTORY ${PKG_WORK_DIR}
    )

    if(result)
        message(FATAL_ERROR "Build step for ${PKG_NAME} failed: ${result}")
    endif()


    add_subdirectory(
        ${CMAKE_CURRENT_BINARY_DIR}/${PKG_NAME}-src
        ${CMAKE_CURRENT_BINARY_DIR}/${PKG_NAME}-build
        EXCLUDE_FROM_ALL
    )

endfunction(ExternalCMakeGitDep)
