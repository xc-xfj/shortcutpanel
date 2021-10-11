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

#include "shortcutmodel.h"
#include "constant.h"

#include <QFileInfo>
#include <QDir>
#include <QDebug>

const QString jsonPath = "/etc/due-shell/json/";

/**
 * @brief ShortcutModel::ShortcutModel 快捷区域视图模型类
 * 当QGSettings值发生改变时,更新当前快捷区域模型视图
 * 当软件卸载时,判断当前快捷设置归属软件是否存在,若不存在则
 * 删除当前快捷设置,更新配置
 * @param parent
 */
ShortcutModel::ShortcutModel(QObject *parent)
    : QAbstractListModel(parent)
{
    m_roleNames.insert(EnumType::CellName, "clName");
    m_roleNames.insert(EnumType::CellIconName, "clIconName");
    m_roleNames.insert(EnumType::CellDesktop, "clDesktop");
    m_roleNames.insert(EnumType::CellCommand, "clCommand");
    m_roleNames.insert(EnumType::ShortcutType, "clType");
    initData();
}

int ShortcutModel::rowCount(const QModelIndex &parent) const
{
    return m_preLoadList.count() + m_plugInList.count() + m_addinList.count();
}

QVariant ShortcutModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    int row = index.row();
    if (row > rowCount() - 1)
        return QVariant();

    CellItem item;
    int preCount = m_preLoadList.count();
    int plugInCount = m_plugInList.count();

    if (row < preCount) {
        item = m_preLoadList[row];
    } else if (row >= preCount && row < preCount + plugInCount) {
        item = m_plugInList[row - preCount];
    } else{
        item = m_addinList[row - preCount - plugInCount];
    }

    switch (role) {
    case EnumType::CellName:
        return item.cellName;
    case EnumType::CellIconName:
        return item.cellIconName;
    case EnumType::CellDesktop:
        return item.cellDesktopName;
    case EnumType::ShortcutType:
        return item.cellType;
    case EnumType::CellCommand:
        return item.cellCommand;
    default:
        return QVariant();
    }
}

bool ShortcutModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    int listIndex = index.row() - m_preLoadList.count();
    int count = m_plugInList.count();

    if (0 == count || listIndex < 0 || listIndex > count - 1)
        return false;

    m_plugInList[listIndex].cellIconName = value.toString();
    Q_EMIT dataChanged(index, index);
    return true;
}

QHash<int, QByteArray> ShortcutModel::roleNames() const
{
    return m_roleNames;
}

/**
 * @brief initPreData 初始化数据
 */
void ShortcutModel::initData()
{
    // 初始化预设数据
    m_preLoadList.append(CellItem(tr("WLAN"), "wifi_normal", EnumType::TypeWireless));
    m_preLoadList.append(CellItem(tr("Bluetooth"), "bluetooth_normal", EnumType::TypeBluetooth));
    m_preLoadList.append(CellItem(tr("Hotspot"), "hotspot_normal", EnumType::TypeHotSpot));
    m_preLoadList.append(CellItem(tr("Lock screen"), "lock_normal", EnumType::TypeLockScreen));
    m_preLoadList.append(CellItem(tr("DND"), "dnd_normal", EnumType::TypeDND));
    m_preLoadList.append(CellItem((" "), "rotation_normal", EnumType::TypeRotation));

    parseJsonFile(jsonPath);
    parseConfig();
    initConnect();
}

/**
 * @brief parseConfig 解析配置
 */
void ShortcutModel::parseConfig()
{
    // TODO
}

void ShortcutModel::initConnect()
{
    // TODO
}

/**
 * @brief updateData 当快捷设置插件目录发生改变时更新快捷区域视图模型数据
 */
void ShortcutModel::updateData()
{
    // TODO
}

/**
 * @brief ShortcutModel::parseJsonFile 解析应用程序对应的JSON文件
 * 需要在状态栏和下拉面板快捷设置里显示的应用程序，在预安装的时候，会将其对应的JSON文件放在/etc/due-shell/json/文件夹下
 * @param filePath 参数
 * @return
 */
void ShortcutModel::parseJsonFile(const QString &path)
{
    Q_UNUSED(path)
    // TODO
}
