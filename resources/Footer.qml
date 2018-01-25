import QtQuick 2.5

Rectangle{
    id: footer
    color: panelColor
    anchors.fill: parent

    Rectangle {
        height: 1
        color: panelBorderColor
        anchors.left: parent.left
        anchors.right:parent.right
        anchors.bottom: parent.top
    }
}
