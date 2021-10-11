import QtQuick 2.0
import "../PixelMetrics.js" as CONST
import "mediaplayer"

Item {
    id: shortcutItem

    readonly property real radius: 20
    property ShaderEffectSource target
    property real offsetX
    property real offsetY

    Item {
        id: shortCutSettingView

        anchors {
            top: parent.top
            left: parent.left
        }

        width: CONST.shortCutPanel_width
        // 根据元素个数动态设置快捷设置面板高度
        height: CONST.shortCutSetting_cellHeight * Math.ceil(shortCutSetting.count / CONST.shortCutPanel_cellCntPerLine) + 20

        ShortCutSettingView {
            id: shortCutSetting
            readonly property real vSpace: 20
            readonly property real hSpace: 10

            anchors {
                fill: parent
                topMargin: vSpace
                bottomMargin: vSpace
                leftMargin: hSpace
                rightMargin: hSpace
            }
            boundsBehavior: Flickable.StopAtBounds
            Accessible.role: Accessible.Form
            Accessible.name: "form_shortcutview"
        }

        Component.onCompleted: {
            console.info("................", shortCutSetting.count, CONST.shortCutPanel_cellCntPerLine, Math.ceil(shortCutSetting.count / CONST.shortCutPanel_cellCntPerLine))
        }
    }


    // sound,bright
    Rectangle {
        id: control

        width: CONST.shortCutPanel_width
        height: 162

        anchors {
            top: shortCutSettingView.bottom
            topMargin: 10
        }

        Wireless {
            id :wireless
        }

        Text {
            anchors.centerIn: parent
            text: wireless.name
            elide: Text.ElideLeft
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                wireless.toggled()
                console.info(wireless.name)
            }
        }
    }

    // medial
    MediaPlayer {
        id: medial

        width: CONST.shortCutPanel_width
        height: 114

        anchors {
            top: control.bottom
            topMargin: 10
        }
    }
}
