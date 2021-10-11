/*
 * Copyright (C) 2020 ~ 2021 Uniontech Software Technology Co.,Ltd.
 *
 * Author:     xuyanghe <xuyanghe@uniontech.com>
 *
 * Maintainer: xuyanghe <xuyanghe@uniontech.com>
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
//import QtQuick.Controls 2.4
//import com.deepin.dtk 1.0
import EnumType 1.0

/*! 一个有buttonClick信号的按钮组件 */
Item {
    property int buttonType: -1
    property alias name: icon.source

    signal buttonClicked

    MouseArea {
        anchors.fill: parent

        onClicked: {
            emit: buttonClicked()
        }
    }

    Image {
        id: icon

        anchors.fill: parent
        sourceSize: Qt.size(parent.width, parent.height)
    }
}
