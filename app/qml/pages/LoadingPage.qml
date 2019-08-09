import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3

Page {
    id: root

    property bool wantConnect: true

    header: PageHeader {
        id: header

        title: "Telescope"
        
        StyleHints {
            foregroundColor: "#FFF"
            backgroundColor: "#E5822B"
            dividerColor: "#85D8CE"
        }
    } 

    ActivityIndicator {
        id: activity

        running: !watches.connectedToService && root.actionContext.active && wantConnect
        anchors.centerIn: parent 
    }     
}
