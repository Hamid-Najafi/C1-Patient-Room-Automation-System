import QtQuick 2.15
import QtQuick.Controls
import com.nourbakhsh.SerialController
Item {
    id: root
    property alias mWidth: root.width
    property alias mHeight: root.height

    width: 1920
    height: 780

    property var locale: Qt.locale()
    property date currentTime: new Date()

    property double buttonWidth: root.width / 5
    property double buttonHeigth: root.height / 5
    property double buttonMargin: root.buttonWidth / 4
    Timer{
        id: timeUpdater
        running: true;
        repeat: true;
        onTriggered: {
            currentTime= new Date();
            txtDate.text = currentTime.toLocaleDateString(locale, Locale.LongFormat);
            txtTime.text = currentTime.toLocaleTimeString(locale, Locale.LongFormat);
        }
    }

    SerialController{
        id:controler
    }

    Text {
        id: txtDate
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 32
        anchors.topMargin: 32
        anchors.right: mWeather.right
        height: 64
        text: currentTime.toLocaleDateString(locale, Locale.LongFormat);
        color : Colors.white
        font.family: "Cooper Hewitt"
        verticalAlignment: Text.AlignTop
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 38
        font.styleName: "Thin"
        font.weight: Font.ExtraLight
    }
    Text {
        id: txtTime
        anchors.top: txtDate.bottom
        anchors.left: parent.left
        anchors.leftMargin: 32
        anchors.topMargin: 16
        anchors.right: mWeather.right
        height: 64
        verticalAlignment: Text.AlignTop
        horizontalAlignment: Text.AlignHCenter
        text: currentTime.toLocaleTimeString(locale, Locale.LongFormat);
        color : Colors.white
        font.family: "Cooper Hewitt"
        font.pixelSize: 78
        font.styleName: "Light"
        font.weight: Font.DemiBold
    }

    Weather{
        id: mWeather
        anchors.bottom: toggleButton2.bottom
        anchors.top: txtTime.bottom
        anchors.topMargin: 32
        anchors.left: parent.left
        anchors.leftMargin: 32

    }


    ToggleButton {
        id: toggleButton
        anchors.top: parent.top
        anchors.left: mWeather.right
        anchors.leftMargin: 32
        anchors.topMargin: 32
        mHeader: "Light 1"
        mIconOff: "images/light_off.svg"
        mIconOn: "images/light_on.svg"
        mState: false
        mWidth: root.buttonWidth
        mHeight: root.buttonHeigth
        mOffString: "OFF"
        mOnString: "ON"
        onMContextStateChanged: function(state){
            controler.setRelay(1,state);
        }
    }
    ToggleButton {
        id: toggleButton1
        anchors.top: toggleButton.bottom
        anchors.left: mWeather.right
        anchors.leftMargin: 32
        anchors.topMargin: 32
        mHeader: "Light 2"
        mIconOff: "images/light_off.svg"
        mIconOn: "images/light_on.svg"
        mState: false
        mWidth: root.buttonWidth
        mHeight: root.buttonHeigth
        mOffString: "OFF"
        mOnString: "ON"
        onMContextStateChanged: function(state){
            controler.setRelay(2,state);
        }
    }

    ToggleButton {
        id: toggleButton2
        anchors.top: toggleButton1.bottom
        anchors.left: mWeather.right
        anchors.leftMargin: 32
        anchors.topMargin: 32
        mHeader: "Door"
        mIconOff: "images/door_open.svg"
        mIconOn: "images/door_close.svg"
        mState: false
        mWidth: root.buttonWidth
        mHeight: root.buttonHeigth
        mOffString: "OPEN"
        mOnString: "CLOSE"
    }
    ToggleButton {
        id: toggleButton3
        anchors.top: toggleButton2.bottom
        anchors.left: mWeather.right
        anchors.leftMargin: 32
        anchors.topMargin: 32
        mHeader: "Window"
        mIconOff: "images/window_open.svg"
        mIconOn: "images/window_close.svg"
        mState: false
        mWidth: root.buttonWidth
        mHeight: root.buttonHeigth
        mOffString: "OPEN"
        mOnString: "CLOSE"
        onMContextStateChanged: function(state){
            controler.setCurtain(state);
        }
    }
    Rectangle{
        id: rectTemprature
        color: Colors.elementColor
        anchors.top: mWeather.bottom
        anchors.left: mWeather.left
        anchors.right: mWeather.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 32
        anchors.topMargin: 32
        radius: 8
        Text {
            id: txtTemprature
            text: "Temprature"
            color: Colors.white
            font.family: "Cooper Hewitt"
            font.pixelSize: 40
            font.styleName: "Light"
            font.weight: Font.DemiBold
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 16
            anchors.leftMargin: 16
            width: parent.width / 2
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: txtTempratureValue
            text: "19°"
            color: Colors.white
            font.family: "Cooper Hewitt"
            font.pixelSize: 64
            font.styleName: "Thin"
            font.weight: Font.DemiBold
            anchors.top: txtTemprature.bottom
            anchors.left: txtTemprature.left
            anchors.bottom: parent.bottom
            anchors.right: txtTemprature.right
            anchors.bottomMargin: 16
            anchors.topMargin: 16
            width: parent.width / 2
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: txtHumidity
            text: "Humidity"
            color: Colors.white
            font.family: "Cooper Hewitt"
            font.pixelSize: 40
            font.styleName: "Light"
            font.weight: Font.DemiBold
            anchors.top: parent.top
            anchors.left: txtTemprature.right
            anchors.topMargin: 16
            anchors.leftMargin: 16
            width: parent.width / 2
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: txtHumidityValue
            text: "50%"
            color: Colors.white
            font.family: "Cooper Hewitt"
            font.pixelSize: 64
            font.styleName: "Thin"
            font.weight: Font.DemiBold
            anchors.top: txtHumidity.bottom
            anchors.left: txtHumidity.left
            anchors.bottom: parent.bottom
            anchors.right: txtHumidity.right
            anchors.bottomMargin: 16
            anchors.topMargin: 16
            width: parent.width / 2
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }
    CircleSlider{
        id:dimSlider
        property int sliderValue: 0
        anchors.top: parent.top
        anchors.topMargin: 32
        x: root.width / 2 + (root.width / 2  - size) / 2
        mColor: Colors.green
        size: 600
        mHeader: "Dim Light"
        mIcon: "images/light_off.svg"

        onMSliderValueChanged : function(val){
            let p = Math.floor(val / 5);
            if(p > dimSlider.sliderValue){
                controler.increaseDim();
                dimSlider.sliderValue = p;
            }else if(p < dimSlider.sliderValue){
                controler.decreaseDim();
                dimSlider.sliderValue = p;
            }
        }
    }

    RGBSlider{
        id: rgb
        anchors.top:dimSlider.bottom
        anchors.left: dimSlider.left
        anchors.right: dimSlider.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 32
        onMClickReleased: {
            controler.setColor(rectColor.r,rectColor.g,rectColor.b);
        }

        onRectColorChanged: {

        }
    }

    //    ArcSlider {
    //        id: arcSlider
    //        x: 622
    //        y: 115
    //        size: 320
    //        isRtl: false
    //        mColor: Colors.green
    //        mHeader: "Dim 1"
    //        z: 900
    //    }
    //    ArcSlider {
    //        id: arcSlider1
    //        x: 622 + 320
    //        y: 115
    //        size: 320
    //        isRtl: true
    //        mColor: Colors.blue
    //        mHeader: "Dim 2"
    //        z: 900
    //    }
    //    RGBSlider{
    //        id: rgb
    //        x: 622
    //        y: 435
    //        mHeight: 300
    //        mWidth: 640
    //        z: 900
    //    }

}


/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
