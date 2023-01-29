

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

    id: root
    width: 384
    height: 260

    ToggleButtonViewModel {
        id: context
        header: "header"
        onStateChanged: {
            root.mContextStateChanged(context.state)
            if(context.state)
                txtSubHeader.text = context.onString
            else
                txtSubHeader.text = context.offString
        }
    }
    Rectangle {
        id: rectBackground
        anchors.fill: parent
        color: Colors.gray9
    }

    DropShadow {
        anchors.fill: rectBackground
        horizontalOffset: 16
        verticalOffset: 16
        radius: 8.0
        color: Colors.gray7
    }
    Text {
        id: txtHeader
        text: context.header
        color: Colors.white1
        x: 32
        y: (root.height/2) - txtHeader.height
        font.family: "Cooper Hewitt"
        font.pixelSize: 50
        font.styleName: "Thin"
        font.weight: Font.DemiBold
    }

    Text {
        id: txtSubHeader
        text: context.subHeader
        color: Colors.gray3
        x: 32
        y: (root.height/2)
        font.family: "Cooper Hewitt"
        font.pixelSize: 48
        font.styleName: "Bold Italic"
        font.weight: Font.DemiBold
    }

    Image {
        id: imgIcon
        source: context.icon
        anchors.right: root.right
        anchors.top: root.top
        anchors.bottom: root.bottom
        anchors.topMargin: 32
        anchors.bottomMargin: 32
        anchors.rightMargin: 32
        width: 128
        height: 128
        Layout.row: 1
        Layout.column: 1
        fillMode: Image.PreserveAspectFit
        ColorOverlay {
            anchors.fill: parent
            source: parent
            color: "#ffffff"
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            context.toggleState();
        }
    }
    Component.onCompleted: {
        if(context.state)
            txtSubHeader.text = context.onString
        else
            txtSubHeader.text = context.offString
    }
}
