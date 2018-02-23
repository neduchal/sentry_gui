import QtQuick 2.5

Rectangle{
    id: controlPanel

    height: 50
    radius: 15
    color: "#dddddd"
    anchors.bottom: parent.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.rightMargin: 100
    anchors.leftMargin: 100
    anchors.bottomMargin: 40

    Rectangle{
        id: controlPanelSquarePart
        color: "#dddddd"
        height: controlPanel.radius
        anchors.bottom : controlPanel.bottom
        anchors.left : controlPanel.left
        anchors.right : controlPanel.right
    }

}
