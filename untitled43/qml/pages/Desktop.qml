/*
 * Copyright (C) 2020 ~ 2021 Uniontech Software Technology Co.,Ltd.
 *
 * Author:     xiaoyaobing <xiaoyaobing@uniontech.com>
 *
 * Maintainer: xiaoyaobing <xiaoyaobing@uniontech.com>
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
import QtQml 2.2
import Nemo.Configuration 1.0
import org.nemomobile.devicelock 1.0

/*!
    single instance implementation, placing global parameters related to desktop environment
 */
QtObject {

    //dconf para configur
    property QtObject settings: ConfigurationGroup {
        path: "/desktop/lipstick-jolla-home"

        property bool left_peek_to_events: false
        property int dialog_orientation
        property bool lock_screen_camera: true
        property int security_code_notification_id
        property int blur_iterations: 2
        property int blur_kernel: Kernel.SampleSize17
        property real blur_deviation: 5
        property bool live_snapshots
        property bool lock_screen_events: false
        property bool lock_screen_events_allowed: true
    }

    /*! 是否是亮色主题 */
    property bool isLight:                         true

    /*! 高亮色 */
    property color hightlight:                      isLight ? Qt.rgba(0, 0, 0, 1) : Qt.rgba(1, 1, 1, 1)
    /*! 标题背景 */
    property color titleBase:                       isLight ? Qt.rgba(1, 1, 1, 0.08) : Qt.rgba(0, 0, 0, 0.08)
    /*! 按钮的底色 */
    property color button:                          isLight ? Qt.rgba(1, 1, 1, 0.15) : Qt.rgba(0, 0, 0, 0.15)
}
