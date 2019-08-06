import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3

Page {
    id: watchesPage

    header: PageHeader {
        id: header
        title: i18n.tr("Telescope")
        
        trailingActionBar.actions: [
            Action {
                id: infoIcon
                objectName: "InfoIcon"
                text: i18n.tr("Info")
                iconName: "info"
                onTriggered: pageStack.push("qrc:/qml/pages/InfoPage.qml")
            }
        ]
        
        StyleHints {
            foregroundColor: "#FFF"
            backgroundColor: UbuntuColors.orange
            dividerColor: "#85D8CE"
        }
    }
    
    ListView {
        id: watchesListView
        width: watchesPage.width
        height: watchesPage.height - header.height
        anchors.top: header.bottom
      
        model: watches
        
        delegate: ListItem {

            height: modelLayout.height + (divider.visible ? divider.height : 0)
            
            ListItemLayout {
                id: modelLayout
                
                Icon {
                    id: watchIcon
                    anchors.left: modelLayout.left
                    anchors.verticalCenter: modelLayout.verticalCenter
                    width: units.gu(3)
                    height: units.gu(3)
                    name: "smartwatch-symbolic"
                }
                  
                Column {
                    id: column
                    Text { text: model.name }
                    Text { text: model.address + ": " + model.serialNumber }
                }
            }
              
            MouseArea {
              anchors.fill: parent
              onClicked: watches.selectWatch(index)
            }
        }
        
        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        highlightMoveDuration: 10
        highlightMoveVelocity: -1
        focus: true
    }
}
