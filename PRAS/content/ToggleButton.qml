

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects
import com.nourbakhsh.ToggleButtonViewModel 1.0

Item {

    property alias mWidth: root.width
    property alias mHeight: root.height
    property alias mHeader: context.header
    property alias mIconOff: context.iconOff
    property alias mIconOn: context.iconOn
    property alias mState: context.state
    property alias mOffString: context.offString
    property alias mOnString: context.onString

    signal mContextStateChanged(bool value  )

    property color defaultColor: Backend.colorTransparency(Colors.elementColor , 1)
    property color defaultShadow: Backend.colorTransparency(Colors.elementColor , .3)

    id: root
    width: 384
    height: 260

    ToggleButtonViewModel {
        id: context
        header: "header"
        onStateChanged: {
            root.mContextStateChanged(context.state)
            root.checkState();
        }
    }
    Rectangle {
        id: rectBackground
        anchors.fill: parent
        radius: 8
        LinearGradient{
            anchors.fill: parent
            source: parent
            start: Qt.point(0,0)
            end: Qt.point(rectBackground.width,rectBackground.height)
            gradient:  Gradient {
                GradientStop { id: color1; position: 0.0; color: root.defaultColor }
                GradientStop { id: color2; position: .8; color: root.defaultColor }

            }
        }
    }

    DropShadow {
        id: rectShadow
        anchors.fill: rectBackground
        horizontalOffset: 16
        verticalOffset: 16
        radius: 8.0
        color: root.defaultShadow
    }
    Text {
        id: txtHeader
        text: context.header
        color: Colors.white1
        anchors.left: imgIcon.right
        anchors.leftMargin: 16
        anchors.right: parent.right
        anchors.rightMargin: 8
        height: 64
        y: (root.height / 2 - 64 - 8)
        horizontalAlignment: Text.AlignBottom
        font.family: "Cooper Hewitt"
        font.pixelSize: 40
        font.styleName: "Light"
        font.weight: Font.DemiBold
    }

    Text {
        id: txtSubHeader
        text: context.subHeader
        color: Colors.gray1
        anchors.left: imgIcon.right
        anchors.leftMargin: 16
        anchors.right: parent.right
        anchors.rightMargin: 8
        height: 64
        y: (root.height / 2 + 8)
        horizontalAlignment: Text.AlignTop
        font.family: "Cooper Hewitt"
        font.pixelSize: 28
        font.styleName: "Semibold"
        font.weight: Font.DemiBold
    }

    Image {
        property int size: 128
        id: imgIcon
        source: context.icon
        x: 32
        y: (root.height - size) / 2;
        width: size
        height: size
        fillMode: Image.PreserveAspectFit

    }
    ColorOverlay {
        anchors.fill: imgIcon
        source: imgIcon
        color: Colors.white
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("Toggle Button Clicked");
            context.toggleState();
        }
    }
    Component.onCompleted: {
        root.checkState();
    }

    function checkState(){
        console.log(" Checking Status");
        if(context.state)
        {
            txtSubHeader.text = context.onString;
            color1.color = Colors.toggleButtonGradiantTop;
            color2.color = Colors.toggleButtonGradiantBottom;
            rectShadow.color = Backend.colorTransparency(Colors.ToggleButtonGradiantTop , .3);
        }
        else
        {
            txtSubHeader.text = context.offString;
            color1.color = root.defaultColor;
            color2.color = root.defaultColor;
            rectShadow.color = root.defaultShadow;
        }
    }
}
