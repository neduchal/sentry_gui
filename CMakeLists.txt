# CMake
cmake_minimum_required(VERSION 2.8.3)
project(sentry_gui)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

# CATKIN
find_package(catkin REQUIRED COMPONENTS
  jackal_msgs
  qt_build
  roscpp
  rospy
  std_msgs
  sensor_msgs
  geometry_msgs
  image_transport
  rviz
  message_generation
  genmsg
  actionlib_msgs
  actionlib
)

add_service_files(
  FILES
  MissionDirectory.srv
)

generate_messages()


set(QML_IMPORT_PATH "${QML_IMPORT_PATH};${CATKIN_GLOBAL_LIB_DESTINATION}" )
set(QML_IMPORT_PATH2 "${QML_IMPORT_PATH};${CATKIN_GLOBAL_LIB_DESTINATION}" )
include_directories(${catkin_INCLUDE_DIRS})
catkin_package(CATKIN_DEPENDS message_runtime)


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

add_executable(gui ${QT_SOURCES} ${QT_RESOURCES_CPP} ${QT_FORMS_HPP} ${QT_MOC_HPP} )

target_link_libraries(gui ${QT_LIBRARIES} ${catkin_LIBRARIES})
target_include_directories(gui PUBLIC include)
install(TARGETS gui RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})
