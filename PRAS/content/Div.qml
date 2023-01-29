import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects
import HAS
Item {
    id: root
    property alias divWidth: root.width
    property alias divHeigth: root.height
    property alias divText: textId.text
    property alias divColorStart: color1.color
    property alias divColorEnd: color2.color
    property alias divIcon: icon.source
    property alias divState: root.state
    property int actualHeight: 0
    signal divClicked();
    state: "normal"
    width: 500
    height: 400
    Rectangle{
        anchors.fill: parent
        id:rectId
        z: 1
        LinearGradient{
            anchors.fill: parent
            start: Qt.point(0,0)
            end: Qt.point(rectId.width,rectId.height)
            gradient:  Gradient {
                GradientStop { id: color1; position: 0.0; color: "white" }
                GradientStop { id: color2; position: 1.0; color: "black" }

            }
        }
    }
    Rectangle{
        anchors.fill: parent
        z: 2
        id: highlightRect
        opacity: .4
        color: "#1e1e1e"
    }
    Image {
        property int size: 0
        id: icon
        x: (root.width - size) / 2
        y :
        {
            if(root.state === "normal" || root.state === "hover" || root.state === "expanding")  return (root.height / 3) - ( size / 2);
            else return (root.height - size ) / 2;
        }
        z: 8
        height:  size
        width: size
        fillMode: Image.PreserveAspectFit
        mipmap :true
        source: "images/web_browsing.svg"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop

        ColorOverlay{
            anchors.fill: parent
            source:parent
            color:"#ffffff"
        }
    }
    Text {
        id: textId
        text: qsTr("text")
        font.family: "Cooper Hewitt"
        font.pixelSize: 64
        font.styleName: "Thin"
        font.weight: Font.ExtraLight
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        x: 0
        y : root.height / 3
        z: 9
        height:  root.height / 3 * 2
        width: root.width
        color: "#ffffff"
    }
    MouseArea {
        id: mouseArea1
        z: 10
        anchors.fill: root
        hoverEnabled: true
        onEntered:
        {
            if(root.state === "normal")
                root.state = "hover"
        }
        onExited: {
            if(root.state === "hover")
                root.state = "normal"
        }
        onClicked: {
            console.log('clicked');
            root.divClicked();
        }
    }
    ParallelAnimation{
        running: false
        id:collapseAnimation
        onFinished: root.state = "collapsed"
        NumberAnimation {
            target: root
            property: "height"
            duration: 400
            easing.type: Easing.InOutQuad
            to:Constants.collapseDivSive
        }
        NumberAnimation {
            target: textId
            property: "opacity"
            duration: 400
            easing.type: Easing.InOutQuad
            to:0
        }
        NumberAnimation {
            target: icon
            property: "size"
            duration: 400
            easing.type: Easing.InOutQuad
            to:Constants.collapseDivSive - 20
        }
    }
    ParallelAnimation{
        running: false
        id:activedAnimation
        onFinished: root.state = "active"
        NumberAnimation {
            target: root
            property: "height"
            duration: 400
            easing.type: Easing.InOutQuad
            to:Constants.activeDivSive
        }
        NumberAnimation {
            target: textId
            property: "opacity"
            duration: 400
            easing.type: Easing.InOutQuad
            to:0
        }
        NumberAnimation {
            target: icon
            property: "size"
            duration: 400
            easing.type: Easing.InOutQuad
            to:Constants.collapseDivSive
        }
    }
    ParallelAnimation{
        running: false
        id:expandAnimation
        onFinished: root.state = "normal"
        NumberAnimation {
            target: root
            property: "height"
            duration: 400
            easing.type: Easing.InOutQuad
            to:root.actualHeight
        }
        NumberAnimation {
            target: textId
            property: "opacity"
            duration: 400
            easing.type: Easing.InOutQuad
            to:1
        }
        NumberAnimation {
            target: icon
            property: "size"
            duration: 400
            easing.type: Easing.InOutQuad
            to:116
        }
    }

    Component.onCompleted: root.actualHeight = root.divHeigth

    states: [
        State {
            name: "normal"

            PropertyChanges {
                target: highlightRect
                opacity: 0
            }
            PropertyChanges {
                target: textId
                visible: true
            }
            PropertyChanges {
                target: icon
                size: 116
            }
        },
        State {
            name: "hover"

            PropertyChanges {
                target: highlightRect
                opacity: .4
            }
            PropertyChanges {
                target: textId
                visible: true
            }
            PropertyChanges {
                target: icon
                size: 116
            }
        },
        State {
            name: "collapsed"

            PropertyChanges {
                target: collapseAnimation
                running: false
            }
            PropertyChanges {
                target: highlightRect
                opacity: 0
            }
        },
        State {
            name: "collapsing"

            PropertyChanges {
                target: collapseAnimation
                running: true
            }
            PropertyChanges {
                target: highlightRect
                opacity: 0
            }
        },
        State {
            name: "active"

            PropertyChanges {
                target: activedAnimation
                running: false
            }
            PropertyChanges {
                target: highlightRect
                opacity: 0
            }
        },
        State {
            name: "activating"

            PropertyChanges {
                target: activedAnimation
                running: true
            }
        },
        State {
            name: "expanding"

            PropertyChanges {
                target: expandAnimation
                running: true
            }
        }
    ]
}
