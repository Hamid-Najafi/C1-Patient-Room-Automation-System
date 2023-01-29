import QtQuick  
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Shapes  as Sh
import Qt5Compat.GraphicalEffects

Item {
    property alias mHeader: txtHeader.text
    property alias mSubHeader: txtSubHeader.text
    property string mIcon
    property string mLink
    property int mSize : 96
    signal mClicked();
    id: root
    width: Constants.width / 3 - 128
    height: root.mSize

    Rectangle {
        id: rectBackground
        anchors.fill: parent
        radius: 8
        color : Colors.elementColor
        opacity: .4
    }



    DropShadow {
        id: rectShadow
        anchors.fill: rectBackground
        horizontalOffset: 16
        verticalOffset: 16
        radius: 8.0
        color: Colors.elementColor
    }


    Image {
        id: imgIcon
        source: "file:///" + mIcon
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 8
        anchors.topMargin: 8
        anchors.bottomMargin: 8
        verticalAlignment: Image.AlignBottom
        horizontalAlignment: Image.AlignRight
        width: root.mSize
        height: root.mSize
        fillMode: Image.PreserveAspectFit

    }

    Sh.Shape {
        anchors.fill: parent
        antialiasing: true
        layer.enabled: true
        layer.samples: 8

        Sh.ShapePath {
            id: baseShapePath
            fillColor: Colors.gray6
            fillGradient:  Sh.LinearGradient {
                x1:root.height
                y1:root.height
                x2:0
                y2:0
                GradientStop { position: 0.0; color: Backend.colorTransparency( Colors.gray8 , .8) }
                GradientStop { position: 1.0; color: "transparent" }

            }
            strokeColor: "transparent"
            strokeWidth: 2
            capStyle: Sh.ShapePath.RoundCap
            startX: 0
            startY: 0
            PathLine{
                x: root.width - root.height / 2
                y: 0
            }
            PathLine{
                x: root.height - root.height / 2
                y: root.height
            }
            PathLine{
                x: 0
                y: root.height
            }
        }

    }



    Text {
        id: txtHeader
        text: ""
        color: Colors.white1
        anchors.left: parent.left
        anchors.leftMargin: 16
        anchors.right: imgIcon.left
        anchors.rightMargin: 16
        anchors.top: imgIcon.top
        anchors.topMargin: 8
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        font.family: "Far.Nazanin"
        font.pixelSize: 36
        font.styleName: "Light"
        font.weight: Font.DemiBold
    }

    Text {
        id: txtSubHeader
        text: context.subHeader
        color: Colors.gray1
        anchors.left: parent.left
        anchors.leftMargin: 16
        anchors.right: imgIcon.left
        anchors.rightMargin: 16
        anchors.top: txtHeader.bottom
        anchors.topMargin: 8
        wrapMode:Text.Wrap
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignTop
        font.family: "Far.Nazanin"
        font.pixelSize: 22
        font.styleName: "Semibold"
        font.weight: Font.DemiBold
    }


    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.mClicked();
        }
    }
}
