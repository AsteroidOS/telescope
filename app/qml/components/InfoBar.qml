import QtQuick 2.4
import Lomiri.Components 1.3

Rectangle {
    id: infoBar

    property alias text: infoBarText.text

    width: parent.width
    height: infoBarText.height + units.gu(3)
    anchors {
        bottom: parent.bottom
        bottomMargin: -height
    }
    color: "#000"
    opacity: 0

    Component.onCompleted: {
        anchors.bottomMargin = 0
        opacity = 0.6
        infoBarTimer.start()
    }

    Text {
        id: infoBarText
        anchors {
            left: parent.left
            leftMargin: units.gu(2)
            right: parent.right
            rightMargin: units.gu(2)
            verticalCenter: parent.verticalCenter
        }
        text: ""
        wrapMode: Text.WrapAnywhere
        color: "white"
    }

    Timer {
        id: infoBarTimer
        interval: 3000
        running: false
        repeat: false
        triggeredOnStart: false
        onTriggered: {
            animaDestroy.start()
        }
    }

    SequentialAnimation {
        id: animaDestroy

        LomiriNumberAnimation {
            target: infoBar.anchors
            property: "bottomMargin"
            to: -infoBar.height
            duration: 500; easing.type: Easing.InOutCirc
        }

        LomiriNumberAnimation {
            target: infoBar
            property: "opacity"
            to: 0
            duration: 500; easing.type: Easing.InOutCirc
        }
    }


    Behavior on opacity {
        LomiriNumberAnimation { duration: 500; easing.type: Easing.InOutCirc }
    }

    Behavior on anchors.bottomMargin {
        LomiriNumberAnimation { duration: 500; easing.type: Easing.InOutCirc }
    }
}
