/*
 * Copyright (C) 2020 ~ 2021 Uniontech Software Technology Co.,Ltd.
 *
 * Author:     fanpengcheng <fanpengcheng@uniontech.com>
 *
 * Maintainer: fanpengcheng <fanpengcheng@uniontech.com>
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

pragma Singleton
import QtQuick 2.11
import com.deepin.dtk 1.0

/*!
自定义一个调色板，用于对应平板项目上特殊的颜色要求，便于统一管理和复用
设计成单例类，方便使用，以下为使用示例：
    \qml
       Rectangle {
           anchors.fill: parent
           color: DsPalette.base
       }
    \endqml
*/
QtObject {
    /*! 是否是亮色主题 */
    property bool isLight:                          DTK.platformTheme.themeName.toString() === "deepin"

    /*! 高亮色 */
    property color hightlight:                      isLight ? Qt.rgba(0, 0, 0, 1) : Qt.rgba(1, 1, 1, 1)
    /*! 标题背景 */
    property color titleBase:                       isLight ? Qt.rgba(1, 1, 1, 0.08) : Qt.rgba(0, 0, 0, 0.08)
    /*! 按钮的底色 */
    property color button:                          isLight ? Qt.rgba(1, 1, 1, 0.15) : Qt.rgba(0, 0, 0, 0.15)
    /*! 弹出式界面底色,目前用于蓝牙和无线网子界面 */
    property color popup:                           isLight ? Qt.rgba(1, 1, 1, 0.5) : Qt.rgba(0, 0, 0, 0.5)
//    /*! 对话框底色 */
//    property color dialog:                          isLight ? Qt.rgba(200 / 255, 200 / 255, 200 / 255, 0.5) : Qt.rgba(25 / 255, 25 / 255, 25 / 255, 0.5)
//    /*! 通知消息的两层折叠背景色 */
//    property color notifyBase1:                     isLight ? Qt.rgba(200 / 255, 200 / 255, 200 / 255, 0.4) : Qt.rgba(25 / 255, 25 / 255, 25 / 255, 0.4)
//    property color notifyBase2:                     isLight ? Qt.rgba(200 / 255, 200 / 255, 200 / 255, 0.3) : Qt.rgba(25 / 255, 25 / 255, 25 / 255, 0.3)

    /*! 无透明度 */
    /*! 对话框底色 */
    property color dialog:                          isLight ? Qt.rgba(200 / 255, 200 / 255, 200 / 255, 1) : Qt.rgba(25 / 255, 25 / 255, 25 / 255, 1)
    /*! 通知消息的两层折叠背景色 */
    property color notifyBase1:                     isLight ? Qt.rgba(200 / 255, 200 / 255, 200 / 255, 1) : Qt.rgba(25 / 255, 25 / 255, 25 / 255, 1)
    property color notifyBase2:                     isLight ? Qt.rgba(200 / 255, 200 / 255, 200 / 255, 1) : Qt.rgba(25 / 255, 25 / 255, 25 / 255, 1)

    /*! 对话框类型界面中的分割线 */
    property color itemSeperator:                   isLight ? Qt.rgba(0, 0, 0, 0.05) : Qt.rgba(1, 1, 1, 0.05)
    property color headSeperator:                   isLight ? Qt.rgba(0, 0, 0, 0.2) : Qt.rgba(1, 1, 1, 0.2)

    /*! 音乐组件 */
    property color artistText:                      isLight ? Qt.rgba(0, 0, 0, 0.7) : Qt.rgba(1, 1, 1, 0.7)

    /*! 应用全屏时状态栏底色 */
    property color statusBarBase:                   isLight ? Qt.rgba(253 / 255, 253 / 255, 253 / 255, 0.7) : Qt.rgba(34 / 255, 34 / 255, 34 / 255, 0.7)

    /*! 音量、亮度滑槽背景色 */
    property color grooveColor:                     isLight ? Qt.rgba(0, 0, 0, 0.2) : Qt.rgba(255, 255, 255, 0.2)

    /*! 下拉面板快捷键资源文件路径前缀 */
    property string darkIconPrefix:                 "qrc:/icons/deepin/builtin/dark/icons/"
    property string iconPixelSize:                  "_36px.svg"

    /*! 状态栏wifi图标 */
    property string wifiIconPrefix:                 "qrc:/icons/deepin/builtin/"
    property string wifiIconPixelSize:              "_20px.svg"

    /*! 快捷设置 */
    readonly property string shortcutDir: "file:///usr/share/due-shell/shortcuts/Icons/"
}
