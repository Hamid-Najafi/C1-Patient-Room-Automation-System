
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls 2.3
import QtQuick.Timeline 1.0
import QtQuick.Layouts 1.3
import HAS

Item {
    id: settings
    width: Constants.width
    height: Constants.topBarClosedHeigth

    state: "closed"

    Rectangle {
        id: blocker
        x: 0
        width: Constants.width
        color: "#464646"
        opacity: 0
        anchors.bottom: parent.bottom
        anchors.top: stack.bottom

        MouseArea {
            id: mouseArea2
            anchors.fill: parent
        }
    }

    Image {
        id: close
        x: Constants.width / 2 - width / 2

        anchors.top: stack.bottom
        source: "images/top_curtain_drag_back.png"

        MouseArea {
            id: mouseArea
            anchors.rightMargin: -16
            anchors.leftMargin: -16
            anchors.bottomMargin: -16
            anchors.fill: parent
        }
    }

    Rectangle {
        id: stack
        x: 0
        anchors.top: topBar.bottom
        width: Constants.width
        height: 200
        color: "#0d0d0d"
        clip: true

        MouseArea {
            anchors.fill: parent
        }

        //        StackLayout {
        //            id: stackLayout
        //            width: Constants.width
        //            currentIndex: tabbar.index
        //            anchors.fill: parent

        //            BikeInfo {}

        //            GeneralSettings {}

        //            ViewSettings {}
        //        }
    }

    Rectangle {
        id: topBar
        x: 0
        y: 0
        width: Constants.width
        height: 45
        color: "#0d0d0d"

        Image {
            id: image4
            x: Constants.width - 47
            y: 5
            source: "images/search_cancel.png"
        }

        Image {
            id: image3
            x: image4.x - 47
            y: 5
            source: "images/info.png"
        }
    }

    Image {
        z: 100
        id: open
        x: Constants.width / 2 - width / 2
        anchors.top: topBar.bottom
        source: "images/top_curtain_drag.png"

        MouseArea {
            id: mouseArea1
            anchors.rightMargin: -16
            anchors.leftMargin: -16
            anchors.bottomMargin: -16
            anchors.fill: parent
        }

        CustomLabel {
            id: customLabel
            x: -245
            y: Constants.topBarOpenedHeigth
            text: Backend.time
            font.pixelSize: 22
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
        }
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: openAnimation
                onFinished: settings.state = "Open"
                loops: 1
                duration: 250
                from: 0
                to: 1000
                running: false
            },
            TimelineAnimation {
                id: closeAnimation
                onFinished: settings.state = "Closed"
                loops: 1
                duration: 250
                from: 1000
                to: 0
                running: false
            }
        ]
        endFrame: 1000
        enabled: true
        startFrame: 0

        KeyframeGroup {
            target: stack
            property: "height"

            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                easing.bezierCurve: [0.39, 0.575, 0.565, 1, 1, 1]
                value: 320
                frame: 1000
            }

            Keyframe {
                value: 0
                frame: 89
            }
        }

        KeyframeGroup {
            target: close
            property: "opacity"
            Keyframe {
                easing.bezierCurve: [0.39, 0.575, 0.565, 1, 1, 1]
                value: 1
                frame: 1000
            }

            Keyframe {
                value: 0
                frame: 850
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: close
            property: "y"
            Keyframe {
                value: 315
                frame: 850
            }

            Keyframe {
                easing.bezierCurve: [0.39, 0.575, 0.565, 1, 1, 1]
                value: 360
                frame: 1000
            }
        }

        KeyframeGroup {
            target: open
            property: "opacity"

            Keyframe {
                value: 1
                frame: 0
            }

            Keyframe {
                value: 0
                frame: 88
            }
        }

        //        KeyframeGroup {
        //            target: tabbar
        //            property: "opacity"

        //            Keyframe {
        //                value: 0
        //                frame: 0
        //            }

        //            Keyframe {
        //                value: 1
        //                frame: 1000
        //            }
        //        }

        KeyframeGroup {
            target: blocker
            property: "opacity"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 0.2
                frame: 1000
            }

            Keyframe {
                frame: 794
                value: "0"
            }
        }

        //        KeyframeGroup {
        //            target: stackLayout
        //            property: "opacity"

        //            Keyframe {
        //                value: 0
        //                frame: 0
        //            }

        //            Keyframe {
        //                value: 0
        //                frame: 300
        //            }

        //            Keyframe {
        //                value: 1
        //                frame: 1000
        //            }
        //        }

        KeyframeGroup {
            target: blocker
            property: "anchors.bottomMargin"
            Keyframe {
                value: 708
                frame: 0
            }

            Keyframe {
                value: 0
                frame: 1000
            }
        }
    }

    Connections {
        target: mouseArea
        onClicked: {
            settings.state = "Closing"
        }
    }

    Connections {
        target: mouseArea1
        onClicked:function(val) {
            if (settings.state !== "Open")
                settings.state = "Opening"
        }
    }

    //    Tabbar {
    //        id: tabbar
    //        x: 0
    //        y: 0
    //        index: 0
    //    }

    states: [
        State {
            name: "Open"

            PropertyChanges {
                target: timeline
                currentFrame: 1000
                enabled: true
            }
        },
        State {
            name: "Closed"

            PropertyChanges {
                target: timeline
                currentFrame: 0
                enabled: true
            }

            PropertyChanges {
                target: settings
                height: Constants.topBarClosedHeigth

            }

        },
        State {
            name: "Opening"

            PropertyChanges {
                target: timeline
                enabled: true
            }

            PropertyChanges {
                target: settings
                height: Constants.height

            }

            PropertyChanges {
                target: openAnimation
                running: true
            }
        },
        State {
            name: "Closing"

            PropertyChanges {
                target: timeline
                enabled: true
            }

            PropertyChanges {
                target: closeAnimation
                running: true
            }
        }
    ]
}
