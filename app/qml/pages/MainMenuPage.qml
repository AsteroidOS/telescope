import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3

Page {
    id: root
    property var watch: null
    property int batteryLevel: 0
  
    header: PageHeader {
        id: header
        title: root.watch ? root.watch.name : i18n.tr("Menu")
        
        trailingActionBar.actions: [
            Action {
                id: infoIcon
                objectName: "InfoIcon"
                text: i18n.tr("Info")
                iconName: "info"
                onTriggered: pageStack.push("qrc:/qml/pages/InfoPage.qml")
            },
            Action {
                id: restartIcon
                objectName: "restartIcon"
                text: i18n.tr("Restart Service")
                iconName: "reset"
                onTriggered: serviceController.restartService()
            }
        ]

        StyleHints {
            foregroundColor: "#FFF"
            backgroundColor: "#E5822B"
            dividerColor: "#85D8CE"
        }
    }

    RowLayout {
        id: statusRowLayout
        spacing: units.gu(4)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: header.bottom   
    
        RowLayout {
            spacing: units.gu(0.5)
        
            Icon {
                id: syncIcon
                width: units.gu(4)
                height: units.gu(4)
                color: "black"
                name: curWatchConnected ? "sync-idle" : "sync-error"
            }
      
            Label {
                id: syncLabel
                anchors.topMargin: units.gu(1)
                text: curWatchConnected ? i18n.tr("connected") : i18n.tr("disconnected")
            }
        }
        
        RowLayout {
            spacing: units.gu(0.5)
        
            Icon {
                id: batteryIcon
                width: units.gu(4)
                height: units.gu(3)
                color: "black"
                name: "battery-full-symbolic"
            }
      
            Label {
                id: batteryLabel
                anchors.topMargin: units.gu(1)
                text: curWatchConnected ? batteryLevel + ("%") : i18n.tr("unkown")
            }
        }
    }

    Timer {
        interval: 1000
        running: curWatchConnected
        repeat: true
        onTriggered: batteryLevel = root.watch.batteryLevel
    }
    
}
