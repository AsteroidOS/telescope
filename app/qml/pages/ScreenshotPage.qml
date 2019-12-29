import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import Ubuntu.Content 1.3

Page {
    id: scrShot
    
    property var watch: null

    function notification(text) {
        var noti = Qt.createComponent(Qt.resolvedUrl("../components/InfoBar.qml"))
        noti.createObject(scrShot, {text: text})
    }
    
    header: PageHeader {
        id: header

        title: i18n.tr("Screenshot")
        
        leadingActionBar.actions: [
            Action {
                iconName: "back"
                text: i18n.tr('Back')
                onTriggered: {
                    pageStack.pop()
                }
            }
        ]

        trailingActionBar.actions: [
            Action {
                iconName: "document-save"
                text: i18n.tr("Save")
                visible: !progessLabel.visible
                onTriggered: {
                    //Save with
                    var ExportPage = pageStack.push("qrc:/qml/pages/ExportPage.qml", {"url": screenshotImage.source, "isShare": false});
                    ExportPage.imported.connect(function(filePath) {
                        pageStack.pop()
                    })
                }
            },
            Action {
                iconName: "share"
                text: i18n.tr("Share")
                visible: !progessLabel.visible
                onTriggered: {
                    //Share with
                    var ExportPage = pageStack.push("qrc:/qml/pages/ExportPage.qml", {"url": screenshotImage.source, "isShare": true});
                    ExportPage.imported.connect(function(filePath) {
                        pageStack.pop()
                    })
                }
            }
        ]
        
        StyleHints {
            foregroundColor: "#FFF"
            backgroundColor: "#E5822B"
            dividerColor: "#85D8CE"
        }
    }
    
    ActivityIndicator {
        id: downloadActive

        running: scrShot.watch.screenshotProgress != 99
        anchors.centerIn: parent
        width: units.gu(6)
        height: width
    }

    Label {
        id: progessLabel
        anchors.centerIn: parent 
        visible: scrShot.watch.screenshotProgress != 99
        color: theme.palette.normal.backgroundText
        horizontalAlignment: Text.AlignHCenter
        text: scrShot.watch.screenshotProgress + "%"
    }

    Image {
        id: screenshotImage
        anchors.centerIn: parent 
        visible: !progessLabel.visible
        width: units.gu(35); height: units.gu(35)
    }
    
    Connections {
        target: scrShot.watch
        onScreenshotReceived: {
            screenshotImage.source = "file://" + screenshotPath
            notification(i18n.tr("File saved under ") + screenshotPath);
        }
    }
    
}
