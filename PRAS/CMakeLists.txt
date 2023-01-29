cmake_minimum_required(VERSION 3.16)

project(HAS VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_PREFIX_PATH "/opt/Qt/6.4.2-armv8l")
set(Qt6_DIR "/opt/Qt/6.4.2-armv8l")

find_package(Qt6 6.2 COMPONENTS Quick SerialPort WebEngineQuick REQUIRED)

set(CPPSOURCES
    src/togglebuttonviewmodel.cpp
    src/restaurantmodel.cpp
    src/restaurantitemdata.cpp
    src/tvitemdata.cpp
    src/tvmodel.cpp
    src/gamemodel.cpp
    src/gameitemdata.cpp
    src/serialcontroller.cpp
    src/serialportreader.cpp
    src/serialportwriter.cpp
)
set(CPPHEADERS
    inc/togglebuttonviewmodel.h
    inc/utils.h
    inc/restaurantmodel.h
    inc/restaurantitemdata.h
    inc/tvitemdata.h
    inc/tvmodel.h
    inc/gamemodel.h
    inc/gameitemdata.h
    inc/serialcontroller.h
    inc/serialportreader.h
    inc/serialportwriter.h
)


qt_add_executable(appHAS
    main.cpp
    ${CPPSOURCES}
    ${CPPHEADERS}
)

qt_add_qml_module(appHAS
    URI HAS
    VERSION 1.0
    QML_FILES main.qml 
)

set_target_properties(appHAS PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appHAS
    PRIVATE
        Qt6::Quick
        Qt6::WebEngineQuick
        Qt6::SerialPort
    )

install(TARGETS appHAS
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

add_subdirectory(content)
#add_subdirectory(imports)


target_link_libraries(appHAS PRIVATE
    #appDataplugin
    contentplugin
)
