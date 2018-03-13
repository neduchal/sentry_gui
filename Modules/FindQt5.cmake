# - Find Qt5
# This module can be used to find Qt5.
# The most important issues are that Qt5 pkgconfig files are installed with PKG_CONFIG_PATH properly
# set, and that Qt5 qmake is available via the system path.
# This module defines a number of key variables and macros.

set(QtPath "~/Qt/5.10.1/gcc_64/")

set(Qt5Core_DIR "${QtPath}lib/cmake/Qt5Core")
set(Qt5_DIR "${QtPath}lib/cmake/Qt5")
set(Qt5Gui_DIR "${QtPath}lib/cmake/Qt5Gui")
set(Qt5Qml_DIR "${QtPath}lib/cmake/Qt5Qml")
set(Qt5Quick_DIR "${QtPath}lib/cmake/Qt5Quick")
set(Qt5Test_DIR "${QtPath}lib/cmake/Qt5Test")
set(Qt5Widgets_DIR "${QtPath}lib/cmake/Qt5Widgets")
set(Qt5Network_DIR "${QtPath}lib/cmake/Qt5Network")
set(Qt5Xml_DIR "${QtPath}lib/cmake/Qt5Xml")
# SET QT3D
set(Qt53DCore_DIR "${QtPath}lib/cmake/Qt53DCore")
set(Qt53DAnimation_DIR "${QtPath}lib/cmake/Qt53DAnimation")
set(Qt53DExtras_DIR "${QtPath}lib/cmake/Qt53DExtras")
set(Qt53DInput_DIR "${QtPath}lib/cmake/Qt53DInput")
set(Qt53DLogic_DIR "${QtPath}lib/cmake/Qt53DLogic")
set(Qt53DQuick_DIR "${QtPath}lib/cmake/Qt53DQuick")
set(Qt53DRender_DIR "${QtPath}lib/cmake/Qt53DRender")
set(Qt53DQuickAnimation_DIR "${QtPath}lib/cmake/Qt53DQuickAnimation")
set(Qt53DQuickExtras_DIR "${QtPath}lib/cmake/Qt53DQuickExtras")
set(Qt53DQuickInput_DIR "${QtPath}lib/cmake/Qt53DQuickInput")
set(Qt53DQuickRender_DIR "${QtPath}lib/cmake/Qt53DQuickRender")
set(Qt53DQuickScene2D_DIR "${QtPath}lib/cmake/Qt53DQuickScene2D")

SET(QT_QMAKE_EXECUTABLE "${QtPath}bin/qmake")

find_package(Qt5Core ${REQUIRED_QT_VERSION} PATHS "${QtPath}lib/cmake" NO_DEFAULT_PATH)
find_package(Qt5DBus ${REQUIRED_QT_VERSION} PATHS "${QtPath}lib/cmake" NO_DEFAULT_PATH)
find_package(Qt5Gui ${REQUIRED_QT_VERSION} PATHS  "${QtPath}lib/cmake" NO_DEFAULT_PATH)
find_package(Qt5Qml ${REQUIRED_QT_VERSION} PATHS "${QtPath}lib/cmake" NO_DEFAULT_PATH)
find_package(Qt5Quick ${REQUIRED_QT_VERSION} PATHS "${QtPath}lib/cmake" NO_DEFAULT_PATH)
find_package(Qt5Test ${REQUIRED_QT_VERSION} PATHS "${QtPath}lib/cmake" NO_DEFAULT_PATH)
find_package(Qt5Widgets ${REQUIRED_QT_VERSION} PATHS "${QtPath}lib/cmake" NO_DEFAULT_PATH)
find_package(Qt5Network ${REQUIRED_QT_VERSION} PATHS "${QtPath}lib/cmake" NO_DEFAULT_PATH)
find_package(Qt5Xml ${REQUIRED_QT_VERSION} PATHS "${QtPath}lib/cmake" NO_DEFAULT_PATH)

# Find Package for 3D
find_package(Qt53DCore ${REQUIRED_QT_VERSION} PATHS "${QtPath}lib/cmake" NO_DEFAULT_PATH)
find_package(Qt53DAnimation ${REQUIRED_QT_VERSION} PATHS "${QtPath}lib/cmake" NO_DEFAULT_PATH)
find_package(Qt53DExtras ${REQUIRED_QT_VERSION} PATHS  "${QtPath}lib/cmake" NO_DEFAULT_PATH)
find_package(Qt53DInput ${REQUIRED_QT_VERSION} PATHS "${QtPath}lib/cmake" NO_DEFAULT_PATH)
find_package(Qt53DLogic ${REQUIRED_QT_VERSION} PATHS "${QtPath}lib/cmake" NO_DEFAULT_PATH)
find_package(Qt53DQuick ${REQUIRED_QT_VERSION} PATHS "${QtPath}lib/cmake" NO_DEFAULT_PATH)
find_package(Qt53DRender ${REQUIRED_QT_VERSION} PATHS "${QtPath}lib/cmake" NO_DEFAULT_PATH)
find_package(Qt53DQuickAnimation ${REQUIRED_QT_VERSION} PATHS "${QtPath}lib/cmake" NO_DEFAULT_PATH)
find_package(Qt53DQuickExtras ${REQUIRED_QT_VERSION} PATHS "${QtPath}lib/cmake" NO_DEFAULT_PATH)
find_package(Qt53DQuickInput ${REQUIRED_QT_VERSION} PATHS "${QtPath}lib/cmake" NO_DEFAULT_PATH)
find_package(Qt53DQuickRender ${REQUIRED_QT_VERSION} PATHS "${QtPath}lib/cmake" NO_DEFAULT_PATH)
find_package(Qt53DQuickScene2D ${REQUIRED_QT_VERSION} PATHS "${QtPath}lib/cmake" NO_DEFAULT_PATH)


# Copy includes and library names into the same style as pkgconfig used for Qt4
set(QT_INCLUDES ${Qt5Core_INCLUDE_DIRS}
                ${Qt5DBus_INCLUDE_DIRS}
                ${Qt5Gui_INCLUDE_DIRS}
                ${Qt5Qml_INCLUDE_DIRS}
                ${Qt5Quick_INCLUDE_DIRS}
                ${Qt5Network_INCLUDE_DIRS}
                ${Qt5Test_INCLUDE_DIRS}
                ${Qt5Widgets_INCLUDE_DIRS}
                ${Qt53DCore_INCLUDE_DIRS}
                ${Qt53DAnimation_INCLUDE_DIRS}
                ${Qt53DExtras_INCLUDE_DIRS}
                ${Qt53DInput_INCLUDE_DIRS}
                ${Qt53DLogic_INCLUDE_DIRS}
                ${Qt53DQuick_INCLUDE_DIRS}
                ${Qt53DRender_INCLUDE_DIRS}
                ${Qt53DQuickAnimation_INCLUDE_DIRS}
                ${Qt53DQuickExtras_INCLUDE_DIRS}
                ${Qt53DQuickInput_INCLUDE_DIRS}
                ${Qt53DQuickRender_INCLUDE_DIRS}
                ${Qt53DQuickScene2D_INCLUDE_DIRS}
                )

set(QT_QTCORE_LIBRARY ${Qt5Core_LIBRARIES})
set(QT_QTDBUS_LIBRARY ${Qt5DBus_LIBRARIES})
set(QT_QTGUI_LIBRARY ${Qt5Gui_LIBRARIES})
set(QT_QTQML_LIBRARY ${Qt5Qml_LIBRARIES})
set(QT_QTQUICK_LIBRARY ${Qt5Quick_LIBRARIES})
set(QT_QTNETWORK_LIBRARY ${Qt5Network_LIBRARIES})
set(QT_QTTEST_LIBRARY ${Qt5Test_LIBRARIES})
set(QT_QTWIDGETS_LIBRARY ${Qt5Widgets_LIBRARIES})
set(QT_QTXML_LIBRARY ${Qt5Xml_LIBRARIES})

# set 3D Libaries
set(QT_QT3DCORE_LIBRARY ${Qt53DCore_LIBRARIES})
set(QT_QT3DANIMATION_LIBRARY ${Qt53DAnimation_LIBRARIES})
set(QT_QT3DEXTRAS_LIBRARY ${Qt53DExtras_LIBRARIES})
set(QT_QT3DINPUT_LIBRARY ${Qt53DInput_LIBRARIES})
set(QT_QT3DLOGIC_LIBRARY ${Qt53DLogic_LIBRARIES})
set(QT_QT3DQUICK_LIBRARY ${Qt53DQuick_LIBRARIES})
set(QT_QT3DRENDER_LIBRARY ${Qt53DRender_LIBRARIES})
set(QT_QT3DQUICKANIMATION_LIBRARY ${Qt53DQuickAnimation_LIBRARIES})
set(QT_QT3DQUICKEXTRAS_LIBRARY ${Qt53DQuickExtras_LIBRARIES})
set(QT_QT3DQUICKINPUT_LIBRARY ${Qt53DQuickInput_LIBRARIES})
set(QT_QT3DQUICKRENDER_LIBRARY ${Qt53DQuickRender_LIBRARIES})
set(QT_QT3DQUICKSCENE2D_LIBRARY ${Qt53DQuickScene2D_LIBRARIES})

set(QT_LIBRARIES ${QT_QTCORE_LIBRARY}
                 ${QT_QTDBUS_LIBRARY}
                 ${QT_QTGUI_LIBRARY}
                 ${QT_QTQML_LIBRARY}
                 ${QT_QTQUICK_LIBRARY}
                 ${QT_QTNETWORK_LIBRARY}
                 ${QT_QTTEST_LIBRARY}
                 ${QT_QTWIDGETS_LIBRARY}
                 ${QT_QTXML_LIBRARY}
                 ${QT_QT3DCORE_LIBRARY}
                 ${QT_QT3DANIMATION_LIBRARY}
                 ${QT_QT3DEXTRAS_LIBRARY}
                 ${QT_QT3DLOGIC_LIBRARY}
                 ${QT_QT3DQUICK_LIBRARY}
                 ${QT_QT3DRENDER_LIBRARY}
                 ${QT_QT3DQUICKANIMATION_LIBRARY}
                 ${QT_QT3DQUICKEXTRAS_LIBRARY}
                 ${QT_QT3DQUICKINPUT_LIBRARY}
                 ${QT_QT3DQUICKRENDER_LIBRARY}
                 ${QT_QT3DQUICKSCENE2D_LIBRARY}
                 )

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



