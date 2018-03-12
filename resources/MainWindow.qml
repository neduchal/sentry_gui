import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import ros.videocomponent 1.0
//import ros.mapcomponent 1.0


Window {

    // Properties
    property string appTitle : "Ground robot visualization GUI"
    property string appLogo : "qrc:///images/logo.png"
    // Colors
    property string panelColor : "#fcf8e3"
    property string panelTextColor : "#07ABBC"
    property string panelBorderColor : "#07ABBC"

    id: window1
    width: 1440
    height: 900
    //visibility: "FullScreen"    
    visible: true

    Rectangle{
        id: headerArea
        height: 100
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right:parent.right
        Header{
        }
    }

    Rectangle {
        id: camera_panel
        color: "black"
        width: 640
        height: 480
        anchors.top : headerArea.bottom
        anchors.left : parent.left
        anchors.margins: 15
        ROSVideoComponent {
            // @disable-check M16
            objectName: "cameraStream"
            id: cameraStream
            // @disable-check M16`
            anchors.bottom: parent.bottom
            // @disable-check M16
            anchors.bottomMargin: 0
            // @disable-check M16
            anchors.top: parent.top
            // @disable-check M16
            anchors.left: parent.left
            // @disable-check M16
            anchors.right: parent.right
            // @disable-check M16
            //topic: "/wide_stereo/left/image_raw"
        }
    }

    Rectangle {
        id: thermo_panel
        color: "black"
        width: 320
        height: 240
        anchors.top : camera_panel.bottom
        anchors.left : camera_panel.left
        anchors.topMargin: 15
        ROSVideoComponent {
            // @disable-check M16
            objectName: "thermoStream"
            id: thermoStream
            // @disable-check M16`
            anchors.bottom: parent.bottom
            // @disable-check M16
            anchors.bottomMargin: 0
            // @disable-check M16
            anchors.top: parent.top
            // @disable-check M16
            anchors.left: parent.left
            // @disable-check M16
            anchors.right: parent.right
            // @disable-check M16
            //topic: "/wide_stereo/left/image_raw"
        }
    }



    Rectangle {
        id: map_panel
        color: "gray"
        width: 700
        height: 700
        anchors.top : headerArea.bottom
        anchors.left : camera_panel.right
        anchors.margins: 15
        ROSVideoComponent {
            // @disable-check M16
            objectName: "mapStream"
            id: mapStream
            width: parent.width
            height: parent.height
            // @disable-check M16`
            //anchors.bottom: parent.bottom
            // @disable-check M16
            //anchors.bottomMargin: 0
            // @disable-check M16
            anchors.top: parent.top
            // @disable-check M16
            anchors.left: parent.left
            // @disable-check M16
            //anchors.right: parent.right
            // @disable-check M16
            //topic: "/wide_stereo/left/image_raw"
        }
    }

    Button{
        id: zoomPlus
        width: 100
        height: 50;
        text: "+"
        onClicked:  _zoomClass.zoomPlus()
        anchors.top : map_panel.top
        anchors.right : map_panel.right
        anchors.margins: 5
    }

    Button{
        id: zoomMinus
        width: 100
        height: 50;
        text: "-"
        onClicked:  _zoomClass.zoomMinus()
        anchors.top : map_panel.top
        anchors.right : zoomPlus.left
        anchors.margins: 5
    }

    ControlPanel{}

    Rectangle{
        id: footerArea
        height: 40
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right:parent.right
        Footer{}
    }


}
