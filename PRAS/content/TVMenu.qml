import QtQuick  
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects
import com.nourbakhsh.TVModel
import QtWebEngine

Item {
    id: root
    property alias mWidth: root.width
    property alias mHeight: root.height
    property int itemSize: 256
    width: 1920
    height: 780

    TVModel{
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
                                                      mLink: context.model[i].link
                                                  });
            console.log(item);
        }
    }

    Component{
        id: itemComponent
        TVItem{
            mHeader: ""
            mSubHeader: ""
            mIcon: ""
            mLink: ""
            mSize: root.itemSize
            Layout.alignment: Qt.AlignCenter
            onMClicked:{
                console.log(mLink);
                webView.url = mLink;
                webView.visible = true;
            }
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
    WebEngineView{
        id:webView
        anchors.fill: parent
        state: "FullScreen"
        url: ""
        visible: false

    }




}
