import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import ros.videocomponent 1.0

Window {

    // Properties
    property string appTitle : "Ground robot visualization GUI"
    property string appLogo : "qrc:///images/logo.png"
    // Colors
    property string panelColor : "#fcf8e3"
    property string panelTextColor : "#07ABBC"
    property string panelBorderColor : "#07ABBC"

    id: window1
    width: 1024
    height: 768
    visibility: "FullScreen"
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
        id: video_pane
        color: "black"
        width: 640
        height: 480
        anchors.top : headerArea.bottom
        anchors.left : parent.left
        anchors.margins: 15
        ROSVideoComponent {
            // @disable-check M16
            objectName: "videoStream"
            id: videoStream
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
/*
    Canvas {
        id: cameracanvas
        width: 640
        height: 480
        onPaint: {
            var ctx = getContext("2d");
            ctx.fillStyle = Qt.rgba(0, 0, 0, 1);
            ctx.fillRect(0, 0, width, height);
        }
        anchors.top : headerArea.bottom
        anchors.left : parent.left
        anchors.margins: 15
    }

    Canvas {
        id: mapcanvas
        width: 640
        height: 480
        onPaint: {
            var ctx = getContext("2d");
            ctx.fillStyle = Qt.rgba(0, 0, 0, 1);
            ctx.fillRect(0, 0, width, height);
        }
        anchors.top : headerArea.bottom
        anchors.left : cameracanvas.right
        anchors.margins: 15
    }
*/
    /*
    Text{
        objectName: "textJoy"
        text: "aaa"
        anchors.leftMargin: 2
        anchors.left: headerArea.left
        anchors.top : headerArea.bottom
    }
*/

    //ControlPanel{}

    Rectangle{
        id: footerArea
        height: 40
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right:parent.right
        Footer{}
    }


}
