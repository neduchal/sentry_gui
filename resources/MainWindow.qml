import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {
    id: window1
    width: 1024
    height: 768
    visibility: "FullScreen"
    visible: true

    Header{
    }



    Button{
        id: exitButton
        width:180
        height:50
        text: "Exit App"
        anchors.centerIn: parent
        onClicked: {
            Qt.quit();
        }
    }

    Button{
        width:180
        height:50
        text: "Exit Fullscreen"
        anchors.rightMargin: 2
        anchors.right: exitButton.left
        anchors.top : exitButton.top
        onClicked: {
            window1.visibility = "Windowed";
        }
    }

    Button{
        id: fullscreenButton
        width:180
        height:50
        text: "Fullscreen"
        anchors.leftMargin: 2
        anchors.left: exitButton.right
        anchors.top : exitButton.top
        onClicked: {
            window1.visibility = "FullScreen";
        }

    }

    Button{
        id: joyBut
        objectName: "joy"
        width:180
        height:50
        text: "sss"
        anchors.leftMargin: 2
        anchors.left: fullscreenButton.right
        anchors.top : fullscreenButton.top
    }

    Text{
        objectName: "textJoy"
        text: "aaa"
        anchors.leftMargin: 2
        anchors.left: joyBut.right
        anchors.top : joyBut.top
    }


    //ControlPanel{}

    Footer{}
}
