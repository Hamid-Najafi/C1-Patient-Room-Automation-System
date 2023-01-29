pragma Singleton
import QtQuick


QtObject {
    readonly property int width: 1920
    readonly property int height: 1080

    readonly property int topBarClosedHeigth: 92
    readonly property int topBarBaseHeigth: 45
    readonly property int topBarOpenedHeigth: 316

    readonly property int collapseDivSive: 60
    readonly property int activeDivSive: 100

    readonly property int pagerSize: 96

    property string relativeFontDirectory: "fonts"

    /* Edit this comment to add your custom font */
    readonly property font font: Qt.font({
                                             family: Qt.application.font.family,
                                             pixelSize: Qt.application.font.pixelSize
                                         })
    readonly property font largeFont: Qt.font({
                                                  family: Qt.application.font.family,
                                                  pixelSize: Qt.application.font.pixelSize * 1.6
                                              })

    readonly property color backgroundColor: "#c2c2c2"


}
