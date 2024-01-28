import QtQuick 2.4
import Lomiri.Components 1.3
import "../components"

Item {
    id: notificationServiceItem
    height: notificationSetting.height

    ListModel {
        id: notificationModel
        Component.onCompleted: initialize()

        function initialize() {
            notificationModel.append({"text": i18n.tr("None"), "value": "None"})
            notificationModel.append({"text": i18n.tr("Normal"), "value": "Normal"})
            notificationModel.append({"text": i18n.tr("Strong"), "value": "Strong"})
        }
    }

    ExpandableListItem {
        id: notificationSetting
        objectName: "notificationSetting"

        listViewHeight: notificationModel.count*units.gu(6.1)
        model: notificationModel
        title.text: i18n.tr("Vibration on notification")
        subText.text: i18n.tr(settings.notifyVib)

        delegate: StandardListItem {
            title.text: model.text
            icon.name: "ok"
            icon.visible: settings.notifyVib === model.value

            onClicked: {
                settings.notifyVib = model.value
                setVib()
                notificationSetting.toggleExpansion()
            }
        }
    }
}
