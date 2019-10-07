import QtQuick 2.4
import Ubuntu.Components 1.3

ListItem {
    id: expandableListItem

    // Public APIs
    property ListModel model
    property Component delegate
    property alias title: expandableHeader.title
    property alias subText: expandableHeader.subtitle
    property alias listViewHeight: expandableList.height

    height: expandableHeader.height + divider.height
    expansion.height: contentColumn.height
    onClicked: toggleExpansion()

    function toggleExpansion() {
        expansion.expanded = !expansion.expanded
    }

    Column {
        id: contentColumn

        anchors {
            left: parent.left
            right: parent.right
        }

        ListItem {
            height: expandableHeader.height + divider.height
            divider.visible: false

            ListItemLayout {
                id: expandableHeader

                Icon {
                    id: arrow
                    width: units.gu(2)
                    height: width
                    SlotsLayout.position: SlotsLayout.Trailing
                    SlotsLayout.overrideVerticalPositioning: true
                    anchors.verticalCenter: parent.verticalCenter
                    name: "go-down"
                    rotation: expandableListItem.expansion.expanded ? 180 : 0

                    Behavior on rotation {
                        UbuntuNumberAnimation {}
                    }
                }
            }
        }

        ListView {
            id: expandableList
            width: parent.width - units.gu(2)
            anchors.right: parent.right
            interactive: false
            model: expandableListItem.model
            delegate: expandableListItem.delegate
        }
    }
}

