/*
   * Copyright (C) 2020 ~ 2021 Uniontech Software Technology Co.,Ltd.
   *
   * Author:     xiechuan <xiechuan@uniontech.com>
   *
   * Maintainer: xiechaun <xiechaun@uniontech.com>
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

#ifndef CONSTANT_H
#define CONSTANT_H

//#include "notifyentity.h"

#include <QObject>
#include <QString>
#include <QStringList>

#include <memory>

#define  DEFAULT_TIME_SLOT true
#define  DEFAULT_DO_NOT_DISTURB false
#define  DEFAULT_APP_IN_FULLSCREEN false
#define  DEFAULT_CONNECTED_PROJECTOR false
#define  DEFAULT_SCREEN_LOCKED false
#define  DEFAULT_SHOW_ICON_ON_DOCK true

#define  DEFAULT_ALLOW_NOTIFY true
#define  DEFAULT_ONLY_IN_NOTIFY true
#define  DEFAULT_LOCK_SHOW_NOTIFY true
#define  DEFAULT_SHOW_NOTIFY_PREVIEW true
#define  DEFAULT_NOTIFY_SOUND true

#define FREE_POINT(p) if (p) {\
        delete p;\
        p = nullptr;\
    }\

static const QString AllowNotifyStr = "AllowNotify";
static const QString ShowInNotifyCenterStr = "ShowInNotifyCenter";
static const QString LockShowNotifyStr = "LockShowNotify";
static const QString ShowNotifyPreviewStr = "ShowNotifyPreview";
static const QString NotificationSoundStr = "NotificationSound";
static const QString AppIconStr = "Icon";
static const QString AppNameStr = "Name";

static const QString SystemNotifySettingStr = "SystemNotify";
static const QString DoNotDisturbStr = "DoNotDisturb";
static const QString TimeSlotStr = "TimeSlot";
static const QString StartTimeStr = "StartTime";
static const QString DefaultStartTime = "22:00";
static const QString EndTimeStr = "EndTime";
static const QString DefaultEndTime = "07:00";
static const QString AppsInFullscreenStr = "AppsInFullscreen";
static const QString ConnectedProjectorStr = "ConnectedProjector";
static const QString ScreenLockedStr = "ScreenLocked";
static const QString ShowIconOnDockStr = "ShowIconOnDock";
static const QString WhiteBoardStr = "WhiteBoard";
static const QStringList IgnoreList= {
    "dde-control-center"
};

const double eps = 1e-3;

//typedef std::shared_ptr <NotifyEntity> EntityPtr;

namespace DDESESSIONCC
{
    static const QString CONFIG_FILE("/var/lib/AccountsService/deepin/users/");
    static const QString DEFAULT_CURSOR_THEME("/usr/share/icons/default/index.theme");
    static const QString LAST_USER_CONFIG("/var/lib/lightdm/lightdm-deepin-greeter");
    static const QString ACCOUNTS_DBUS_PREFIX("/com/deepin/daemon/Accounts/User");
    static const QStringList shortTimeFormat = {"h:mm", "hh:mm"};
    static const QString PAM_SERVICE_DEEPIN_NAME = "common-auth";
    static const QString DESKTOP_BACKGROUND_PICTURE = "/res/desktopbackground/desktopBackground.jpg";
    static const QString ACCOUNT_DBUS_PATH = "/com/deepin/daemon/Accounts";
    static const QString ACCOUNT_DBUS_NAME = "com.deepin.daemon.Accounts";
    static const QString LOCKSERVICE_PATH = "/com/deepin/dde/LockService";
    static const QString LOCKSERVICE_NAME = "com.deepin.dde.LockService";
    static const QString LOCK_DBUS_PATH = "/com/deepin/dde/lockFront";
    static const QString LOCK_DBUS_NAME = "com.deepin.dde.lockFront";
    static const QString SHUTDOWN_DBUS_PATH = "/com/deepin/dde/shutdownFront";
    static const QString SHUTDOWN_DBUS_NAME = "com.deepin.dde.shutdownFront";
    static const QString POWER_DBUS_PATH = "/com/deepin/daemon/Power";
    static const QString POWER_DBUS_NAME = "com.deepin.daemon.Power";
    static const QString TIMEDATE_DBUS_PATH = "/com/deepin/daemon/Timedate";
    static const QString TIMEDATE_DBUS_NAME = "com.deepin.daemon.Timedate";
    static const QString NOTIFY_DAEMON_DBUS_SERVICE = "org.freedesktop.DBus";
    static const QString NOTIFY_DAEMON_DBUS_PATH = "/org/freedesktop/DBus";
    static const QString NOTIFICATIONS_DBUS_SERVICE = "org.freedesktop.Notifications";
    static const QString NOTIFICATIONS_DBUS_PATH = "/org/freedesktop/Notifications";
    static const QString DDE_NOTIFY_DBUS_SERVER = "com.deepin.dde.Notification";
    static const QString DDE_NOTIFY_DBUS_PATH = "/com/deepin/dde/Notification";
    static const QString DDE_OSD_DBUS_SERVER = "com.deepin.dde.osd";
    static const QString SESSIONMANAGER_DBUS_PATH = "/com/deepin/SessionManager";
    static const QString SESSIONMANAGER_DBUS_NAME = "com.deepin.SessionManager";
    static const QString SHELL_DBUS_PATH = "/com/deepin/due/shell";
    static const QString SHELL_DBUS_NAME = "com.deepin.due.shell";
    static const QString SHELL_SHORTCUT_DBUS_PATH = "/com/deepin/due/shell/shortcuts";
    static const QString SHELL_SHORTCUT_DBUS_NAME = "com.deepin.due.shell.shortcuts";
    static const QString SHELL_DBUS_STATUSBAR_PATH = "/com/deepin/due/statusbar";
    static const QString SHELL_DBUS_STATUSBAR_NAME = "com.deepin.due.statusbar";
    static const QString SHELL_AUTH_DBUS_PATH = "/com/deepin/daemon/Authenticate";
    static const QString SHELL_AUTH_DBUS_NAME = "com.deepin.daemon.Authenticate";
    static const QByteArray GSETTING_PATH = "/com/deepin/dde/sessionshell/control/";
    static const QByteArray GSETTING_NAME = "com.deepin.dde.sessionshell.control";
    static const QByteArray NOTIFY_GSETTING_PATH = "/com/deepin/due/shell/notify/";
    static const QByteArray NOTIFY_GSETTING_NAME = "com.deepin.due.shell.notify";
    static const QByteArray DUE_SHELL_GSETTINGS_PATH = "/com/deepin/due/shell/";
    static const QByteArray DUE_SHELL_GSETTINGS_NAME = "com.deepin.due.shell";
    static const QString ShortcutSettings = "shortcutsettings";
    static const QString RotationLockSettings = "rotaionislock";
    static const QString ShortcutSettingsMaxcount = "shortcutsettingsMaxcount";
    static const QString ShortcutDirPath = "/usr/share/due-shell/shortcuts/";
    const QString NotifyClickDefineKey = "BubbleClickEvent";

    static const int PASSWDLINEEIDT_WIDTH = 280;
    static const int PASSWDLINEEDIT_HEIGHT = 36;
    static const int LAYOUTBUTTON_HEIGHT =  36;
    static const int CapslockWarningWidth = 23;
    static const int CapslockWarningRightMargin = 8;
    static const int DOMAIN_BASE_UID = 10000;

    const QStringList longDateFormat_ZN = {"yyyy年M月d日", "yyyy年M月d日 dddd", "dddd yyyy年M月d日"};
    const QStringList longDateFormat_CN = {"MMMM d yyyy", "MMMM d yyyy dddd", "dddd MMMM d yyyy"};

    const QStringList session_ui_configs {
        "/etc/lightdm/lightdm-deepin-greeter.conf",
        "/etc/deepin/dde-session-ui.conf",
        "/usr/share/dde-session-shell/dde-session-shell.conf",
        "/usr/share/dde-session-ui/dde-session-ui.conf",
    };
}

#endif // CONSTANT_H
