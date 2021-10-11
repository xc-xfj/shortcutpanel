import QtQuick 2.0
import QtQuick.Window 2.0
import QtGraphicalEffects 1.0
import Sailfish.Silica 1.0
import com.deepin.dte 1.0
import "../PixelMetrics.js" as CONST

GridView {
    cellWidth: CONST.shortCutSetting_cellWidth
    cellHeight: CONST.shortCutSetting_cellHeight
    model: ShortcutModel {}
    delegate: ShortCutSettingCell {
        type: clType
        name: clName
        iconName: clIconName
        desktopName: clDesktop
        command: clCommand
    }
}
