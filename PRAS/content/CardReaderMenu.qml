import QtQuick  
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Shapes  as Sh
import Qt5Compat.GraphicalEffects

Item {
    id: root
    property alias mWidth: root.width
    property alias mHeight: root.height
    property int itemSize: 256
    width: 1920
    height: 780
    Rectangle{
        id: glowRect
        anchors.centerIn: parent
        width: root.width / 2 - 4
        height: root.height / 2 - 4
        radius: 8
        border.color: Colors.white
        border.width: 2
        color: Colors.elementColor
    }


    LinearGradient{
        anchors.fill: glowRect
        start: Qt.point(glowRect.width,glowRect.height)
        end: Qt.point(0,0)
        source: glowRect
        gradient: Gradient {
            GradientStop { position: 0.0; color: Colors.circleProgressGradiantTop }
            GradientStop { position: 1.0; color: Colors.circleProgressGradiantBottom }
        }
    }
    Rectangle{
        id:rectBody
        anchors.centerIn: parent
        width: root.width / 2 - 4
        height: root.height / 2 - 4
        radius: 8
        border.color: Colors.white
        border.width: 2
        color: "transparent"
        Rectangle{
            id: rectPicture
            anchors.left: parent.left
            anchors.leftMargin: 32
            y: (root.height / 2 - root.height / 4) / 2
            radius: root.height / 4 / 2
            width: root.height / 4
            height: root.height / 4
            border.color: Colors.white
            border.width: 2
            clip: true
            Image {
                id: imgPicture
                source: "images/pics/nourbakhsh.jpg"
                anchors.fill: parent
                layer.enabled:true
                fillMode: Image.PreserveAspectFit
                layer.effect: OpacityMask {
                    maskSource: Item {
                        width: imgPicture.width
                        height: imgPicture.height
                        Rectangle {
                            anchors.centerIn: parent
                            width: imgPicture.width
                            height: imgPicture.height
                            radius: imgPicture.width / 2
                        }
                    }
                }
            }
        }

        Rectangle{
            id:rectItems
            anchors.left: rectPicture.right
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 32
            color: "transparent"
            GridLayout{
                columns: 2
                Text {
                    id: txtName
                    text: qsTr("Full Name:")
                    color: Colors.white
                    font.family: "Cooper Hewitt"
                    font.pixelSize: 28
                    font.styleName: "Semibold"
                    font.weight: Font.DemiBold
                    Layout.margins: 8
                }
                Text {
                    text: ""
                }
                Text {
                    text: ""
                }
                Text {
                    id: txtNameValue
                    text: qsTr("Reza Nourbakhsh")
                    color: Colors.white
                    font.family: "Cooper Hewitt"
                    Layout.fillWidth: true
                    font.pixelSize: 28
                    font.styleName: "Light"
                    font.weight: Font.DemiBold
                    Layout.margins: 8
                }
                Text {
                    id: txtTitle
                    text: qsTr("Title:")
                    color: Colors.white
                    font.family: "Cooper Hewitt"
                    font.pixelSize: 28
                    font.styleName: "Semibold"
                    font.weight: Font.DemiBold
                    Layout.margins: 8
                }
                Text {
                    text: ""
                }
                Text {
                    text: ""
                }
                Text {
                    id: txtTitleValue
                    text: qsTr("Specialized Field")
                    color: Colors.white
                    font.family: "Cooper Hewitt"
                    Layout.fillWidth: true
                    font.pixelSize: 28
                    font.styleName: "Light"
                    font.weight: Font.DemiBold
                    Layout.margins: 8
                }
                Text {
                    id: txtId
                    text: qsTr("ID:")
                    color: Colors.white
                    font.family: "Cooper Hewitt"
                    font.pixelSize: 28
                    font.styleName: "Semibold"
                    font.weight: Font.DemiBold
                    Layout.margins: 8
                }
                Text {
                    text: ""
                }
                Text {
                    text: ""
                }
                Text {
                    id: txtIdValue
                    text: qsTr("123456789")
                    color: Colors.white
                    font.family: "Cooper Hewitt"
                    Layout.fillWidth: true
                    font.pixelSize: 28
                    font.styleName: "Light"
                    font.weight: Font.DemiBold
                    Layout.margins: 8
                }
            }
        }
    }

}
