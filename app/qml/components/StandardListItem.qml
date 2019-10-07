import QtQuick 2.4
import Ubuntu.Components 1.3

ListItem {
    id: listItem

    property alias title: listitemlayout.title
    property alias icon: _icon

    height: listitemlayout.height + divider.height

    ListItemLayout {
        id: listitemlayout

        title.text: ""

        Icon {
            id: _icon
            height: units.gu(2); width: height
            name: "go-next"
            SlotsLayout.position: SlotsLayout.Last
        }
    }
}
