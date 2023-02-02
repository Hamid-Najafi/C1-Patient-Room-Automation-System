import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

Item {
    id: root
    property alias mWidth: root.width
    property alias mHeight: root.height
    property int itemSize: 256
    property alias number: txtNumber.text
    width: 1920
    height: 780

    property int dialWidth: root.width / 2 / 6
    property int dialHeight: root.height / 7
    property int dialWidthMargin: 14
    property int dialHeightMargin: 8

    property int contactWidth: root.width / 2 / 2
    property int contactHeight: root.height / 6
    property int contactWidthMargin: 16
    property int contactHeightMargin: 8


    Flickable {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        contentHeight: itemsLayout.height
        contentWidth: itemsLayout.width
        width: root.width / 2
        anchors.margins: 32


        GridLayout{
            id: itemsLayout
            width: Constants.width
            columns: 3
            rowSpacing: 16
            columnSpacing: 32
        }
    }


    Text {
        id: txtNumber
        text: ""
        color: Colors.white1
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Cooper Hewitt"
        font.pixelSize: 50
        font.styleName: "Light"
        font.weight: Font.DemiBold
        x : root.getDialPositionX(0,0)
        y : root.getDialPositionY(0,0)
        width: root.dialWidth * 4 - 2 * root.dialWidthMargin
        height: root.dialHeight - 2 * root.dialHeightMargin
        Rectangle{
            anchors.top: txtNumber.bottom
            anchors.left: txtNumber.left
            anchors.right: txtNumber.right
            height: 2
            color: Colors.white
        }
    }



    DialButton{
        mWidth: root.dialWidth - 2 * root.dialWidthMargin
        mHeight: root.dialHeight - 2 * root.dialHeightMargin
        x : root.getDialPositionX(1,0) + root.dialWidthMargin
        y : root.getDialPositionY(1,0) + root.dialHeightMargin
        mTitle: "1"
        mValue: "1"
        onMDialClicked: function(value){
            root.number = root.number + value;
        }
    }
    DialButton{
        mWidth: root.dialWidth - 2 * root.dialWidthMargin
        mHeight: root.dialHeight - 2 * root.dialHeightMargin
        x : root.getDialPositionX(1,1) + root.dialWidthMargin
        y : root.getDialPositionY(1,1) + root.dialHeightMargin
        mTitle: "2"
        mValue: "2"
        onMDialClicked: function(value){
            root.number = root.number + value;
        }
    }

    DialButton{
        mWidth: root.dialWidth - 2 * root.dialWidthMargin
        mHeight: root.dialHeight - 2 * root.dialHeightMargin
        x : root.getDialPositionX(1,2) + root.dialWidthMargin
        y : root.getDialPositionY(1,2) + root.dialHeightMargin
        mTitle: "3"
        mValue: "3"
        onMDialClicked: function(value){
            root.number = root.number + value;
        }
    }

    DialButton{
        mWidth: root.dialWidth - 2 * root.dialWidthMargin
        mHeight: root.dialHeight - 2 * root.dialHeightMargin
        x : root.getDialPositionX(2,0) + root.dialWidthMargin
        y : root.getDialPositionY(2,0) + root.dialHeightMargin
        mTitle: "4"
        mValue: "4"
        onMDialClicked: function(value){
            root.number = root.number + value;
        }
    }
    DialButton{
        mWidth: root.dialWidth - 2 * root.dialWidthMargin
        mHeight: root.dialHeight - 2 * root.dialHeightMargin
        x : root.getDialPositionX(2,1) + root.dialWidthMargin
        y : root.getDialPositionY(2,1) + root.dialHeightMargin
        mTitle: "5"
        mValue: "5"
        onMDialClicked: function(value){
            root.number = root.number + value;
        }
    }

    DialButton{
        mWidth: root.dialWidth - 2 * root.dialWidthMargin
        mHeight: root.dialHeight - 2 * root.dialHeightMargin
        x : root.getDialPositionX(2,2) + root.dialWidthMargin
        y : root.getDialPositionY(2,2) + root.dialHeightMargin
        mTitle: "6"
        mValue: "6"
        onMDialClicked: function(value){
            root.number = root.number + value;
        }
    }

    DialButton{
        mWidth: root.dialWidth - 2 * root.dialWidthMargin
        mHeight: root.dialHeight - 2 * root.dialHeightMargin
        x : root.getDialPositionX(3,0) + root.dialWidthMargin
        y : root.getDialPositionY(3,0) + root.dialHeightMargin
        mTitle: "7"
        mValue: "7"
        onMDialClicked: function(value){
            root.number = root.number + value;
        }
    }
    DialButton{
        mWidth: root.dialWidth - 2 * root.dialWidthMargin
        mHeight: root.dialHeight - 2 * root.dialHeightMargin
        x : root.getDialPositionX(3,1) + root.dialWidthMargin
        y : root.getDialPositionY(3,1) + root.dialHeightMargin
        mTitle: "8"
        mValue: "8"
        onMDialClicked: function(value){
            root.number = root.number + value;
        }
    }

    DialButton{
        mWidth: root.dialWidth - 2 * root.dialWidthMargin
        mHeight: root.dialHeight - 2 * root.dialHeightMargin
        x : root.getDialPositionX(3,2) + root.dialWidthMargin
        y : root.getDialPositionY(3,2) + root.dialHeightMargin
        mTitle: "9"
        mValue: "9"
        onMDialClicked: function(value){
            root.number = root.number + value;
        }
    }

    DialButton{
        mWidth: root.dialWidth - 2 * root.dialWidthMargin
        mHeight: root.dialHeight - 2 * root.dialHeightMargin
        x : root.getDialPositionX(4,0) + root.dialWidthMargin
        y : root.getDialPositionY(4,0) + root.dialHeightMargin
        mTitle: "*"
        mValue: "*"
        onMDialClicked: function(value){
            root.number = root.number + value;
        }
    }
    DialButton{
        mWidth: root.dialWidth - 2 * root.dialWidthMargin
        mHeight: root.dialHeight - 2 * root.dialHeightMargin
        x : root.getDialPositionX(4,1) + root.dialWidthMargin
        y : root.getDialPositionY(4,1) + root.dialHeightMargin
        mTitle: "0"
        mValue: "0"
        onMDialClicked: function(value){
            root.number = root.number + value;
        }
    }

    DialButton{
        mWidth: root.dialWidth - 2 * root.dialWidthMargin
        mHeight: root.dialHeight - 2 * root.dialHeightMargin
        x : root.getDialPositionX(4,2) + root.dialWidthMargin
        y : root.getDialPositionY(4,2) + root.dialHeightMargin
        mTitle: "#"
        mValue: "#"
        onMDialClicked: function(value){
            root.number = root.number + value;
        }
    }

    DialButton{
        mWidth: root.dialWidth - 2 * root.dialWidthMargin
        mHeight: root.dialHeight * 2 - 2 * root.dialHeightMargin
        x : root.getDialPositionX(1,3) + root.dialWidthMargin
        y : root.getDialPositionY(1,3) + root.dialHeightMargin
        mTitle: "←"
        mValue: "←"
        onMDialClicked: function(value){
            root.number = root.number.substring(0, root.number.length - 1);
        }
    }

    DialButton{
        mWidth: root.dialWidth - 2 * root.dialWidthMargin
        mHeight: root.dialHeight - 2 * root.dialHeightMargin
        x : root.getDialPositionX(3,3) + root.dialWidthMargin
        y : root.getDialPositionY(3,3) + root.dialHeightMargin
        mTitle: "✆"
        mValue: "✆"
        onMDialClicked: function(value){
        }
    }

    Text {
        text: "Quick Contact"
        color: Colors.white1
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.family: "Cooper Hewitt"
        font.pixelSize: 50
        font.styleName: "Light"
        font.weight: Font.DemiBold
        x : root.getContactPositionX(0,0)
        y : root.getContactPositionY(0,0)
        width: root.contactWidth * 2 - 2 * root.contactWidthMargin
        height: root.contactHeight- 2 * root.contactHeightMargin
    }

    DialButton{
        mWidth: root.contactWidth - 2 * root.contactWidthMargin
        mHeight: root.contactHeight - 2 * root.contactHeightMargin
        x : root.getContactPositionX(1,0) + root.contactWidthMargin
        y : root.getContactPositionY(1,0) + root.contactHeightMargin
        mTitle: "Nurse Station"
        mValue: "7001"
        onMDialClicked: function(value){
            root.number = mValue;
        }
    }
    DialButton{
        mWidth: root.contactWidth - 2 * root.contactWidthMargin
        mHeight: root.contactHeight - 2 * root.contactHeightMargin
        x : root.getContactPositionX(1,1) + root.contactWidthMargin
        y : root.getContactPositionY(1,1) + root.contactHeightMargin
        mTitle: "Pharmacy"
        mValue: "8001"
        onMDialClicked: function(value){
            root.number = mValue;
        }
    }

    DialButton{
        mWidth: root.contactWidth - 2 * root.contactWidthMargin
        mHeight: root.contactHeight - 2 * root.contactHeightMargin
        x : root.getContactPositionX(2,0) + root.contactWidthMargin
        y : root.getContactPositionY(2,0) + root.contactHeightMargin
        mTitle: "Management"
        mValue: "3001"
        onMDialClicked: function(value){
            root.number = mValue;
        }
    }

    DialButton{
        mWidth: root.contactWidth - 2 * root.contactWidthMargin
        mHeight: root.contactHeight - 2 * root.contactHeightMargin
        x : root.getContactPositionX(2,1) + root.contactWidthMargin
        y : root.getContactPositionY(2,1) + root.contactHeightMargin
        mTitle: "Accounting"
        mValue: "4001"
        onMDialClicked: function(value){
            root.number = mValue;
        }
    }

    DialButton{
        mWidth: root.contactWidth - 2 * root.contactWidthMargin
        mHeight: root.contactHeight - 2 * root.contactHeightMargin
        x : root.getContactPositionX(3,0) + root.contactWidthMargin
        y : root.getContactPositionY(3,0) + root.contactHeightMargin
        mTitle: "Patient discharge"
        mValue: "7004"
        onMDialClicked: function(value){
            root.number = mValue;
        }
    }


    function getDialPositionX(row , column){
        let startX = root.width / 2 + root.dialWidth;
        let x = column * root.dialWidth;
        return x + startX;

    }
    function getDialPositionY(row , column){
        let startY = root.dialHeight
        let y = row * root.dialHeight;
        return y + startY;
    }

    function getContactPositionX(row , column){
        let startX = root.contactWidthMargin;
        let x = column * root.contactWidth;
        return x + startX;

    }
    function getContactPositionY(row , column){
        let startY = root.contactHeight
        let y = row * root.contactHeight;
        return y + startY;
    }


}
