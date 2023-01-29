pragma Singleton
import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: backend

    property real speed: 34
    property real battery: 12

    property bool metricSystem: false
    readonly property real ratioMtoKM: 1.609
    property string speedString: Math.round(backend.metricSystem ? (backend.speed * backend.ratioMtoKM) : backend.speed)

    property real brightness: 0
    property bool showFPS: false

    property real mapScaling: 1.0

    property real mainAreaHeight: (Constants.height - Constants.topBarClosedHeigth)

    signal reset

    property int seconds: 0
    property int minutes: 0
    property int hours: 0
    property string time: ""
    property date __currentTime: new Date()

    function getGridLayoutPositionX(col,cols,width){
        return width / cols * col;
    }

    function getGridLayoutPositionY(row,rows,height, isBackward = false , divHeight = 0){
        if(isBackward)
            return (height / rows * (row + 1)) - divHeight;
        return height / rows * row;
    }

    function resetSettings() {
        backend.metricSystem = false
        backend.brightness = 0
        backend.showFPS = false
    }
    function colorTransparency(color , transparency){

        let col = Qt.rgba(color.r,color.g,color.b,transparency);
        return col;
    }

    function resetAll() {
        resetSettings()

        backend.speed = 10
        backend.battery = 50
        backend.mapScaling = 1.0

        __anim01.restart()
        __anim02.restart()
        __currentTime = new Date();

        reset()
    }

    Component.onCompleted: { __timeUpdate() }

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            backend.__currentTime = new Date()
            __timeUpdate()
        }
    }

    function __timeUpdate() {
        seconds = backend.__currentTime.getSeconds()
        minutes = backend.__currentTime.getMinutes()
        hours = backend.__currentTime.getHours()
        time = backend.__currentTime.toLocaleTimeString({ hour: '2-digit', minute:'2-digit' })
    }


    property SequentialAnimation __anim01:
    SequentialAnimation {
        loops: -1
        running: true

        PropertyAnimation {
            target: backend;
            property: "speed";
            from: 21.0
            to: 34.0
            duration: 5000
        }
        PropertyAnimation {
            target: backend;
            property: "speed";
            from: 34.0
            to: 21.0
            duration: 5000
        }
    }

    property SequentialAnimation __anim02:
    SequentialAnimation {
        loops: -1
        running: true

        PropertyAnimation {
            target: backend;
            property: "battery";
            from: 12.0
            to: 89.0
            duration: 50000
        }
        PropertyAnimation {
            target: backend;
            property: "battery";
            from: 89.0
            to: 12.0
            duration: 50000
        }
    }
}
