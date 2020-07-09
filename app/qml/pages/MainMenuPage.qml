import QtQuick 2.4
import QtQuick.Controls.Suru 2.2
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import "../components"

Page {
    id: root
    property var watch: null
    property int batteryLevel: root.watch.batteryLevel
  
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
            Layout.preferredHeight: units.gu(7)
        
            Icon {
                id: syncIcon
                width: units.gu(4)
                height: units.gu(4)
                color: Suru.foregroundColor
                name: curWatchConnected ? "sync-idle" : "sync-error"
            }
      
            Label {
                id: syncLabel
                text: curWatchConnected ? i18n.tr("connected") : i18n.tr("disconnected")
            }
        }
        
        RowLayout {
            spacing: units.gu(0.5)
        
            Icon {
                id: batteryIcon
                width: units.gu(4)
                height: units.gu(3)
                color: Suru.foregroundColor
                name: "battery-full-symbolic"
            }
      
            Label {
                id: batteryLabel
                text: curWatchConnected ? batteryLevel + ("%") : i18n.tr("unkown")
            }
        }
    }
    
    // Divider
    Rectangle {
      id: dividerRect
      anchors.top: statusRowLayout.bottom
      width: parent.width      
      height: 1
      color: Suru.neutralColor
    }
    
    ScrollView {
        id: scrollView
        width: parent.width
        height: parent.height
        anchors.top: dividerRect.bottom
        
        contentItem: Column {
            width: scrollView.width
            
            ListItem {
                enabled: root.watch.timeServiceReady
                ListItemLayout {
                    title.text: i18n.tr("Sync device clock")
                    Icon {
                        name: "clock-app-symbolic"
                        color: Suru.foregroundColor
                        width: units.gu(3)
                        height: units.gu(3)
                        SlotsLayout.position: SlotsLayout.Leading
                    }

                    Switch {
                        id: timeSyncSwitch
                        SlotsLayout.position: SlotsLayout.Trailing
                        onCheckedChanged: {
                            settings.timeSync = checked
                            if(settings.timeSync == true) timeSync();
                        }
                    }
                }
            }

            ListItem {
                enabled: root.watch.notificationServiceReady
                width: parent.width
                height: nsi.height > 0 ? nsi.height : units.gu(7)

                NotificationServiceItem {
                    id: nsi
                    width: parent.width
                }
            }
            
            ListItem {
                enabled: root.watch.notificationServiceReady
                onClicked: root.watch.sendNotify(Qt.formatDateTime(new Date(), "zzz"), "Telescope", "ios-watch-vibrating", i18n.tr("Watch-Finder"), i18n.tr("The phone is looking for you!"))
                
                ListItemLayout {
                    title.text: i18n.tr("Find my watch")
                    Icon {
                        name: "broadcast"
                        color: Suru.foregroundColor
                        width: units.gu(3)
                        height: units.gu(3)
                        SlotsLayout.position: SlotsLayout.Leading
                    }
                }
            }
            
            ListItem {
                enabled: root.watch.screenshotServiceReady
                onClicked: {
                    root.watch.requestScreenshot()
                    pageStack.push("qrc:/qml/pages/ScreenshotPage.qml", {watch: watch})
                }
                
                ListItemLayout {
                    title.text: i18n.tr("Take a screenshot")
                    Icon {
                        name: "stock_image"
                        color: Suru.foregroundColor
                        width: units.gu(3)
                        height: units.gu(3)
                        SlotsLayout.position: SlotsLayout.Leading
                    }
                }
            }
        }
    }

    Binding {
        target: timeSyncSwitch
        property: "checked"
        value: settings.timeSync
    }
    
    Connections {
        target: root.watch
        onTimeServiceReadyChanged: timeSync();
    }
    
    function timeSync() {
        if(root.watch.timeServiceReady && settings.timeSync) root.watch.setTime(Date())
    }
    
    Connections {
        target: root.watch
        onNotificationServiceReadyChanged: setVib();
    }
    
    function setVib() {
        if(root.watch.notificationServiceReady) root.watch.setVibration(settings.notifyVib)
    }
    
    Component.onCompleted: root.watch.setScreenshotFileInfo("/home/phablet/.local/share/telescope.asteroidos/screenshot/'screenshot'ddMMyyyy_hhmmss'.jpg'");
}
