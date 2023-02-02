import QtQuick
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts

Item {
    id: root
    property alias mWidth: root.width
    property alias mState: root.state
    property int currentIndex: 1
    signal interacting(bool value);
    signal pageChanged(int index);
    state: "ready"
    width: 512
    height: Constants.pagerSize

    Rectangle{
        id: glowRect
        anchors.fill: parent
        radius: Constants.pagerSize / 2
        color: Colors.elementColor
    }


    ConicalGradient{
        anchors.fill: glowRect
        angle: 45
        source: glowRect
        gradient: Gradient {
            GradientStop { position: 0.0; color: Colors.circleProgressGradiantTop }
            GradientStop { position: 0.8; color: Colors.circleProgressGradiantBottom }
            GradientStop { position: 1.0; color: Colors.circleProgressGradiantTop }
        }
    }

    Rectangle{
        id: rectOuter
        anchors.fill: parent
        anchors.margins: 4
        radius: Constants.pagerSize / 2
        color: Colors.elementColor
    }

    PagerIcon{
        id: icnDashboard
        mSize: Constants.pagerSize - 8 * 2 // top and bottom margins
        mIcon: "images/dashboard.svg"
        x: root.getXPositionForIcon(0,8);
        y: 8
        mIndex: 1
        onMClicked: {root.currentIndex = mIndex; root.pageChanged(mIndex);}
        onMHovered: root.interacting(true);
        onMExited: root.interacting(false);

    }
    ConicalGradient{
        anchors.fill: icnDashboard
        angle: 45
        source: icnDashboard
        visible: root.currentIndex == icnDashboard.mIndex
        gradient: Gradient {
            GradientStop { position: 0.0; color: Colors.circleProgressGradiantTop }
            GradientStop { position: 0.8; color: Colors.circleProgressGradiantBottom }
            GradientStop { position: 1.0; color: Colors.circleProgressGradiantTop }
        }
    }


    PagerIcon{
        id: icnWeb
        mSize: Constants.pagerSize - 8 * 2 // top and bottom margins
        mIcon: "images/web_browsing.svg"
        x: root.getXPositionForIcon(1,8);
        y: 8
        mIndex: 2
        onMClicked: {root.currentIndex = mIndex; root.pageChanged(mIndex);}
        onMHovered: root.interacting(true);
        onMExited: root.interacting(false);
    }
    ConicalGradient{
        anchors.fill: icnWeb
        angle: 45
        source: icnWeb
        visible: root.currentIndex == icnWeb.mIndex
        gradient: Gradient {
            GradientStop { position: 0.0; color: Colors.circleProgressGradiantTop }
            GradientStop { position: 0.8; color: Colors.circleProgressGradiantBottom }
            GradientStop { position: 1.0; color: Colors.circleProgressGradiantTop }
        }
    }


    PagerIcon{
        id:icnEntertainment
        mSize: Constants.pagerSize - 8 * 2 // top and bottom margins
        mIcon: "images/entertainment.svg"
        x: root.getXPositionForIcon(2,8);
        y: 8
        mIndex: 3
        onMClicked: {root.currentIndex = mIndex; root.pageChanged(mIndex);}
        onMHovered: root.interacting(true);
        onMExited: root.interacting(false);
    }
    ConicalGradient{
        anchors.fill: icnEntertainment
        angle: 45
        source: icnEntertainment
        visible: root.currentIndex == icnEntertainment.mIndex
        gradient: Gradient {
            GradientStop { position: 0.0; color: Colors.circleProgressGradiantTop }
            GradientStop { position: 0.8; color: Colors.circleProgressGradiantBottom }
            GradientStop { position: 1.0; color: Colors.circleProgressGradiantTop }
        }
    }

    PagerIcon{
        id: icnTv
        mSize: Constants.pagerSize - 8 * 2 // top and bottom margins
        mIcon: "images/tv.svg"
        x: root.getXPositionForIcon(3,8);
        y: 8
        mIndex: 4
        onMClicked: {root.currentIndex = mIndex; root.pageChanged(mIndex);}
        onMHovered: root.interacting(true);
        onMExited: root.interacting(false);
    }
    ConicalGradient{
        anchors.fill: icnTv
        angle: 45
        source: icnTv
        visible: root.currentIndex == icnTv.mIndex
        gradient: Gradient {
            GradientStop { position: 0.0; color: Colors.circleProgressGradiantTop }
            GradientStop { position: 0.8; color: Colors.circleProgressGradiantBottom }
            GradientStop { position: 1.0; color: Colors.circleProgressGradiantTop }
        }
    }


    PagerIcon{
        id: icnFood
        mSize: Constants.pagerSize - 8 * 2 // top and bottom margins
        mIcon: "images/food_drink.svg"
        x: root.getXPositionForIcon(4,8);
        y: 8
        mIndex: 5
        onMClicked: {root.currentIndex = mIndex; root.pageChanged(mIndex);}
        onMHovered: root.interacting(true);
        onMExited: root.interacting(false);
    }
    ConicalGradient{
        anchors.fill: icnFood
        angle: 45
        source: icnFood
        visible: root.currentIndex == icnFood.mIndex
        gradient: Gradient {
            GradientStop { position: 0.0; color: Colors.circleProgressGradiantTop }
            GradientStop { position: 0.8; color: Colors.circleProgressGradiantBottom }
            GradientStop { position: 1.0; color: Colors.circleProgressGradiantTop }
        }
    }


    PagerIcon{
        id: idHis
        mSize: Constants.pagerSize - 8 * 2 // top and bottom margins
        mIcon: "images/his.svg"
        x: root.getXPositionForIcon(5,8);
        y: 8
        mIndex: 6
        onMClicked: {root.currentIndex = mIndex; root.pageChanged(mIndex);}
        onMHovered: root.interacting(true);
        onMExited: root.interacting(false);
    }
    ConicalGradient{
        anchors.fill: idHis
        angle: 45
        source: idHis
        visible: root.currentIndex == idHis.mIndex
        gradient: Gradient {
            GradientStop { position: 0.0; color: Colors.circleProgressGradiantTop }
            GradientStop { position: 0.8; color: Colors.circleProgressGradiantBottom }
            GradientStop { position: 1.0; color: Colors.circleProgressGradiantTop }
        }
    }


    PagerIcon{
        id:icnNurseCall
        mSize: Constants.pagerSize - 8 * 2 // top and bottom margins
        mIcon: "images/nurse_call.svg"
        x: root.getXPositionForIcon(6,8);
        y: 8
        mIndex: 7
        onMClicked: {root.currentIndex = mIndex; root.pageChanged(mIndex);}
        onMHovered: root.interacting(true);
        onMExited: root.interacting(false);
    }
    ConicalGradient{
        anchors.fill: icnNurseCall
        angle: 45
        source: icnNurseCall
        visible: root.currentIndex == icnNurseCall.mIndex
        gradient: Gradient {
            GradientStop { position: 0.0; color: Colors.circleProgressGradiantTop }
            GradientStop { position: 0.8; color: Colors.circleProgressGradiantBottom }
            GradientStop { position: 1.0; color: Colors.circleProgressGradiantTop }
        }
    }


    PagerIcon{
        id: icnCardReader
        mSize: Constants.pagerSize - 8 * 2 // top and bottom margins
        mIcon: "images/card_reader.svg"
        x: root.getXPositionForIcon(7,8);
        y: 8
        mIndex: 8
        onMClicked: {root.currentIndex = mIndex; root.pageChanged(mIndex);}
        onMHovered: root.interacting(true);
        onMExited: root.interacting(false);
    }
    ConicalGradient{
        anchors.fill: icnCardReader
        angle: 45
        source: icnCardReader
        visible: root.currentIndex == icnCardReader.mIndex
        gradient: Gradient {
            GradientStop { position: 0.0; color: Colors.circleProgressGradiantTop }
            GradientStop { position: 0.8; color: Colors.circleProgressGradiantBottom }
            GradientStop { position: 1.0; color: Colors.circleProgressGradiantTop }
        }
    }

    function getXPositionForIcon(index , total){
        var size = Constants.pagerSize - 8 * 2;
        var totalSize = size * total;
        var margin = (root.width - totalSize) / (total + 1)
        var startX = 0;
        return index * size + startX + (index + 1) * margin;
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
