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
            backgroundColor: "#E5822B"
            dividerColor: "#85D8CE"
        }
    }
    
    ListView {
        id: watchesListView
        visible: watches.count !== 0
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
                    color: "black"
                    name: "smartwatch-symbolic"
                }
                  
                Column {
                    id: column
                    Text { font.bold: true; text: model.name }
                    Text { text: model.address }
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
    
    Label {
        visible: watches.count === 0
        anchors.centerIn: parent    
        font.pointSize: units.gu(2)       
        text: i18n.tr("No smartwatches configured yet.\n Please connect your smartwatch\n using System Settings.")
        width: text.width
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
    }
    
}
