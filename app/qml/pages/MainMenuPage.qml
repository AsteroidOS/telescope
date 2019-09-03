import QtQuick 2.4
import QtQuick.Controls.Suru 2.2
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3

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
              
                ListItemLayout {
                    title.text: i18n.tr("Synchronize time")
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
                        onCheckedChanged: settings.timeSync = checked
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
        onTimeServiceReadyChanged: if(root.watch.timeServiceReady && settings.timeSync) root.watch.setTime(Date())
    }
}
