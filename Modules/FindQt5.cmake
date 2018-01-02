# - Find Qt5
# This module can be used to find Qt5.
# The most important issues are that Qt5 pkgconfig files are installed with PKG_CONFIG_PATH properly
# set, and that Qt5 qmake is available via the system path.
# This module defines a number of key variables and macros.

set(Qt5Core_DIR "/opt/qt59/lib/cmake/Qt5Core")
set(Qt5_DIR "/opt/qt59/lib/cmake/Qt5")
SET(QT_QMAKE_EXECUTABLE "/opt/qt59/bin/qmake")

find_package(Qt5Core ${REQUIRED_QT_VERSION} PATHS "/opt/qt59/lib/cmake" NO_DEFAULT_PATH)
find_package(Qt5DBus ${REQUIRED_QT_VERSION} PATHS "/opt/qt59/lib/cmake" NO_DEFAULT_PATH)
find_package(Qt5Gui ${REQUIRED_QT_VERSION} PATHS "/opt/qt59/lib/cmake" NO_DEFAULT_PATH)
find_package(Qt5Qml ${REQUIRED_QT_VERSION} PATHS "/opt/qt59/lib/cmake" NO_DEFAULT_PATH)
find_package(Qt5Quick ${REQUIRED_QT_VERSION} PATHS "/opt/qt59/lib/cmake" NO_DEFAULT_PATH)
find_package(Qt5Test ${REQUIRED_QT_VERSION} PATHS "/opt/qt59/lib/cmake" NO_DEFAULT_PATH)
find_package(Qt5Widgets ${REQUIRED_QT_VERSION} PATHS "/opt/qt59/lib/cmake" NO_DEFAULT_PATH)
find_package(Qt5Network ${REQUIRED_QT_VERSION} PATHS "/opt/qt59/lib/cmake" NO_DEFAULT_PATH)
find_package(Qt5Xml ${REQUIRED_QT_VERSION} PATHS "/opt/qt59/lib/cmake" NO_DEFAULT_PATH)

# Copy includes and library names into the same style as pkgconfig used for Qt4
set(QT_INCLUDES ${Qt5Core_INCLUDE_DIRS} ${Qt5DBus_INCLUDE_DIRS} ${Qt5Gui_INCLUDE_DIRS} ${Qt5Qml_INCLUDE_DIRS} ${Qt5Quick_INCLUDE_DIRS} ${Qt5Network_INCLUDE_DIRS} ${Qt5Test_INCLUDE_DIRS} ${Qt5Widgets_INCLUDE_DIRS})

set(QT_QTCORE_LIBRARY ${Qt5Core_LIBRARIES})
set(QT_QTDBUS_LIBRARY ${Qt5DBus_LIBRARIES})
set(QT_QTGUI_LIBRARY ${Qt5Gui_LIBRARIES})
set(QT_QTQML_LIBRARY ${Qt5Qml_LIBRARIES})
set(QT_QTQUICK_LIBRARY ${Qt5Quick_LIBRARIES})
set(QT_QTNETWORK_LIBRARY ${Qt5Network_LIBRARIES})
set(QT_QTTEST_LIBRARY ${Qt5Test_LIBRARIES})
set(QT_QTWIDGETS_LIBRARY ${Qt5Widgets_LIBRARIES})
set(QT_QTXML_LIBRARY ${Qt5Xml_LIBRARIES})

set(QT_LIBRARIES ${QT_QTCORE_LIBRARY} ${QT_QTDBUS_LIBRARY} ${QT_QTGUI_LIBRARY} ${QT_QTQML_LIBRARY} ${QT_QTQUICK_LIBRARY} ${QT_QTNETWORK_LIBRARY} ${QT_QTTEST_LIBRARY} ${QT_QTWIDGETS_LIBRARY} ${QT_QTXML_LIBRARY})

SET(QT_VERSION_MAJOR ${Qt5Core_VERSION_MAJOR})
SET(QT_VERSION_MINOR ${Qt5Core_VERSION_MINOR})
SET(QT_VERSION_PATCH ${Qt5Core_VERSION_PATCH})
SET(QT_VERSION ${Qt5Core_VERSION})

GET_PROPERTY(QT_QMAKE_EXECUTABLE TARGET ${Qt5Core_QMAKE_EXECUTABLE} PROPERTY IMPORTED_LOCATION)

IF(NOT QT_INCLUDE_DIR)
  EXEC_PROGRAM(${QT_QMAKE_EXECUTABLE} ARGS "-query QT_INSTALL_HEADERS" OUTPUT_VARIABLE QTHEADERS)
  SET(QT_INCLUDE_DIR ${QTHEADERS} CACHE INTERNAL "" FORCE)
ENDIF()

IF(NOT QT_LIBRARY_DIR)
  EXEC_PROGRAM(${QT_QMAKE_EXECUTABLE} ARGS "-query QT_INSTALL_LIBS" OUTPUT_VARIABLE QTLIBS)
  SET(QT_LIBRARY_DIR ${QTLIBS} CACHE INTERNAL "" FORCE)

ENDIF()

IF(NOT QT_BINARY_DIR)
  EXEC_PROGRAM(${QT_QMAKE_EXECUTABLE} ARGS "-query QT_INSTALL_BINS" OUTPUT_VARIABLE QTBINS)
  SET(QT_BINARY_DIR ${QTBINS} CACHE INTERNAL "" FORCE)
ENDIF()

IF(NOT QT_DOC_DIR)
  EXEC_PROGRAM(${QT_QMAKE_EXECUTABLE} ARGS "-query QT_INSTALL_DOCS" OUTPUT_VARIABLE QTDOCS)
  SET(QT_DOC_DIR ${QTDOCS} CACHE INTERNAL "" FORCE)
ENDIF()

IF(NOT QT_MOC_EXECUTABLE)
  FIND_PROGRAM(QT_MOC_EXECUTABLE NAMES moc moc5 moc-qt5 PATHS ${QT_BINARY_DIR}
               NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
ENDIF()

MARK_AS_ADVANCED(QT_INCLUDES QT_INCLUDE_DIR
                 QT_LIBRARIES QT_LIBRARY_DIR
                 QT_BINARY_DIR
                 QT_DOC_DIR
                 QT_QMAKE_EXECUTABLE_FINDQT QT_QMAKE_EXECUTABLE QT_MOC_EXECUTABLE)

# Invokes pkgconfig, cleans up the result and sets variables
EXECUTE_PROCESS(COMMAND ${PKG_CONFIG_EXECUTABLE} --variable qt_config Qt5Core
    OUTPUT_VARIABLE _pkgconfig_flags
    RESULT_VARIABLE _pkgconfig_failed)
STRING(REPLACE " " ";" QT_CONFIG_FLAGS "${_pkgconfig_flags}")

INCLUDE(Qt5Macros)

SET(QT_FOUND TRUE)
SET(QT5_FOUND TRUE)



