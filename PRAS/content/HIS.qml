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
    property QtObject defaultProfile: WebEngineProfile {
        storageName: "Profile"
        offTheRecord: false
    }
    property int createdTabs: 0
    property alias mTitle: browserWindow.title
    property alias mWidth: browserWindow.width
    property alias mHeight: browserWindow.height

    property string title: "Web Browser"

    width: 1300
    height: 900
    visible: true

    WebEngineView {
        id: webEngineView
        anchors.fill: parent
        focus: true
        url: "http://www.google.com"
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

        onCertificateError: function(error) {
            error.defer();
            sslDialog.enqueue(error);
        }

        onNewWindowRequested: function(request) {
        }

        onFullScreenRequested: function(request) {
            if (request.toggleOn) {
                webEngineView.state = "FullScreen";
                browserWindow.previousVisibility = browserWindow.visibility;
                browserWindow.showFullScreen();
                //fullScreenNotification.show();
            } else {
                webEngineView.state = "";
                browserWindow.visibility = browserWindow.previousVisibility;
                //fullScreenNotification.hide();
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


}
