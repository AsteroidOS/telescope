import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3

Page {

    header: PageHeader {
        id: header

        title: i18n.tr("Info")
        
        leadingActionBar.actions: [
            Action {
                iconName: "back"
                text: i18n.tr('Back')
                onTriggered: {
                    pageStack.pop()
                }
            }
        ]

        StyleHints {
            foregroundColor: "#FFF"
            backgroundColor: "#E5822B"
            dividerColor: "#85D8CE"
        }
    }
    
    Column {
        id: aboutCloumn
        spacing: units.gu(2)
        anchors.topMargin: units.gu(2)
        anchors.top: header.bottom
        width:parent.width

        UbuntuShape {
            width: units.gu(15); height: units.gu(15)
            anchors.horizontalCenter: parent.horizontalCenter
            radius: "medium"
            image: Image {
                source: "file:///" + applicationDirPath + "/assets/icon.svg"
            }
        }

        Label {
            width: parent.width
            font.pixelSize: units.gu(5)
            font.bold: true
            color: theme.palette.normal.backgroundText
            horizontalAlignment: Text.AlignHCenter
            text: i18n.tr("Telescope")
        }

        Label {
            width: parent.width
            color: UbuntuColors.ash
            horizontalAlignment: Text.AlignHCenter
            text: i18n.tr("Version ") + "0.0.7"
        }

        Label {
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            text: i18n.tr("This app lets you sync with AsteroidOS smartwatches")
        }

        Label {
            width: parent.width
            linkColor: UbuntuColors.orange
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            //TRANSLATORS: Please make sure the URLs are correct
            text: i18n.tr("Copylefted libre software, licensed <a href=\"https://github.com/AsteroidOS/telescope/blob/master/LICENSE\">GPLv3+</a>")
            onLinkActivated: Qt.openUrlExternally(link)
        }
    }
}
