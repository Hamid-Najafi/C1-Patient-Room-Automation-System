import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    id: root
    property alias mWidth: root.width
    property alias mHeight: root.height
    property alias mColor: root.rectColor
    property color rectColor: Qt.hsva(0,1,1,1)

    signal mClickReleased();

    Rectangle{
        id: rgbBox
        anchors.bottom: root.bottom
        anchors.left: root.left
        anchors.right: root.right
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        anchors.bottomMargin: 128
        height: 8
        radius: root.height / 8
        LinearGradient{
            anchors.fill: parent
            source: rgbBox
            start: Qt.point(0,rgbBox.height / 2)
            end: Qt.point(rgbBox.width,rgbBox.height / 2)
            gradient:  Gradient {
                GradientStop { id: color1; position: 0.0; color: Qt.hsva(0,1,1,1) }
                GradientStop { id: color2; position: .166; color: Qt.hsva(.166,1,1,1) }
                GradientStop { id: color3; position: .333 ; color: Qt.hsva(.333,1,1,1) }
                GradientStop { id: color4; position: .5; color: Qt.hsva(0.5,1,1,1) }
                GradientStop { id: color5; position: .666; color: Qt.hsva(0.666,1,1,1) }
                GradientStop { id: color6; position: .833; color: Qt.hsva(0.833,1,1,1) }
                GradientStop { id: color7; position: 1.0; color: Qt.hsva(1,1,1,1) }
            }
        }

    }
    Rectangle{
        id:rectMouse
        anchors.bottom: root.bottom
        anchors.left: root.left
        anchors.right: root.right
        anchors.top: txtHeader.bottom
        color: "#01000000"
        MouseArea{
            id: rgbMouseArea
            anchors.fill: parent
            property bool isActive: false
            onMouseXChanged: {
                if(!rgbMouseArea.isActive) return;
                let x = mouse.x;
                let precent = x  / root.width;
                if(x < 0)
                    colorBox.x = rgbBox.x - (colorBox.width / 2);
                else if(x > rgbBox.width)
                    colorBox.x = rgbBox.x + rgbBox.width - (colorBox.width / 2);
                else
                    colorBox.x = x + rgbBox.x - (colorBox.width / 2);
                root.rectColor = Qt.hsva(precent , 1, 1 , 1);
            }

            onPressed: {
                rgbMouseArea.isActive = true;
                colorBox.height = 48;
                colorBox.width = 48;
            }
            onReleased: {
                rgbMouseArea.isActive = false;
                root.mClickReleased();
                colorBox.height = 24;
                colorBox.width = 24;
            }
        }
    }

    Text
    {
        id: txtHeader
        text: "RGB Light"
        anchors.top: root.top
        anchors.left: parent.left
        anchors.right: root.right
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        anchors.topMargin: 16
        height: root.height / 2 + 200
        color: Colors.white
        horizontalAlignment:  Qt.AlignLeft
        verticalAlignment: Qt.AlignVCenter
        font.family: "Cooper Hewitt"
        font.pixelSize: 48
        font.styleName: "Thin"
        font.weight: Font.Bold
    }
    Rectangle
    {
        id: colorBox
        anchors.bottom: root.bottom
        anchors.bottomMargin: 128 - (colorBox.height / 2) + (rgbBox.height / 2)
        height: 24
        width: 24
        color: root.rectColor
        radius:  colorBox.height / 2
        border.color: Colors.white
        border.width: 2
    }

}
