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

    Text{
        id: batteryVoltageLabel
        objectName: "batteryVoltageLabel"
        text: "Battery Voltage: "
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        //anchors.top : parent.top
        font.family: "Ubuntu"
        font.pixelSize: 16
        color: panelTextColor
    }

    Text{
        id: batteryVoltageValue
        objectName: "batteryVoltageValue"
        text: "N/A"
        anchors.leftMargin: 2
        anchors.left: batteryVoltageLabel.right
        anchors.top : batteryVoltageLabel.top
        font.family: "Ubuntu"
        font.pixelSize: 16
        color: panelTextColor
    }

    Text{
        id: speedModeLabel
        objectName: "speedModeLabel"
        text: "SpeedMode: "
        anchors.leftMargin: 10
        anchors.left: batteryVoltageValue.right
        anchors.top : batteryVoltageValue.top
        //anchors.top : parent.top
        font.family: "Ubuntu"
        font.pixelSize: 16
        color: panelTextColor
    }

    Text{
        id: speedModeValue
        objectName: "speedModeValue"
        text: "N/A"
        anchors.leftMargin: 2
        anchors.left: speedModeLabel.right
        anchors.top : speedModeLabel.top
        font.family: "Ubuntu"
        font.pixelSize: 16
        color: panelTextColor
    }


}
