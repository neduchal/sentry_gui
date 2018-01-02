import QtQuick 2.5

Rectangle{
    height: 100
    color: "#fcf8e3"
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right:parent.right

    Image {
        id: logoImage
        height: 50
        width: 303
        source: "qrc:///images/logo.png"
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
    }

    Text{
        color: "#07ABBC"
        text: "Ground robot visualization GUI"
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        font.family: "Ubuntu"
        font.pixelSize: 24
    }

    Rectangle {
        height: 1
        color: "#07ABBC"
        anchors.left: parent.left
        anchors.right:parent.right
        anchors.bottom: parent.bottom
    }
}
