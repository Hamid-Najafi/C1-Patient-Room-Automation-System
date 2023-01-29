import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    id: root
    //property alias divWidth: root.width
   // property alias divHeigth: root.height
    property alias divIcon: icon.source
    property alias divState: root.state
    property int actualHeight: 0
    signal divClicked();
    state: "normal"
    width: 500
    height: 400

    Rectangle{
        anchors.fill: parent
        color: "#0d0d0d" //Colors.elementColor
        radius: 2
        opacity: .6
    }
    Text {
        id: txtState
        text: "TODAY"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: 16
        anchors.leftMargin: 16
        anchors.rightMargin: 16
        font.family: "Cooper Hewitt"
        font.pixelSize: 24
        font.styleName: "Light"
        font.weight: Font.ExtraLight
        color:"#ffffff" // Colors.white
    }
//    Image {
//        property int size: 178
//        id: icon
//        x: (root.width/ 2 - size - 32)
//        anchors.top: txtState.bottom
//        anchors.topMargin: 32
//        height:  size
//        width: size
//        fillMode: Image.PreserveAspectFit
//        source: "images/weather/sun.svg"
//        horizontalAlignment: Qt.AlignHCenter
//        verticalAlignment: Qt.AlignVCenter
//        smooth: false
//        antialiasing: true

//    }

    Image {
        property int size: 178
        id: icon
        x: (root.width/ 2 - size - 32)
        anchors.top: txtState.bottom
        anchors.topMargin: 32
        height:  size
        width: size
        fillMode: Image.PreserveAspectFit
            source: "images/weather/sun.svg"
            sourceSize: Qt.size( size, size )

            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            Image {
                id: img
                source: parent.source
                width: 0
                height: 0
            }
    }

    Text {
        id: txtTemprature
        text: "24°"
        x: (parent.width/ 2) + 32
        anchors.top: txtState.bottom
        anchors.topMargin: 32
        font.family: "Cooper Hewitt"
        font.pixelSize: 96
        font.styleName: "Medium"
        verticalAlignment: Qt.AlignBottom
        horizontalAlignment: Text.AlignHCenter
        font.weight: Font.DemiBold
        color:"#ffffff" // Colors.white
    }
    Text {
        id: txtWeather
        text: "Sunny"
        x: ((parent.width/ 2) + 32)
        anchors.top: txtTemprature.bottom
        font.family: "Cooper Hewitt"
        font.pixelSize: 40
        font.styleName: "Light"
        verticalAlignment: Qt.AlignTop
        horizontalAlignment: Text.AlignHCenter
        font.weight: Font.ExtraLight
        color:"#ffffff" // Colors.white
    }
    Text {
        id: txtMax
        text: "Max Temp : N/A"
        anchors.top: icon.bottom
        anchors.left: icon.left
        anchors.right: parent.right
        anchors.topMargin: 32
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        font.family: "Cooper Hewitt"
        font.pixelSize: 24
        font.styleName: "Light"
        font.weight: Font.ExtraLight
        color:"#ffffff" // Colors.white
    }
    Text {
        id: txtMin
        text: "Min Temp : N/A"
        anchors.top: txtMax.bottom
        anchors.left: icon.left
        anchors.right: parent.right
        anchors.topMargin: 8
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        font.family: "Cooper Hewitt"
        font.pixelSize: 24
        font.styleName: "Light"
        font.weight: Font.ExtraLight
        color:"#ffffff" // Colors.white
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.33}
}
##^##*/
