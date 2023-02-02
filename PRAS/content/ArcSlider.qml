import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes

Item{
    id: root
    property alias size: root.width
    property alias isRtl : root.rtl
    property alias mColor : root.arcColor
    property alias mHeader : txtHeader.text
    property bool rtl : false
    property color arcColor : Colors.green

    width: size
    height: size

    Shape {
        x: (root.rtl ? 0 : root.size / 2)
        width: root.size / 2
        height: root.size
        antialiasing: true
        layer.enabled: true
        layer.samples: 8

        ShapePath {
            id:baseShapePath
            fillColor: "#01ffffff"
            strokeColor: Colors.gray6
            strokeWidth: root.size / 16
            capStyle: ShapePath.FlatCap

            PathAngleArc {
                id: baseArc
                centerX: (root.rtl ? 0 : root.size / 2)
                centerY: root.size / 2
                radiusX: root.size / 2 - root.size / 16; radiusY: root.size / 2 - root.size / 16
                startAngle:  (root.rtl ? 80 : 100)
                sweepAngle: (root.rtl ? -150 : 150)
            }
        }
        ShapePath {

            fillColor: "#01ffffff"
            strokeColor: Colors.gray6
            strokeWidth: root.size / 16 - 2
            capStyle: ShapePath.FlatCap

            PathAngleArc {
                centerX: root.getBaseArcEndX(baseArc.startAngle,baseArc.sweepAngle,baseArc.radiusX,baseArc.centerX)
                centerY: root.getBaseArcEndY(baseArc.startAngle,baseArc.sweepAngle,baseArc.radiusY,baseArc.centerY)
                radiusX: 1; radiusY:1
                startAngle: 0
                sweepAngle: 360
            }
        }
        ShapePath {

            fillColor: "#01ffffff"
            strokeColor: Colors.gray6
            strokeWidth: root.size / 16 - 2
            capStyle: ShapePath.FlatCap

            PathAngleArc {
                centerX: root.getBaseArcEndX(baseArc.startAngle,0,baseArc.radiusX,baseArc.centerX)
                centerY: root.getBaseArcEndY(baseArc.startAngle,0,baseArc.radiusY,baseArc.centerY)
                radiusX: 1; radiusY:1
                startAngle: 0
                sweepAngle: 360
            }
        }


    }
    Shape {
//    x: (root.rtl? 0 : 256)
        id: precentShape
        x:  (root.rtl ? 0 : root.size / 2)
        width: root.size / 2
        height: root.size
        antialiasing: true
        layer.enabled: true
        layer.samples: 8

        ShapePath {
            id:precentShapePath
            fillColor: "#01ffffff"
            strokeColor: arcColor
            strokeWidth: root.size / 16
            capStyle: ShapePath.FlatCap

            PathAngleArc {
                id: precentArc
                centerX: (root.rtl ? 0 : root.size / 2)
                centerY: root.size / 2
                radiusX: root.size / 2 - root.size / 16; radiusY: root.size / 2 - root.size / 16
                startAngle:  (root.rtl ? 80 : 100)
                sweepAngle: (root.rtl ? -100 : 100)
            }
        }
        ShapePath {

            fillColor: "#01ffffff"
            strokeColor: arcColor
            strokeWidth: root.size / 16 - 2
            capStyle: ShapePath.FlatCap

            PathAngleArc {
                centerX: root.getBaseArcEndX(precentArc.startAngle,precentArc.sweepAngle,precentArc.radiusX,precentArc.centerX)
                centerY: root.getBaseArcEndY(precentArc.startAngle,precentArc.sweepAngle,precentArc.radiusY,precentArc.centerY)
                radiusX: 1; radiusY:1
                startAngle: 0
                sweepAngle: 360
            }
        }
        ShapePath {

            fillColor: "#01ffffff"
            strokeColor: arcColor
            strokeWidth: root.size / 16 - 2
            capStyle: ShapePath.FlatCap

            PathAngleArc {
                centerX: root.getBaseArcEndX(precentArc.startAngle,0,precentArc.radiusX,precentArc.centerX)
                centerY: root.getBaseArcEndY(precentArc.startAngle,0,precentArc.radiusY,precentArc.centerY)
                radiusX: 1; radiusY:1
                startAngle: 0
                sweepAngle: 360
            }
        }

        MouseArea{
            id: percentMouseArea
            anchors.fill: parent
            property double pressPosition: 0;
            property double startPercent: 0;
            property bool pressActive: false;
            onPressed: {
                percentMouseArea.pressPosition = mouse.y;
                percentMouseArea.pressActive = true;
                percentMouseArea.startPercent = (precentArc.sweepAngle * 100 / baseArc.sweepAngle );
            }
            onReleased: {
                percentMouseArea.pressPosition = 0;
                percentMouseArea.pressActive = false;
                percentMouseArea.startPercent = 0;
            }
            onPositionChanged: {
                if(!percentMouseArea.pressActive) return;
                let diff =  percentMouseArea.pressPosition - mouse.y;
                let precent = (diff * 100) / root.size;
                let precent2 = precent + percentMouseArea.startPercent;
                precent2 = (precent2 > 100) ? 100 : precent2;
                precent2 = (precent2 < 0) ? 0 : precent2 ;
                let result = (baseArc.sweepAngle * precent2) / 100;
                precentArc.sweepAngle = result;
            }
        }


    }
    Text {
        id: txtPercent
        text: ((precentArc.sweepAngle * 100 / baseArc.sweepAngle )).toFixed(0) + "%"
        anchors.fill: parent
        anchors.leftMargin: (rtl? 0 : precentShapePath.strokeWidth)
        anchors.rightMargin: (rtl? precentShapePath.strokeWidth : 0)
        color: Colors.white
        width: precentArc.radiusX
        height:  precentArc.radiusY
        horizontalAlignment: (rtl? Qt.AlignLeft: Qt.AlignRight )
        verticalAlignment: Qt.AlignVCenter
        font.family: "Cooper Hewitt"
        font.pixelSize: 48
        font.styleName: "Thin"
        font.weight: Font.Bold
    }

    Text {
        id: txtHeader
        text: "DIM"
        anchors.fill: parent
        anchors.leftMargin: (rtl? precentShapePath.strokeWidth : 0)
        anchors.rightMargin: (rtl? 0 : precentShapePath.strokeWidth)
        color: Colors.white
        width: precentArc.radiusX
        height:  precentArc.radiusY
        horizontalAlignment: (rtl? Qt.AlignRight: Qt.AlignLeft )
        verticalAlignment: Qt.AlignVCenter
        font.family: "Cooper Hewitt"
        font.pixelSize: 64
        font.styleName: "Thin"
        font.weight: Font.DemiBold
    }

    function getBaseArcEndX(startAngle, sweepAngle,radius ,center ){
        let angle =degrees_to_radians(   360 - startAngle - sweepAngle);
        let x = (center ) + (Math.cos(angle) * radius);// This is available in all editors.
        return x;
    }

    function getBaseArcEndY(startAngle, sweepAngle,radius ,center){
        let angle =degrees_to_radians(  360 - startAngle - sweepAngle);
        let y = (center ) - ( Math.sin(angle) * radius);
        return y;
    }

    function degrees_to_radians(degrees)
    {
      var pi = Math.PI;
      return degrees * (pi/180);
    }
    function getPercent(){
        console.log(Number.toString((precentArc.sweepAngle * 100 / baseArc.sweepAngle )) + "%");
        return Number.toString((precentArc.sweepAngle * 100 / baseArc.sweepAngle )) + "%"
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.25}
}
##^##*/
