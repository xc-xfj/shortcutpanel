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

#include "cellmanager.h"
//#include "wireless.h"
//#include "bluetooth.h"
//#include "lockscreen.h"
//#include "notification.h"
//#include "rotationlock.h"
#include "constant.h"

CellManager::CellManager(QObject *parent)
    : QObject(parent)
    , m_wireless(nullptr)
    , m_bluetooth(nullptr)
    , m_lockscreen(nullptr)
    , m_notification(nullptr)
    , m_rotationLock(nullptr)
{
}

CellManager::CellManager(Wireless *wireless, Bluetooth *bluetooth, LockScreen *lockscreen, Notification *notification, Rotationlock *rotationlock, QObject *parent)
    : QObject(parent)
    , m_wireless(wireless)
    , m_bluetooth(bluetooth)
    , m_lockscreen(lockscreen)
    , m_notification(notification)
    , m_rotationLock(rotationlock)
{
}

/**
 * @brief CellManager::changeEnabled 下拉面板快捷设置cell单元响应点击事件的统一入口
 * @param type 参数，表示当前cell单元的类型
 * @return
 */
void CellManager::changeEnabled(int type)
{
    // TODO
    Q_UNUSED(type)
}

void CellManager::handleClickEvent(const QString &command)
{
    // TODO
    Q_UNUSED(command)
}

void CellManager::hidePulldownPamel()
{
    // TODO
}

void CellManager::breakLockAuthConnect()
{
    disconnect(m_authConnection);
}
