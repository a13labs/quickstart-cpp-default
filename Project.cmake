# Set project configuration here

set(APP_NAME "CPP Application")
set(APP_DESCRIPTION "CPP Application Template" )
set(APP_VERSION_MAJOR 0)
set(APP_VERSION_MINOR 0)
set(APP_VERSION_RELEASE 1)
set(APP_SEMANTIC_VERSION "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_RELEASE}")
set(APP_HOMEPAGE_URL "https://example.org")
set(APP_SHORT "app")
set(APP_CPP_STD cxx_std_17)

if(DEFINED ENV{CPP_APP_NO_TESTS})
    set(APP_NO_TESTS 1)
elseif(DEFINED ENV{CPP_APP_NO_TESTS})
    set(APP_NO_TESTS 0)
endif(DEFINED ENV{CPP_APP_NO_TESTS})