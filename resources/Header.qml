import QtQuick 2.5

Rectangle{
    color: panelColor
    anchors.fill: parent

    Image {
        id: logoImage
        height: 50
        width: 303
        source: appLogo
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
    }

    Text{
        color: panelTextColor
        text: appTitle
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        font.family: "Ubuntu"
        font.pixelSize: 24
    }

    Text{
        color: panelTextColor
        text: "Konec"
        anchors.bottom  : parent.bottom
        anchors.right : parent.right
        anchors.margins: 5
        font.family: "Ubuntu"
        font.pixelSize: 16
        MouseArea{
            anchors.fill: parent
            onClicked: {
                Qt.quit();
            }
        }
    }

    Rectangle {
        height: 1
        color: panelBorderColor
        anchors.left: parent.left
        anchors.right:parent.right
        anchors.bottom: parent.bottom
    }
}
