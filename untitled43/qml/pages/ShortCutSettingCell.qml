/*
   * Copyright (C) 2020 ~ 2021 Uniontech Software Technology Co.,Ltd.
   *
   * Author:     ganjing <ganjing@uniontech.com>
   *
   * Maintainer: ganjing <ganjing@uniontech.com>
   *
   * This program is free software: you can redistribute it and/or modify
   * it under the terms of the GNU General Public License as published by
   * the Free Software Foundation, either version 3 of the License, or
   * any later version.
   *
   * This program is distributed in the hope that it will be useful,
   * but WITHOUT ANY WARRANTY; without even the implied warranty of
   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   * GNU General Public License for more details.
   *
   * You should have received a copy of the GNU General Public License
   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import EnumType 1.0
import cellManager 1.0
import "../PixelMetrics.js" as CONST

Item {
    id: cell

    /*! 宽度 */
    readonly property int cellWidth: CONST.shortCutSetting_cellWidth
    /*! 高度 */
    readonly property int cellHeight: CONST.shortCutSetting_cellHeight
    /*! 图标topMargin */
    readonly property int iconTopMargin: CONST.shortCutSetting_iconTopMargin
    /*! 文本topMargin */
    readonly property int textTopMargin: CONST.shortCutSetting_textTopMargin
    /*! mask Rectangle(正方形)边长 */
    readonly property int maskLength: CONST.shortCutSetting_maskLength
    /*! 图标大小 */
    readonly property int iconSize: CONST.shortCutSetting_iconSize
    /*! 快捷设置界面长按弹出wifi/蓝牙设置面板时，相对于当前触点的坐标偏移量 */
    readonly property int positionOffset: CONST.shortCutSetting_positionOffset
    readonly property string shortcutDir: "/usr/share/due-shell/shortcuts/Icons/"
    /*! celll类型 */
    property int type
    property string name
    property string iconName
    property string desktopName
    property string command
    /*! cell单元对应设备 开启/关闭 标志 */
    property bool enabled

    /*! 切换设备状态 */
    function changeDeviceState() {
        // 应用程序相关的点击操作，都走进这个if分支
        loader.item.toggled()
    }

    width: cellWidth
    height: cellHeight

    Rectangle {
        id: mask
        color: cell.enabled ? "green" : "gray"
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }

        height: maskLength
        width: maskLength

        Image {
            id: icon

            // 快捷设置类型为应用时，从指定目录加载图标，图标由应用安装
            source: "qrc:/icons/deepin/builtin/light/icons/" + iconName + "_36px.svg"
            anchors.fill: parent
            Accessible.role: Accessible.Button
            Accessible.name: "btn_" + name
        }

        Text  {
            width: CONST.shortCutSetting_cellWidth
            anchors {
                top: mask.bottom
                topMargin: 8
                horizontalCenter: mask.horizontalCenter
            }
            horizontalAlignment: Text.AlignHCenter
            text: type == EnumType.TypeRotation ? (cell.enabled ? qsTr("No rotation") : qsTr("Auto rotate"))  : name
            wrapMode: Text.WordWrap
        }

        MouseArea {
            anchors.fill: mask

            onClicked: {
                changeDeviceState()
            }

            onPressAndHold: {
                // 目前只有长按wifi图标和蓝牙图标时，才会弹出相应的子界面
                if (EnumType.TypeWireless === type
                        || EnumType.TypeBluetooth === type) {
                    if (!cell.enabled) {    // 已禁用设备长按快捷设置时，启用设备
                        changeDeviceState()
                        return
                    }

                    showSubWindow(type)
                }
            }
        }
    }

    Loader {
        id: loader
    }

    Component.onCompleted: {

        console.info("........................dddddddddddddddddddeeeeeeeeeeeeAZZZZe")
        /*! 根据cell的类型, 绑定对应的enabled属性 */
        enabled = Qt.binding(function() {
            if (type === EnumType.TypeWireless) {
                loader.source = "Wireless.qml"
                return loader.item.enabled
            } else if (type === EnumType.TypeBluetooth) {
                loader.source = "Bluetooth.qml"
                return loader.item.enabled
            } else if (type === EnumType.TypeHotSpot) {
                loader.source = "Hotspot.qml"
                return loader.item.enabled
            } else if (type === EnumType.TypeDND) {
                loader.source = "DND.qml"
                return loader.item.enabled
            } else if (type == EnumType.TypeRotation) {
                loader.source = "Orientation.qml"
                return loader.item.enabled
            } else {
                return false
            }
        })
    }
}
