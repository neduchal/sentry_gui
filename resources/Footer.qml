import QtQuick 2.5

Rectangle{
    id: footer
    height: 40
    color: "#fcf8e3"
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right:parent.right

    Rectangle {
        height: 1
        color: "#07ABBC"
        anchors.left: parent.left
        anchors.right:parent.right
        anchors.bottom: parent.top
    }
}
