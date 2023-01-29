import QtQuick  
import QtQuick.Layouts
import QtQuick.Shapes  as Sh
import Qt5Compat.GraphicalEffects

Item{
    id: root
    property alias size: root.width
    property alias mColor : root.arcColor
    property alias mHeader: txtHeader.text
    property alias mIcon: imgIcon.source
    property color arcColor : Colors.green

    signal mSliderValueChanged(int val);
    width: size
    height: size

    Sh.Shape {
        x: 0
        y: 0
        width: root.size
        height: root.size
        antialiasing: true
        layer.enabled: true
        layer.samples: 8

        Sh.ShapePath {
            property int startAngle: 230
            property int sweepAngle: -340
            id: baseShapePath
            fillColor: Colors.gray6
            strokeColor: "transparent"
            strokeWidth: 0
            capStyle: Sh.ShapePath.RoundCap
            startX: root.getBaseArcEndX(baseShapePath.startAngle,
                                        0,
                                        root.size / 2 - root.size / 16, // size minus strok
                                        root.size / 2)
            startY: root.getBaseArcEndY(baseShapePath.startAngle,
                                        0,
                                        root.size / 2 - root.size / 16,
                                        root.size / 2)
            PathArc{
                x:root.getBaseArcEndX(baseShapePath.startAngle,
                                      baseShapePath.sweepAngle,
                                      root.size / 2 - root.size / 16, // size minus strok
                                      root.size / 2)
                y:root.getBaseArcEndY(baseShapePath.startAngle,
                                      baseShapePath.sweepAngle,
                                      root.size / 2 - root.size / 16, // size minus strok
                                      root.size / 2)
                radiusX: root.size / 2 - root.size / 16
                radiusY: root.size / 2 - root.size / 16
                direction: PathArc.Counterclockwise
                useLargeArc: true
            }
            PathArc{
                x:root.getBaseArcEndX(baseShapePath.startAngle,
                                      baseShapePath.sweepAngle,
                                      root.size / 2, // size minus strok
                                      root.size / 2)
                y:root.getBaseArcEndY(baseShapePath.startAngle,
                                      baseShapePath.sweepAngle,
                                      root.size / 2, // size minus strok
                                      root.size / 2)
                radiusX: root.size / 16 / 2
                radiusY: root.size / 16 / 2
                direction: PathArc.Clockwise
                useLargeArc: false
            }
            PathArc{
                x:root.getBaseArcEndX(baseShapePath.startAngle,
                                      0,
                                      root.size / 2 , // size minus strok
                                      root.size / 2)
                y:root.getBaseArcEndY(baseShapePath.startAngle,
                                      0,
                                      root.size / 2 , // size minus strok
                                      root.size / 2)
                radiusX: root.size / 2
                radiusY: root.size / 2
                direction: PathArc.Clockwise
                useLargeArc: true
            }
            PathArc{
                x:root.getBaseArcEndX(baseShapePath.startAngle,
                                      0,
                                      root.size / 2 - root.size / 16, // size minus strok
                                      root.size / 2)
                y:root.getBaseArcEndY(baseShapePath.startAngle,
                                      0,
                                      root.size / 2 - root.size / 16,
                                      root.size / 2)
                radiusX: root.size / 16 / 2
                radiusY: root.size / 16 / 2
                direction: PathArc.Clockwise
                useLargeArc: false
            }

        }

    }

    Sh.Shape {
        x: 0
        y: 0
        width: root.size
        height: root.size
        antialiasing: true
        layer.enabled: true
        layer.samples: 8

        Sh.ShapePath {
            property int startAngle: 230
            property int sweepAngle: 0
            id: precentShape
            fillColor: "#ffffff"
            fillGradient:  Sh.ConicalGradient {
                angle: (360 - precentShape.startAngle) - ((360 + precentShape.sweepAngle) / 2)
                centerX: root.size / 2; centerY: root.size /2
                GradientStop { position: 0.0; color: Colors.circleProgressGradiantTop }
                GradientStop { position: 1.0; color: Colors.circleProgressGradiantBottom }

            }
            strokeColor: "transparent"
            strokeWidth: 0
            capStyle: Sh.ShapePath.RoundCap
            startX: root.getBaseArcEndX(precentShape.startAngle,
                                        0,
                                        root.size / 2 - root.size / 16, // size minus strok
                                        root.size / 2)
            startY: root.getBaseArcEndY(precentShape.startAngle,
                                        0,
                                        root.size / 2 - root.size / 16,
                                        root.size / 2)
            PathArc{
                id: percentShapeArc1
                x:root.getBaseArcEndX(precentShape.startAngle,
                                      precentShape.sweepAngle,
                                      root.size / 2 - root.size / 16, // size minus strok
                                      root.size / 2)
                y:root.getBaseArcEndY(precentShape.startAngle,
                                      precentShape.sweepAngle,
                                      root.size / 2 - root.size / 16, // size minus strok
                                      root.size / 2)
                radiusX: root.size / 2 - root.size / 16
                radiusY: root.size / 2 - root.size / 16
                direction: PathArc.Counterclockwise
                useLargeArc: true
            }
            PathArc{
                x:root.getBaseArcEndX(precentShape.startAngle,
                                      precentShape.sweepAngle,
                                      root.size / 2, // size minus strok
                                      root.size / 2)
                y:root.getBaseArcEndY(precentShape.startAngle,
                                      precentShape.sweepAngle,
                                      root.size / 2, // size minus strok
                                      root.size / 2)
                radiusX: root.size / 16 / 2
                radiusY: root.size / 16 / 2
                direction: PathArc.Clockwise
                useLargeArc: false
            }
            PathArc{
                id: percentShapeArc2
                x:root.getBaseArcEndX(precentShape.startAngle,
                                      0,
                                      root.size / 2 , // size minus strok
                                      root.size / 2)
                y:root.getBaseArcEndY(precentShape.startAngle,
                                      0,
                                      root.size / 2 , // size minus strok
                                      root.size / 2)
                radiusX: root.size / 2
                radiusY: root.size / 2
                direction: PathArc.Clockwise
                useLargeArc: true
            }
            PathArc{
                x:root.getBaseArcEndX(precentShape.startAngle,
                                      0,
                                      root.size / 2 - root.size / 16, // size minus strok
                                      root.size / 2)
                y:root.getBaseArcEndY(precentShape.startAngle,
                                      0,
                                      root.size / 2 - root.size / 16,
                                      root.size / 2)
                radiusX: root.size / 16 / 2
                radiusY: root.size / 16 / 2
                direction: PathArc.Clockwise
                useLargeArc: false
            }
        }



    }
    MouseArea{
        id: percentMouseArea
        anchors.fill: parent
        property bool pressActive: false;
        onPressed: {
            percentMouseArea.pressActive = true;
        }
        onReleased: {
            percentMouseArea.pressActive = false;
        }
        onPositionChanged: {
            if(!percentMouseArea.pressActive) return;
            let x = mouse.x - root.size / 2;
            let y = -(mouse.y - root.size / 2);
            let teta =root.radians_to_degrees(Math.atan2(y,x));
            let startAngle = 360 - baseShapePath.startAngle;
            let value = teta - startAngle;
            value = value >= 0 ? value : value + 360;
            let totalAngle = Math.abs(baseShapePath.sweepAngle);
            if(value < 180){
                percentShapeArc1.useLargeArc = false;
                percentShapeArc2.useLargeArc = false;
            }
            else {
                percentShapeArc1.useLargeArc = true;
                percentShapeArc2.useLargeArc = true;
            }

            let precent = (value * 100) / totalAngle;
            precent = precent < 0 ? 0 : precent;
            precent = precent > 100 ? 100 : precent;
            root.mSliderValueChanged(precent);
            let result = (baseShapePath.sweepAngle * precent) / 100;
            precentShape.sweepAngle = result;
        }
    }
        Text {
            id: txtPercent
            text: ((precentShape.sweepAngle * 100 / baseShapePath.sweepAngle )).toFixed(0) + "%"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            y: root.size / 2
            height: root.size / 2
            color: Colors.white
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            font.family: "Cooper Hewitt"
            font.pixelSize: 100
            font.styleName: "Thin"
            font.weight: Font.Bold
        }
        Image {
            property int size: 128
            id: imgIcon
            source: ""
            x: root.size / 2 - (imgIcon.size * 1.5)
            y: root.size / 2 - (imgIcon.size )
            width: size
            height: size
            fillMode: Image.PreserveAspectFit

        }
        ColorOverlay {
            anchors.fill: imgIcon
            source: imgIcon
            color: Colors.white
        }

        Text {
            id: txtHeader
            text: "DIM"
            anchors.left: imgIcon.right
            anchors.right: parent.right
            anchors.top: parent.top
            y: 0
            height: root.size / 2
            color: Colors.white
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignBottom
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

    function radians_to_degrees(radians)
    {
        var pi = Math.PI;
        return (radians * 180) / pi;
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
