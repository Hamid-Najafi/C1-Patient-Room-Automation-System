import QtQuick  
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects
import com.nourbakhsh.RestaurantModel

Item {
    id: root
    property alias mWidth: root.width
    property alias mHeight: root.height
    property int itemSize: 150
    width: 1920
    height: 780

    RestaurantModel{
        id: context
    }

    Component.onCompleted: {
        context.readData();
        for(let i = 0 ;i< context.model.length;i++){
            var item = itemComponent.createObject(itemsLayout,
                                                  {
                                                      mHeader: context.model[i].header,
                                                      mSubHeader: context.model[i].subHeader,
                                                      mIcon: context.model[i].icon,
                                                      mPrice: context.model[i].price.toString() + " هزار تومان"
                                                  });
            console.log(item);
        }
    }

    Component{
        id: itemComponent
        RestaurantItem{
            mHeader: ""
            mSubHeader: ""
            mIcon: ""
            mPrice: ""
            mSize: root.itemSize
            Layout.alignment: Qt.AlignCenter
        }
    }

    Flickable {
        anchors.fill: parent
        contentHeight: itemsLayout.height
        contentWidth: itemsLayout.width
        anchors.margins: 32

        GridLayout{
            id: itemsLayout
            width: Constants.width
            columns: 3
            rowSpacing: 16
            columnSpacing: 32
        }
    }




}
