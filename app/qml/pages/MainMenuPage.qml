import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3

Page {
    id: root
    property var watch: null
  
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
            backgroundColor: UbuntuColors.orange
            dividerColor: "#85D8CE"
        }
    }

     Label {
        anchors.centerIn: parent
        text: i18n.tr("Battery Level: ") + root.watch.batteryLevel
    }
}
