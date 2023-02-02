import QtQuick
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts

Item {
    id: root
    property alias mSize: root.size
    property alias mState: root.state
    property alias mIcon: iconDashboard.source
    property int mIndex: 0
    property int size: 64
    signal mClicked(int index);
    signal mHovered(int index);
    signal mExited(int index);
    width: root.size
    height: root.size
    state: "normal"
    Image {
        id: iconDashboard
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        mipmap : true
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop

        MouseArea{
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                root.state = "hover"
                root.mHovered(root.mIndex);
            }
            onExited: {
                root.state = "normal"
                root.mExited(root.mIndex);
            }
            onClicked: {
                root.mClicked(root.mIndex);
            }
        }
    }
    ColorOverlay{
        anchors.fill: iconDashboard
        source:iconDashboard
        color: Colors.white
    }
    NumberAnimation {
        id: animOpen
        target: iconDashboard
        property: "anchors.margins"
        onFinished: animOpenPager.running = false
        duration: 400
        easing.type: Easing.OutCubic
        to: 0
        running: false
    }
    NumberAnimation {
        id: animClose
        target: iconDashboard
        property: "anchors.margins"
        onFinished: animOpenPager.running = false
        duration: 400
        easing.type: Easing.OutCubic
        to: 8
        running: false
    }

    states: [
        State {
            name: "normal"
            PropertyChanges {
                target: animOpen
                running: false
            }
            PropertyChanges {
                target: animClose
                running: true
            }
        },
        State {
            name: "hover"

            PropertyChanges {
                target: animOpen
                running: true
            }
            PropertyChanges {
                target: animClose
                running: false
            }

        }
    ]

}
