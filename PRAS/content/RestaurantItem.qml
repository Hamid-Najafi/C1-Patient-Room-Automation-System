import QtQuick  
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

Item {
    property alias mHeader: txtHeader.text
    property alias mSubHeader: txtSubHeader.text
    property alias mPrice: txtPrice.text
    property string mIcon
    property int mSize : 96
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
        width: root.mSize
        height: root.mSize
        fillMode: Image.Stretch

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
        font.pixelSize: 28
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
        font.pixelSize: 16
        font.styleName: "Semibold"
        font.weight: Font.DemiBold
    }

    Text {
        id: txtPrice
        text: ""
        color: Colors.white1
        anchors.left: parent.left
        anchors.leftMargin: 16
        anchors.right: imgIcon.left
        anchors.rightMargin: 16
        anchors.top: txtSubHeader.bottom
        anchors.topMargin: 16
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        font.family: "Far.Nazanin"
        font.pixelSize: 18
        font.styleName: "SemiBod"
        font.weight: Font.Bold
    }


    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("Toggle Button Clicked");
            context.toggleState();
        }
    }
}
