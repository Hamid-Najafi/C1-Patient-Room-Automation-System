import QtQuick
import QtWebEngine
import Qt.labs.settings
import QtQml
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects

Item {
    id: browserWindow
    property Item currentWebView: tabBar.currentIndex < tabBar.count ? tabLayout.children[tabBar.currentIndex] : null
    property QtObject defaultProfile: WebEngineProfile {
        storageName: "Profile"
        offTheRecord: false
    }
    property int createdTabs: 0
    property alias mTitle: browserWindow.title
    property alias mWidth: browserWindow.width
    property alias mHeight: browserWindow.height

    property string title: currentWebView && currentWebView.title

    width: 1300
    height: 900
    visible: true

    Component.onCompleted: {
        //browserWindow.currentWebView.profile = browserWindow.defaultProfile;
        //browserWindow.currentWebView.url = "https://www.google.com";
    }

    Rectangle{
        anchors.fill: parent
        color: "#0d0d0d"
    }

    onCurrentWebViewChanged: {
        //findBar.reset();
    }

    //    Settings {
    //        id : appSettings
    //        property alias autoLoadImages: loadImages.checked
    //        property alias javaScriptEnabled: javaScriptEnabled.checked
    //        property alias errorPageEnabled: errorPageEnabled.checked
    //        property alias pluginsEnabled: pluginsEnabled.checked
    //        property alias fullScreenSupportEnabled: fullScreenSupportEnabled.checked
    //        property alias autoLoadIconsForPage: autoLoadIconsForPage.checked
    //        property alias touchIconsEnabled: touchIconsEnabled.checked
    //        property alias webRTCPublicInterfacesOnly : webRTCPublicInterfacesOnly.checked
    //        property alias devToolsEnabled: devToolsEnabled.checked
    //        property alias pdfViewerEnabled: pdfViewerEnabled.checked
    //    }

    //    Action {
    //        shortcut: "Ctrl+D"
    //        onTriggered: {
    //            downloadView.visible = !downloadView.visible;
    //        }
    //    }
    Action {
        id: focus
        shortcut: "Ctrl+L"
        onTriggered: {
            addressBar.forceActiveFocus();
            addressBar.selectAll();
        }
    }
    Action {
        shortcut: StandardKey.Refresh
        onTriggered: {
            if (currentWebView)
                currentWebView.reload();
        }
    }
    Action {
        shortcut: StandardKey.AddTab
        onTriggered: {
            tabBar.createTab(tabBar.count != 0 ? currentWebView.profile : defaultProfile);
            addressBar.forceActiveFocus();
            addressBar.selectAll();
        }
    }
    Action {
        shortcut: "Escape"
        onTriggered: {
            if (currentWebView.state == "FullScreen") {
                browserWindow.visibility = browserWindow.previousVisibility;
                fullScreenNotification.hide();
                currentWebView.triggerWebAction(WebEngineView.ExitFullScreen);
            }

//            if (findBar.visible)
//                findBar.visible = false;
        }
    }
    Action {
        shortcut: "Ctrl+0"
        onTriggered: currentWebView.zoomFactor = 1.0
    }
    Action {
        shortcut: StandardKey.ZoomOut
        onTriggered: currentWebView.zoomFactor -= 0.1
    }
    Action {
        shortcut: StandardKey.ZoomIn
        onTriggered: currentWebView.zoomFactor += 0.1
    }

    Action {
        shortcut: StandardKey.Copy
        onTriggered: currentWebView.triggerWebAction(WebEngineView.Copy)
    }
    Action {
        shortcut: StandardKey.Cut
        onTriggered: currentWebView.triggerWebAction(WebEngineView.Cut)
    }
    Action {
        shortcut: StandardKey.Paste
        onTriggered: currentWebView.triggerWebAction(WebEngineView.Paste)
    }
    Action {
        shortcut: "Shift+"+StandardKey.Paste
        onTriggered: currentWebView.triggerWebAction(WebEngineView.PasteAndMatchStyle)
    }
    Action {
        shortcut: StandardKey.SelectAll
        onTriggered: currentWebView.triggerWebAction(WebEngineView.SelectAll)
    }
    Action {
        shortcut: StandardKey.Undo
        onTriggered: currentWebView.triggerWebAction(WebEngineView.Undo)
    }
    Action {
        shortcut: StandardKey.Redo
        onTriggered: currentWebView.triggerWebAction(WebEngineView.Redo)
    }
    Action {
        shortcut: StandardKey.Back
        onTriggered: currentWebView.triggerWebAction(WebEngineView.Back)
    }
    Action {
        shortcut: StandardKey.Forward
        onTriggered: currentWebView.triggerWebAction(WebEngineView.Forward)
    }
    Action {
        shortcut: StandardKey.Find
        onTriggered: {
            if (!findBar.visible)
                findBar.visible = true;
        }
    }
    Action {
        shortcut: StandardKey.FindNext
        onTriggered: findBar.findNext()
    }
    Action {
        shortcut: StandardKey.FindPrevious
        onTriggered: findBar.findPrevious()
    }

    Rectangle{
        id: navigationBar
        height: 80
        anchors.top: tabBar.bottom
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.right: parent.right
        color: Colors.gray8
        RowLayout {
            anchors.fill: parent
            anchors.topMargin: 16
            Rectangle{
                id: backButton
                width: 48
                height: 48
                color: "#01000000"
                Rectangle{
                    anchors.fill: parent
                    id: backButtonHighlightRect
                    opacity: .4
                    visible: false
                    radius: 24
                    color: Colors.white
                }
                Image {
                    id: backButtonIcon
                    source:  "images/arrow-left.svg"
                    anchors.fill: parent
                    anchors.margins: 8
                    fillMode: Image.PreserveAspectFit

                }
                ColorOverlay {
                    anchors.fill: backButtonIcon
                    source: backButtonIcon
                    color: "#ffffff"
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: currentWebView && currentWebView.canGoBack
                    onClicked: {
                        currentWebView.goBack()
                    }
                    onEntered: {
                        backButtonHighlightRect.visible = true;
                    }
                    onExited: {
                        backButtonHighlightRect.visible = false;
                    }
                }
            }

            Rectangle{
                id: forwardButton
                width: 48
                height: 48
                color: "#01000000"
                Rectangle{
                    anchors.fill: parent
                    id: forwardButtonHighlightRect
                    opacity: .4
                    visible: false
                    radius: 24
                    color: Colors.white
                }
                Image {
                    id: forwardButtonIcon
                    source:  "images/arrow-right.svg"
                    anchors.fill: parent
                    anchors.margins: 8
                    fillMode: Image.PreserveAspectFit

                }
                ColorOverlay {
                    anchors.fill: forwardButtonIcon
                    source: forwardButtonIcon
                    color: "#ffffff"
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: currentWebView && currentWebView.canGoForward
                    onClicked: {
                        currentWebView.goForward()
                    }
                    onEntered: {
                        forwardButtonHighlightRect.visible = true;
                    }
                    onExited: {
                        forwardButtonHighlightRect.visible = false;
                    }
                }
            }

            Rectangle{
                id: reloadButton
                width: 48
                height: 48
                color: "#01000000"
                Rectangle{
                    anchors.fill: parent
                    id: reloadButtonHighlightRect
                    opacity: .4
                    visible: false
                    radius: 24
                    color: Colors.white
                }
                Image {
                    id: reloadButtonIcon
                    source:  currentWebView && currentWebView.loading ? "images/xmark.svg" : "images/arrow-rotate-right.svg"
                    anchors.fill: parent
                    anchors.margins: 8
                    fillMode: Image.PreserveAspectFit

                }
                ColorOverlay {
                    anchors.fill: reloadButtonIcon
                    source: reloadButtonIcon
                    color: Colors.white
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        currentWebView && currentWebView.loading ? currentWebView.stop() : currentWebView.reload()
                    }
                    onEntered: {
                        reloadButtonHighlightRect.visible = true;
                    }
                    onExited: {
                        reloadButtonHighlightRect.visible = false;
                    }
                }
            }
            TextField {
                id: addressBar
                height: 60
                Image {
                    anchors.verticalCenter: addressBar.verticalCenter;
                    x: 5
                    z: 2
                    id: faviconImage
                    width: 36; height: 36
                    sourceSize: Qt.size(width, height)
                    source: currentWebView && currentWebView.icon ? currentWebView.icon : ''
                }
                MouseArea {
                    id: textFieldMouseArea
                    acceptedButtons: Qt.RightButton
                    anchors.fill: parent
                    onClicked: {
                        var textSelectionStartPos = addressBar.selectionStart;
                        var textSelectionEndPos = addressBar.selectionEnd;
                        textFieldContextMenu.open();
                        addressBar.select(textSelectionStartPos, textSelectionEndPos);
                    }
                    Menu {
                        id: textFieldContextMenu
                        x: textFieldMouseArea.mouseX
                        y: textFieldMouseArea.mouseY
                        MenuItem {
                            text: qsTr("Cut")
                            onTriggered: addressBar.cut()
                            enabled: addressBar.selectedText.length > 0
                        }
                        MenuItem {
                            text: qsTr("Copy")
                            onTriggered: addressBar.copy()
                            enabled: addressBar.selectedText.length > 0
                        }
                        MenuItem {
                            text: qsTr("Paste")
                            onTriggered: addressBar.paste()
                            enabled: addressBar.canPaste
                        }
                        MenuItem {
                            text: qsTr("Delete")
                            onTriggered: addressBar.text = qsTr("")
                            enabled: addressBar.selectedText.length > 0
                        }
                        MenuSeparator {}
                        MenuItem {
                            text: qsTr("Select All")
                            onTriggered: addressBar.selectAll()
                            enabled: addressBar.text.length > 0
                        }
                    }
                }
                leftPadding: 46
                verticalAlignment: Qt.AlignVCenter
                font.family: "Cooper Hewitt"
                background: Rectangle {
                    radius: 24;
                    color: Colors.elementColor ;
                    border.color: Colors.white;
                    border.width: 2
                }
                font.pixelSize: 30
                font.styleName: "Thin"
                font.weight: Font.DemiBold
                color: Colors.white
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.topMargin: 8
                Layout.bottomMargin: 8
                //focus: Qt.inputMethod.visible;
                Layout.rightMargin: 32
                topPadding: 8
                bottomPadding: 8
                Binding on text {
                    when: currentWebView
                    value: currentWebView.url
                }
                onAccepted: currentWebView.url = utils.fromUserInput(text)
                selectByMouse: true
            }
        }
        ProgressBar {
            id: progressBar
            height: 4
            anchors {
                left: parent.left
                top: parent.bottom
                right: parent.right
                leftMargin: parent.leftMargin
                rightMargin: parent.rightMargin
            }
            background: Item {
                Rectangle{
                    anchors.fill: parent
                    color: Colors.white
                }
            }
            from: 0
            to: 100
            value: (currentWebView && currentWebView.loadProgress < 100) ? currentWebView.loadProgress : 0
        }
    }


    StackLayout {
        id: tabLayout
        currentIndex: tabBar.currentIndex
        anchors.top: navigationBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right


    }

    Component {
        id: tabButtonComponent

        TabButton {
            property color frameColor: Colors.white
            property color fillColor: Colors.gray8
            property color nonSelectedColor: Colors.gray8;//  "#601c1c1c" //Colors.gray9
            property string tabTitle: "New Tab"
            background: Rectangle{
                anchors.fill: parent
                color: Colors.elementColor
            }


            id: tabButton
            contentItem: Rectangle
            {
                color: "#01000000"
                implicitWidth: 80
                implicitHeight: 48
                anchors.top :  parent.top;
                anchors.bottom: parent.bottom;
                Rectangle {
                    height: parent.height ;
                    width: 2;
                    anchors.right: parent.right
                    visible: tabBar.currentIndex != tabButton.TabBar.index && tabButton.TabBar.index != tabBar.count - 1 && tabBar.currentIndex - 1 != tabButton.TabBar.index
                    color: tabButton.nonSelectedColor
                }
                Shape {
                    id: advancedShape
                    vendorExtensionsEnabled: true
                    layer.enabled: true
                    layer.samples: 4
                    layer.smooth: true
                    anchors.fill: parent
                    visible: tabBar.currentIndex == tabButton.TabBar.index
                    // set following properties to specify radius
                    property real tlRadius: 15.0
                    property real trRadius: 15.0
                    property real brRadius: 15.0
                    property real blRadius: 15.0

                    ShapePath {
                        strokeColor: tabButton.nonSelectedColor
                        fillColor: tabButton.nonSelectedColor

                        startX: advancedShape.blRadius; startY: advancedShape.tlRadius
                        PathArc {
                            x: advancedShape.tlRadius + advancedShape.blRadius; y: 0
                            radiusX: advancedShape.tlRadius; radiusY: advancedShape.tlRadius

                            useLargeArc: false
                        }
                        PathLine {
                            x: advancedShape.width - advancedShape.trRadius - advancedShape.brRadius; y: 0
                        }
                        PathArc {
                            x: advancedShape.width - advancedShape.brRadius; y: advancedShape.trRadius
                            radiusX: advancedShape.trRadius; radiusY: advancedShape.trRadius
                            useLargeArc: false
                        }
                        PathLine {
                            x: advancedShape.width - advancedShape.brRadius; y: advancedShape.height - advancedShape.brRadius
                        }
                        PathArc {
                            x: advancedShape.width; y: advancedShape.height
                            direction:  PathArc.Counterclockwise
                            radiusX: advancedShape.brRadius; radiusY: advancedShape.brRadius
                            useLargeArc: false
                        }
                        PathLine {
                            x: 0; y: advancedShape.height
                        }
                        PathArc {
                            x: advancedShape.blRadius; y: advancedShape.height - advancedShape.blRadius
                            radiusX: advancedShape.blRadius; radiusY: advancedShape.blRadius
                            direction:  PathArc.Counterclockwise
                            useLargeArc: false
                        }
                        PathLine {
                            x: advancedShape.blRadius; y: advancedShape.tlRadius
                        }
                    }
                }
                Image {
                    anchors.verticalCenter: parent.verticalCenter;
                    anchors.left: parent.left
                    anchors.leftMargin: advancedShape.tlRadius + advancedShape.blRadius
                    id: tabButtonFaviconImage
                    width: 36; height: 36
                    sourceSize: Qt.size(width, height)
                    source:tabLayout.children[tabButton.TabBar.index] && tabLayout.children[tabButton.TabBar.index].icon ? tabLayout.children[tabButton.TabBar.index].icon : ''
                }
                Text {
                    id: text
                    anchors.left: tabButtonFaviconImage.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 8
                    anchors.right: parent.right
                    anchors.rightMargin: advancedShape.trRadius + advancedShape.brRadius + button.background.width
                    text: tabButton.tabTitle
                    elide: Text.ElideRight
                    font.family: "Cooper Hewitt"
                    font.pixelSize: 30
                    font.styleName: "Thin"
                    font.weight: Font.DemiBold
                    color: /*tabButton.down ? Colors.black : */Colors.white
                    width: parent.width // - button.background.width
                }
                Button {
                    id: button
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: advancedShape.trRadius + advancedShape.brRadius
                    height: 36
                    visible: tabBar.currentIndex == tabButton.TabBar.index
                    width: 36
                    background: Rectangle {
                        implicitWidth: 36
                        implicitHeight: 36
                        color: button.hovered ? Backend.colorTransparency(Colors.gray3 , .2) : "#01000000"
                        Text {
                            text: "x";
                            anchors.centerIn: parent;
                            color:button.hovered ? Colors.black : Colors.white
                            font.family: "Cooper Hewitt"
                            font.pixelSize: 30
                            font.styleName: "Thin"
                            font.weight: Font.ExtraBold
                        }
                        radius: 18
                    }
                    onClicked: tabButton.closeTab()
                }
            }
            //                Rectangle {
            //                id: tabRectangle
            //                color: tabButton.down ? fillColor : nonSelectedColor
            //                border.width: 2
            //                border.color: frameColor
            //                radius: 8
            //                implicitWidth: Math.max(text.width + 30, 80)
            //                implicitHeight: Math.max(text.height + 10, 48)
            ////                Rectangle { height: 1 ; width: parent.width ; color: frameColor}
            ////                Rectangle { height: parent.height ; width: 1; color: frameColor}
            ////                Rectangle { x: parent.width - 2; height: parent.height ; width: 1; color: frameColor}
            //                Text {
            //                    id: text
            //                    anchors.left: parent.left
            //                    anchors.verticalCenter: parent.verticalCenter
            //                    anchors.leftMargin: 6
            //                    text: tabButton.tabTitle
            //                    elide: Text.ElideRight
            //                    color: /*tabButton.down ? Colors.black : */Colors.white
            //                    width: parent.width - button.background.width
            //                }
            //                Button {
            //                    id: button
            //                    anchors.right: parent.right
            //                    anchors.verticalCenter: parent.verticalCenter
            //                    anchors.rightMargin: 4
            //                    height: 36
            //                    width: 36
            //                    background: Rectangle {
            //                        implicitWidth: 36
            //                        implicitHeight: 36
            //                        color: button.hovered ? Colors.gray3 : Colors.gray9
            //                        Text {text: "x"; anchors.centerIn: parent; color:button.hovered ? Colors.black : Colors.white}
            //                        border.width: 1
            //                        border.color: Colors.white
            //                        radius: {

            //                        }
            //                    }
            //                    onClicked: tabButton.closeTab()
            //                }
            //            }

            onClicked: addressBar.text = tabLayout.itemAt(TabBar.index).url;
            function closeTab() {
                tabBar.removeView(TabBar.index);
            }
        }
    }


    Rectangle {
        id: tabPlusButton
        color: "#01000000"
        width: 48
        anchors.rightMargin: 16;

        anchors.top: tabBar.top
        anchors.right: parent.right
        anchors.bottom: navigationBar.top
        Rectangle{
            anchors.fill: parent
            id: tabPlusButtonHighlightRect
            opacity: .4
            visible: false
            radius: 24
            color: Colors.white
        }
       Image {
           anchors.centerIn: parent
            id: tabPlusButtonIcon
            width: 32; height: 32
            sourceSize: Qt.size(width, height)
            source: "images/plus.svg"
        }
       ColorOverlay {
           anchors.fill: tabPlusButtonIcon
           source: tabPlusButtonIcon
           color: "#ffffff"
       }
       MouseArea{
           anchors.fill: parent
           hoverEnabled: currentWebView && currentWebView.canGoForward
           onClicked: {
               tabBar.createTab(defaultProfile)
           }
           onEntered: {
               tabPlusButtonHighlightRect.visible = true;
           }
           onExited: {
               tabPlusButtonHighlightRect.visible = false;
           }
       }
    }


    TabBar {
        id: tabBar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.rightMargin: 16
        anchors.right: tabPlusButton.left
        anchors.topMargin: 48
        height: 48
        spacing: 0
        Component.onCompleted: createTab(defaultProfile)
        function createTab(profile, focusOnNewTab = true, url = undefined) {
            var webview = tabComponent.createObject(tabLayout, {profile: profile});
            var newTabButton = tabButtonComponent.createObject(tabBar, {tabTitle: Qt.binding(function () { return webview.title == "" ? "New Tab": webview.title; })});
            tabBar.addItem(newTabButton);
            if (focusOnNewTab) {
                tabBar.setCurrentIndex(tabBar.count - 1);
            }
            if (url !== undefined) {
                webview.url = "https://www.google.com";
            }
            return webview;
        }


        function removeView(index) {
            tabBar.removeItem(index);
            if (tabBar.count > 1) {
                tabBar.removeItem(tabBar.itemAt(index));
                tabLayout.children[index].destroy();
            } else {
                browserWindow.close();
            }
        }

        Component {
            id: tabComponent
            WebEngineView {
                id: webEngineView
                focus: true
                onLinkHovered: function(hoveredUrl) {
                    if (hoveredUrl == "")
                        hideStatusText.start();
                    else {
                        statusText.text = hoveredUrl;
                        statusBubble.visible = true;
                        hideStatusText.stop();
                    }
                }

                states: [
                    State {
                        name: "FullScreen"
                        PropertyChanges {
                            target: tabBar
                            visible: false
                            height: 0
                        }
                        PropertyChanges {
                            target: navigationBar
                            visible: false
                        }
                    }
                ]
                //                settings.autoLoadImages: appSettings.autoLoadImages
                //                settings.javascriptEnabled: appSettings.javaScriptEnabled
                //                settings.errorPageEnabled: appSettings.errorPageEnabled
                //                settings.pluginsEnabled: appSettings.pluginsEnabled
                //                settings.fullScreenSupportEnabled: appSettings.fullScreenSupportEnabled
                //                settings.autoLoadIconsForPage: appSettings.autoLoadIconsForPage
                //                settings.touchIconsEnabled: appSettings.touchIconsEnabled
                //                settings.webRTCPublicInterfacesOnly: appSettings.webRTCPublicInterfacesOnly
                //                settings.pdfViewerEnabled: appSettings.pdfViewerEnabled

                onCertificateError: function(error) {
                    error.defer();
                    sslDialog.enqueue(error);
                }

                onNewWindowRequested: function(request) {
                    if (!request.userInitiated)
                        console.warn("Blocked a popup window.");
                    else if (request.destination === WebEngineNewWindowRequest.InNewTab) {
                        var tab = tabBar.createTab(currentWebView.profile, true, request.requestedUrl);
                        tab.acceptAsNewWindow(request);
                    } else if (request.destination === WebEngineNewWindowRequest.InNewBackgroundTab) {
                        var backgroundTab = tabBar.createTab(currentWebView.profile, false);
                        backgroundTab.acceptAsNewWindow(request);
                    } else if (request.destination === WebEngineNewWindowRequest.InNewDialog) {
                        var dialog = applicationRoot.createDialog(currentWebView.profile);
                        dialog.currentWebView.acceptAsNewWindow(request);
                    } else {
                        var window = applicationRoot.createWindow(currentWebView.profile);
                        window.currentWebView.acceptAsNewWindow(request);
                    }
                }

                onFullScreenRequested: function(request) {
                    if (request.toggleOn) {
                        webEngineView.state = "FullScreen";
                        browserWindow.previousVisibility = browserWindow.visibility;
                        browserWindow.showFullScreen();
                        fullScreenNotification.show();
                    } else {
                        webEngineView.state = "";
                        browserWindow.visibility = browserWindow.previousVisibility;
                        fullScreenNotification.hide();
                    }
                    request.accept();
                }

                onQuotaRequested: function(request) {
                    if (request.requestedSize <= 5 * 1024 * 1024)
                        request.accept();
                    else
                        request.reject();
                }

                onRegisterProtocolHandlerRequested: function(request) {
                    console.log("accepting registerProtocolHandler request for "
                                + request.scheme + " from " + request.origin);
                    request.accept();
                }

                onRenderProcessTerminated: function(terminationStatus, exitCode) {
                    var status = "";
                    switch (terminationStatus) {
                    case WebEngineView.NormalTerminationStatus:
                        status = "(normal exit)";
                        break;
                    case WebEngineView.AbnormalTerminationStatus:
                        status = "(abnormal exit)";
                        break;
                    case WebEngineView.CrashedTerminationStatus:
                        status = "(crashed)";
                        break;
                    case WebEngineView.KilledTerminationStatus:
                        status = "(killed)";
                        break;
                    }

                    print("Render process exited with code " + exitCode + " " + status);
                    reloadTimer.running = true;
                }

                onSelectClientCertificate: function(selection) {
                    selection.certificates[0].select();
                }

                onFindTextFinished: function(result) {
                    if (!findBar.visible)
                        findBar.visible = true;

                    findBar.numberOfMatches = result.numberOfMatches;
                    findBar.activeMatch = result.activeMatch;
                }


                onLoadingChanged: function(loadRequest) {
                    //                    if (loadRequest.status == WebEngineView.LoadStartedStatus)
                    //                        findBar.reset();
                }

                Timer {
                    id: reloadTimer
                    interval: 0
                    running: false
                    repeat: false
                    onTriggered: currentWebView.reload()
                }
            }
        }
    }

    Dialog {
        id: sslDialog
        anchors.centerIn: parent
        contentWidth: Math.max(mainText.width, detailedText.width)
        contentHeight: mainText.height + detailedText.height
        property var certErrors: []
        // fixme: icon!
        // icon: StandardIcon.Warning
        standardButtons: Dialog.No | Dialog.Yes
        title: "Server's certificate not trusted"
        contentItem: Item {
            id: textContentItem
            Label {
                id: mainText
                text: "Do you wish to continue?"
            }
            Text {
                id: detailedText
                anchors.top: mainText.bottom
                text: "If you wish so, you may continue with an unverified certificate.\n" +
                      "Accepting an unverified certificate means\n" +
                      "you may not be connected with the host you tried to connect to.\n" +
                      "Do you wish to override the security check and continue?"
            }
        }

        onAccepted: {
            certErrors.shift().acceptCertificate();
            presentError();
        }
        onRejected: reject()

        function reject(){
            certErrors.shift().rejectCertificate();
            presentError();
        }
        function enqueue(error){
            certErrors.push(error);
            presentError();
        }
        function presentError(){
            visible = certErrors.length > 0
        }
    }

    //    FullScreenNotification {
    //        id: fullScreenNotification
    //    }

    //    DownloadView {
    //        id: downloadView
    //        visible: false
    //        anchors.fill: parent
    //    }

    function onDownloadRequested(download) {
        downloadView.visible = true;
        downloadView.append(download);
        download.accept();
    }

    //    FindBar {
    //        id: findBar
    //        visible: false
    //        anchors.right: parent.right
    //        anchors.rightMargin: 10
    //        anchors.top: parent.top

    //        onFindNext: {
    //            if (text)
    //                currentWebView && currentWebView.findText(text);
    //            else if (!visible)
    //                visible = true;
    //        }
    //        onFindPrevious: {
    //            if (text)
    //                currentWebView && currentWebView.findText(text, WebEngineView.FindBackward);
    //            else if (!visible)
    //                visible = true;
    //        }
    //    }


    Rectangle {
        id: statusBubble
        color: "oldlace"
        property int padding: 8
        visible: false

        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width: statusText.paintedWidth + padding
        height: statusText.paintedHeight + padding

        Text {
            id: statusText
            anchors.centerIn: statusBubble
            elide: Qt.ElideMiddle

            Timer {
                id: hideStatusText
                interval: 750
                onTriggered: {
                    statusText.text = "";
                    statusBubble.visible = false;
                }
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.25}
}
##^##*/
