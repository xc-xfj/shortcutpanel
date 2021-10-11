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

#ifndef ENUMTYPE_H
#define ENUMTYPE_H

#include <QObject>

class EnumType: public QObject {
    Q_OBJECT

    Q_ENUMS(ModeStatus)
    Q_ENUMS(LockStatus)
    Q_ENUMS(ShutdownButtonType)
    Q_ENUMS(KeyBoardButtonType)
    Q_ENUMS(MediaPlayerButtonType)
    Q_ENUMS(TimeFormat)
    Q_ENUMS(NetState)
    Q_ENUMS(BatteryStatus)
    Q_ENUMS(OSDType)
    Q_ENUMS(Orientation)
    Q_ENUMS(Alignment)
    Q_ENUMS(BubbleState)
    Q_ENUMS(NotifyType)
    Q_ENUMS(CellType)
    Q_ENUMS(WirelessMode)
    Q_ENUMS(NotifyRole)
    Q_ENUMS(CellRole)

public:
    enum ModeStatus {
        PasswordMode,
        PowerMode
    };

    enum LockStatus {
        LockMode,
        UnLockMode,
    };

    enum ShutdownButtonType {
        RebootButton = 0,
        ShutdownButton
    };

    enum KeyBoardButtonType {
        NumButton = 0,
        BackButton,
        ClearButton
    };

    enum MediaPlayerButtonType {
        PrevButton = 0,
        PlayButton,
        NextButton
    };

    enum AuthFlag {
        Password = 1 << 0,
        Fingerprint = 1 << 1,
        Face = 1 << 2,
        ActiveDirectory = 1 << 3
    };

    enum TimeFormat {
            ShortTime = 0,
            LongTime = 1
    };

    enum NetState {
        NM_DEVICE_STATE_UNKNOWN = 0,
        NM_DEVICE_STATE_UNMANAGED = 10,
        NM_DEVICE_STATE_UNAVAILABLE = 20,
        NM_DEVICE_STATE_DISCONNECTED = 30,
        NM_DEVICE_STATE_PREPARE = 40,
        NM_DEVICE_STATE_CONFIG = 50,
        NM_DEVICE_STATE_NEED_AUTH = 60,
        NM_DEVICE_STATE_IP_CONFIG = 70,
        NM_DEVICE_STATE_IP_CHECK = 80,
        NM_DEVICE_STATE_SECONDARIES = 90,
        NM_DEVICE_STATE_ACTIVATED = 100,
        NM_DEVICE_STATE_DEACTIVATING = 110,
        NM_DEVICE_STATE_FAILED = 120
    };

    enum BatteryStatus {
        StatusUnknown = 0,
        StatusCharging = 1,
        StatusDischarging = 2,
        StatusNotCharging = 3,
        StatusFull = 4
    };

    enum DeviceType {
        Wire = 1,
        Wireless = 2,
    };

    /**
     * @brief The OSDType enum osd类型
     */
    enum OSDType {
        Bright,
        Sound
    };

    /**
     * @brief The Orientation enum 方向
     */
    enum Orientation {
        Horizontal,
        Vertical
    };

    /**
     * @brief The Alignment enum 对其方式
     */
    enum Alignment {
        Left,
        Top,
        Right,
        Bottom
    };

    /**
     * @brief The BubbleState enum 消息气泡状态
     */
    enum BubbleState {
        Expand,     // 展开
        Hide,       // 隐藏
        Fold,       // 折叠
        ExpandChild // 展开子项
    };

    /**
     * @brief The NotifyType enum 通知枚举
     */
    enum NotifyType{
        NotifyCenter,   // 通知中心
        LockNotify      // 锁屏通知
    };

    enum CellType {
        TypeUnknown = 0,
        TypeWireless,
        TypeBluetooth,
        TypeHotSpot,
        TypeLockScreen,
        TypeDND,
        TypeRotation,
        TypeApplication,
        TypeCalculator,
        TypeCamera,
        TypePlugin
    };

    enum CellRole {
        CellName,
        CellIconName,
        CellDesktop,
        CellCommand,
        ShortcutType
    };

    enum WirelessMode {
        UnknownMode,
        ModeWired,
        ModeWireless,
        ModeHotSpot
    };

    /**
     * @brief The NotifyRole enum
     * 枚举中IsBlank代表空白，变间距用,数据与EntityPtr的isTitle绑定，方便后面扩展展开功能标题
     */
    enum NotifyRole {
        AppName = Qt::UserRole + 1,
        AppIcon,
        NotifyTime,
        Summary,
        Body,
        Actions,
        ActionsId,
        Hints,
        NotifyState,
        NotifyZorder,
        ExpandParentRow,
        ParentPosY,
        IsBlank,
        IsFlicked,
        ShowPreview
    };

    enum PluginRoles {
        StartRole = Qt::UserRole + 1,
        StatusBarIconRole,
        PullDownIconRole,
        AppNameRole
    };

public:
    EnumType(QObject *parent = nullptr);
    ~EnumType();
};

#endif // ENUMTYPE_H
