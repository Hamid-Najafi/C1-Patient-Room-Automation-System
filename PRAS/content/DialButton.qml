import QtQuick  
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

Item {
    id: root
    property alias mWidth: root.width
    property alias mHeight: root.height
    property alias mTitle: txtTitle.text
    property string mValue: ""
    signal mDialClicked(string value);
    width: 48
    height: 36

    Rectangle {
        id: rectBackground
        anchors.fill: parent
        radius: 8
        opacity: .6
    }
    LinearGradient{
        anchors.fill: rectBackground
        source: rectBackground
        start: Qt.point(0,0)
        end: Qt.point(rectBackground.width,rectBackground.height)
        gradient:  Gradient {
            GradientStop { id: color1; position: 0.0; color: Colors.elementColor }
            GradientStop { id: color2; position: .8; color: Colors.elementColor }

        }
    }

    DropShadow {
        id: rectShadow
        anchors.fill: rectBackground
        horizontalOffset: 16
        verticalOffset: 16
        radius: 8.0
        color:  Colors.elementColor
    }
    Text {
        id: txtTitle
        text: ""
        color: Colors.white1
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Cooper Hewitt"
        font.pixelSize: 36
        font.styleName: "Semibold"
        font.weight: Font.DemiBold
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.mDialClicked(root.mValue);
        }
    }




}
