# CMake
cmake_minimum_required(VERSION 2.8.3)
project(ground_robot_visualization_gui)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

# CATKIN
find_package(catkin REQUIRED COMPONENTS
  qt_build
  roscpp
  rospy
  std_msgs
  sensor_msgs
  geometry_msgs
  image_transport
)

#set(QTDIR "/opt/qt59/lib")

#set(QML_IMPORT_PATH "/opt/qt59/qml")

set(QML_IMPORT_PATH "${QML_IMPORT_PATH};${CATKIN_GLOBAL_LIB_DESTINATION}" )
set(QML_IMPORT_PATH2 "${QML_IMPORT_PATH};${CATKIN_GLOBAL_LIB_DESTINATION}" )
include_directories(${catkin_INCLUDE_DIRS})
catkin_package()

# Qt
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/Modules)

find_package(Qt5 COMPONENTS Core Gui Qml Quick REQUIRED)

# Sections
file(GLOB QT_RESOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} resources/*.qrc)
file(GLOB_RECURSE QT_MOC RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} FOLLOW_SYMLINKS include/gui/*.hpp)

QT5_ADD_RESOURCES(QT_RESOURCES_CPP ${QT_RESOURCES})
QT5_WRAP_CPP(QT_MOC_HPP ${QT_MOC})


# Sources
file(GLOB_RECURSE QT_SOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} FOLLOW_SYMLINKS src/*.cpp)
#file(GLOB_RECURSE QT_MY_LIBRARIES FOLLOW_SYMLINKS /opt/qt59/lib/*.*)
#file(GLOB_RECURSE QT_MY_INCLUDES FOLLOW_SYMLINKS /opt/qt59/include/*.*)


add_executable(gui ${QT_SOURCES} ${QT_RESOURCES_CPP} ${QT_FORMS_HPP} ${QT_MOC_HPP} )

#qt5_use_modules(gui Quick Core)
MESSAGE(WARNING ${GuiQt5})

#SET(Qt5DBus_DIR "/opt/qt59/lib/cmake/Qt5DBus")
#SET(Qt5Gui_DIR "/opt/qt59/lib/cmake/Qt5Gui")
#SET(Qt5Network_DIR "/opt/qt59/lib/cmake/Qt5Network")
#SET(Qt5QMl_DIR "/opt/qt59/lib/cmake/Qt5Qml")
#SET(Qt5Quick_DIR "/opt/qt59/lib/cmake/Qt5Quick")
#SET(Qt5Test_DIR "/opt/qt59/lib/cmake/Qt5Test")
#SET(Qt5Widgets_DIR "/opt/qt59/lib/cmake/Qt5Widgets")
#SET(Qt5Xml_DIR "/opt/qt59/lib/cmake/Qt5Xml")


target_link_libraries(gui ${QT_LIBRARIES} ${catkin_LIBRARIES})
target_include_directories(gui PUBLIC include)
install(TARGETS gui RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})
