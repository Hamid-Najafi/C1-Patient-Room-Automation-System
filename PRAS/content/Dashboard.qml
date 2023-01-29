import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import Qt5Compat.GraphicalEffects
import QtQuick.VirtualKeyboard

Window {
    id: root
    property var divs: [];
    width: Constants.width
    height: Constants.height
    visibility: "FullScreen"
    visible: true
    title: "HAS"



    Rectangle{
        id:rectBackground
        anchors.fill: parent
        LinearGradient{
            anchors.fill: parent
            start: Qt.point(0,0)
            end: Qt.point(0,rectBackground.height)
            gradient:  Gradient {
                GradientStop { id: rectBackgroundcolor1; position: 0.0; color: Colors.backgroundGradiantTop }
                GradientStop { id: rectBackgroundcolor2; position: 1.0; color: Colors.backgroundGradiantBottom }

            }
        }
    }

    SettingBar{
        id: settings
        x: 0
        y: 0
        z: 1

    }
    // pages

    Lighting{
        id: pglighting
        x:0
        y: Constants.topBarClosedHeigth + Constants.collapseDivSive
        mWidth: Constants.width
        mHeight: Constants.height - Constants.topBarClosedHeigth - 2 * Constants.collapseDivSive
    }


    Browser{
        id:pgbrowser
        x:0
        y: Constants.topBarBaseHeigth
        mWidth: Constants.width
        mHeight: Constants.height - Constants.topBarBaseHeigth
        visible: false
    }

    RestaurantMenu{
        id: pgrestaurant
        x:0
        y: Constants.topBarClosedHeigth + Constants.collapseDivSive
        mWidth: Constants.width
        mHeight: Constants.height - Constants.topBarClosedHeigth - 2 * Constants.collapseDivSive
        visible: false
    }
    TVMenu{
        id: pgtv
        x:0
        y: Constants.topBarClosedHeigth + Constants.collapseDivSive
        mWidth: Constants.width
        mHeight: Constants.height - Constants.topBarClosedHeigth - 2 * Constants.collapseDivSive
        visible: false
    }

    GameMenu{
        id: pggame
        x:0
        y: Constants.topBarClosedHeigth + Constants.collapseDivSive
        mWidth: Constants.width
        mHeight: Constants.height - Constants.topBarClosedHeigth - 2 * Constants.collapseDivSive
        visible: false
    }

    HIS{
        id: pghis
        x:0
        y: Constants.topBarClosedHeigth + Constants.collapseDivSive
        mWidth: Constants.width
        mHeight: Constants.height - Constants.topBarClosedHeigth - 2 * Constants.collapseDivSive
        visible: false
    }

    NurseCall{
        id: pgnursecall
        x:0
        y: Constants.topBarClosedHeigth + Constants.collapseDivSive
        mWidth: Constants.width
        mHeight: Constants.height - Constants.topBarClosedHeigth - 2 * Constants.collapseDivSive
        visible: false
    }
    CardReaderMenu{
        id: pgcard
        x:0
        y: Constants.topBarClosedHeigth + Constants.collapseDivSive
        mWidth: Constants.width
        mHeight: Constants.height - Constants.topBarClosedHeigth - 2 * Constants.collapseDivSive
        visible: false
    }

    Rectangle{
        id: rectAccess
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 16;
        x: (root.width - width) / 2
        height: 8
        width: 360
        radius: 4
        color: "#1a1f25"
    }
    NumberAnimation {
        id: animrectAccess
        target: rectAccess
        property: "anchors.bottomMargin"
        duration: 400
        easing.type: Easing.OutCubic
        from: 16
        to: 20
        running: false
        loops: Animation.Infinite;
    }

    LinearGradient{
            anchors.fill: rectAccess
            start: Qt.point(0,0)
            end:Qt.point(rectAccess.width , 0)
            source: rectAccess
            gradient: Gradient {
                GradientStop { position: 0.0; color: Colors.circleProgressGradiantTop }
                GradientStop { position: 1.0; color: Colors.circleProgressGradiantBottom }
            }
    }

    // Pager

    Pager{
        id: mPager
        mWidth: parent.width / 3 * 2
        x: (parent.width - (parent.width / 3 * 2)) / 2
        y: (parent.height)
        onInteracting: function(value) {
            if(mPager.mState != "open") return;
            if(value){
                timerPager.stop();
            }else{
                timerPager.restart();
            }
        }
        onPageChanged: function(index){
            hideAll();

            if(index === 1)
            {
                pglighting.visible = true;
            }
            else if(index === 2){
                pgbrowser.visible = true;
            }
            else if(index === 3){
                pggame.visible = true;
            }
            else if(index === 4){
                pgtv.visible = true;
            }
            else if(index === 5){
                pgrestaurant.visible = true;
            }
            else if(index === 6){
                pghis.visible = true;
            }
            else if(index === 7){
                pgnursecall.visible = true;
            }
            else if(index === 8){
                pgcard.visible = true;
            }
        }
    }

    Timer {
        id: timerPager
        interval: 3000
        running: false
        repeat: false
        onTriggered: animClosePager.running = true;
    }

    NumberAnimation {
        id: animOpenPager
        target: mPager
        property: "y"
        onFinished: {animOpenPager.running = false; animHideAccess.running = false;}
        onStarted: {animHideAccess.running = true;}
        duration: 400
        easing.type: Easing.OutCubic
        to: (root.height - Constants.pagerSize / 2 * 3)
        running: false
    }

    NumberAnimation {
        id: animHideAccess
        target: rectAccess
        property: "height"
        onFinished: animHideAccess.running = false
        duration: 400
        easing.type: Easing.OutCubic
        to: 0
        running: false
    }

    NumberAnimation {
        id: animClosePager
        target: mPager
        property: "y"
        onFinished: {
            timerPager.running = false
            animClosePager.running = false
            mPager.mState = "ready";
        }
        onStarted: {
            animShowAccess.running = true;
        }

        duration: 400
        easing.type: Easing.OutCubic
        to: (root.height)
        running: false
    }

    NumberAnimation {
        id: animShowAccess
        target: rectAccess
        property: "height"
        onFinished: {
            animShowAccess.running = false
        }
        duration: 400
        easing.type: Easing.OutCubic
        to: 8
        running: false
    }

    MouseArea {
        id: windowMouseArea
        property bool isPressed: false
        property bool isPager: false
        anchors.fill: parent
        onPressed:  function (mouse){
            if(mouse.y > root.height - Constants.pagerSize / 2)
            {
                windowMouseArea.isPager = true;
                windowMouseArea.isPressed = true;
                return;
            }
            mouse.accepted = false;
        }
        onReleased: {
            windowMouseArea.isPressed = false;
        }

        onPositionChanged: function (mouse){


            if( windowMouseArea.isPressed && windowMouseArea.isPager && mPager.mState == "ready" && mouse.y < (root.height - Constants.pagerSize / 2))
            {
                animOpenPager.running = true;
                timerPager.running = true;
                mPager.mState = "open";
                windowMouseArea.isPager = false;
                windowMouseArea.isPressed = false;
            }
        }
    }

    InputPanel {
        id: inputPanel
        property bool showKeyboard :  active
        y: showKeyboard ? parent.height - height : parent.height
        Behavior on y {
            NumberAnimation {
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
        anchors.leftMargin: Constants.width/10
        anchors.rightMargin: Constants.width/10
        anchors.left: parent.left
        anchors.right: parent.right
    }

    function hideAll(){
        pglighting.visible = false;
        pgbrowser.visible = false;
        pgrestaurant.visible = false;
        pgtv.visible = false;
        pggame.visible = false;
        pghis.visible = false;
        pgnursecall.visible = false;
        pgcard.visible = false;
    }

}

