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

#ifndef CELLMANAGER_H
#define CELLMANAGER_H

#include <QObject>

#include "enumtype.h"
//#include "lockfrontinterface.h"

class Wireless;
class Bluetooth;
class LockScreen;
class Notification;
class Rotationlock;

class CellManager : public QObject
{
    Q_OBJECT
public:
    explicit CellManager(QObject *parent = nullptr);
    CellManager(Wireless *wireless, Bluetooth *bluetooth, LockScreen *lockscreen, Notification *notification, Rotationlock *rotationlock, QObject *parent = nullptr);
    Q_INVOKABLE void changeEnabled(int type);
    Q_INVOKABLE void handleClickEvent(const QString &command);
    Q_INVOKABLE void breakLockAuthConnect();

private:
    void hidePulldownPamel();

private:
    Wireless *m_wireless;
    Bluetooth *m_bluetooth;
    LockScreen *m_lockscreen;
    Notification *m_notification;
    Rotationlock *m_rotationLock;
    QMetaObject::Connection m_authConnection;
};

#endif // CELLMANAGER_H
