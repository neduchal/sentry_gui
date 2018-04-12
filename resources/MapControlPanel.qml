import QtQuick 2.5

Rectangle{
    anchors.fill: parent

    Rectangle{
        id: zoomPlus
        width: 40
        height: 40
        color: panelTextColor
        anchors.top : parent.top
        anchors.right : parent.right
        antialiasing: true
        Text{
            id: zoomPlusText
            text: "+"
            anchors.centerIn: parent
            font.pixelSize: parent.height * .5
            color: whiteColor
            styleColor : whiteColor
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton
            onClicked:  _zoomClass.zoomPlus()
            onEntered:  { parent.color = panelColor;
                          zoomPlusText.color = panelTextColor;
                          zoomPlusText.styleColor = panelTextColor;}
            onExited:  { parent.color = panelTextColor;
                         zoomPlusText.color = whiteColor;
                         zoomPlusText.styleColor = whiteColor;}
        }
    }

    Rectangle{
        id: zoomMinus
        width: 40
        height: 40
        color: panelTextColor
        anchors.top : parent.top
        anchors.right : zoomPlus.left
        antialiasing: true
        Text{
            id: zoomMinusText
            text: "-"
            anchors.centerIn: parent
            font.pixelSize: parent.height * .5
            color: whiteColor
            styleColor : whiteColor
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton
            onClicked:  _zoomClass.zoomMinus()
            onEntered:  { parent.color = panelColor;
                          zoomMinusText.color = panelTextColor;
                          zoomMinusText.styleColor = panelTextColor;}
            onExited:  { parent.color = panelTextColor;
                         zoomMinusText.color = whiteColor;
                         zoomMinusText.styleColor = whiteColor;}
        }
    }

    Rectangle{
        id: zoomLabel
        width: 60
        height: 40
        color: panelColor
        anchors.top : parent.top
        anchors.right : zoomMinus.left
        antialiasing: true
        Text{
            id: zoomLAbelText
            text: "Zoom"
            anchors.centerIn: parent
            color: panelTextColor
            styleColor : panelTextColor
        }
    }

    Rectangle{
        id: navigationLayer
        width: 80
        height: 40
        color: panelTextColor
        anchors.top : parent.top
        anchors.right : zoomLabel.left
        antialiasing: true
        Text{
            id: navigationLayerText
            text: "Navigace"
            anchors.centerIn: parent
            color: whiteColor
            //styleColor : whiteColor
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton
            //onClicked:  _zoomClass.zoomMinus()
            onEntered:  { parent.color = panelColor;
                          navigationLayerText.color = panelTextColor;}
            onExited:  { parent.color = panelTextColor;
                         navigationLayerText.color = whiteColor;}
        }
    }

    Rectangle{
        id: photoLayer
        width: 80
        height: 40
        color: panelTextColor
        anchors.top : parent.top
        anchors.right : navigationLayer.left
        antialiasing: true
        Text{
            id: photoLayerText
            text: "Fotografie"
            anchors.centerIn: parent
            color: whiteColor
            //styleColor : whiteColor
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton
            //onClicked:  _zoomClass.zoomMinus()
            onEntered:  { parent.color = panelColor;
                          photoLayerText.color = panelTextColor;}
            onExited:  { parent.color = panelTextColor;
                         photoLayerText.color = whiteColor;}
        }
    }

    Rectangle{
        id: layers
        width: 60
        height: 40
        color: panelColor
        anchors.top : parent.top
        anchors.right : photoLayer.left
        antialiasing: true
        Text{
            id: layersText
            text: "Vrstvy"
            anchors.centerIn: parent
            color: panelTextColor
            styleColor : panelTextColor
        }
    }

    // LEFT
    Rectangle{
        id: setGoal
        width: 100
        height: 40
        color: panelTextColor
        anchors.top : parent.top
        anchors.left : parent.left
        antialiasing: true
        Text{
            id: setGoalText
            text: "Nastavit cíl"
            anchors.centerIn: parent
            color: whiteColor
            //styleColor : whiteColor
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton
            //onClicked:  _zoomClass.zoomMinus()
            onEntered:  { parent.color = panelColor;
                          setGoalText.color = panelTextColor;}
            onExited:  { parent.color = panelTextColor;
                         setGoalText.color = whiteColor;}
        }
    }

    Rectangle{
        id: setReturn
        width: 80
        height: 40
        color: panelTextColor
        anchors.top : parent.top
        anchors.left : setGoal.right
        antialiasing: true
        Text{
            id: setReturnText
            text: "Návrat"
            anchors.centerIn: parent
            color: whiteColor
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton
            //onClicked:  _zoomClass.zoomMinus()
            onEntered:  { parent.color = panelColor;
                          setReturnText.color = panelTextColor;}
            onExited:  { parent.color = panelTextColor;
                         setReturnText.color = whiteColor;}
        }
    }

    Rectangle{
        id: scale
        width: 80
        height: 40
        color: panelColor
        anchors.top : parent.top
        anchors.right : photoLayer.left
        antialiasing: true
        Text{
            id: scaleText
            text: "Měřítko mapy:"
            anchors.centerIn: parent
            color: panelTextColor
            styleColor : panelTextColor
        }
    }

    Rectangle{
        id: scaleValue
        width: 40
        height: 40
        color: panelColor
        anchors.top : parent.top
        anchors.right : photoLayer.left
        antialiasing: true
        Text{
            id: scaleValueText
            objectName: "mapScaleValue";            
            text: "0.0"
            anchors.centerIn: parent
            color: panelTextColor
            styleColor : panelTextColor
        }
    }

}
