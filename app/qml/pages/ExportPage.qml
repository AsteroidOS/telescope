import QtQuick 2.9
import Ubuntu.Components 1.3
import Ubuntu.Content 1.3
import "../components"

Page {
    id: picker
    property var activeTransfer
    property bool isShare: true
    property string url
    property var contentType
    property var handler

    signal cancel()
    signal imported(string fileUrl)

    header: PageHeader {
        title: isShare ? i18n.tr("Share with") : i18n.tr("Save with")
    }

    ContentPeerPicker {
        anchors { fill: parent; topMargin: picker.header.height }
        visible: parent.visible
        showTitle: false
        contentType: ContentType.Pictures
        handler: isShare ? ContentHandler.Share : ContentHandler.Destination

        onPeerSelected: {
            peer.selectionType = ContentTransfer.Single
            picker.activeTransfer = peer.request()
            stateChangeConnection.target = picker.activeTransfer
        }

        onCancelPressed: {
            pageStack.pop()
        }
    }

    Connections {
        id: stateChangeConnection
        onStateChanged: {
            if (picker.activeTransfer.state === ContentTransfer.InProgress) {
                picker.activeTransfer.items = [transferComponent.createObject(parent, {"url": url}) ]
                picker.activeTransfer.state = ContentTransfer.Charged;
                closeTimer.start();
            }
        }
    }
    Timer {
        id: closeTimer
        interval: 1000
        repeat: false
        onTriggered: {
            pageStack.pop()
            picker.complete();
        }
    }
    Component {
        id: transferComponent
        ContentItem {}
    }
}
