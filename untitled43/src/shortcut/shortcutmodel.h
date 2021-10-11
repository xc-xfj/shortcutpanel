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

#ifndef SHORTCUTMODEL_H
#define SHORTCUTMODEL_H

#include "enumtype.h"

//#include <com_deepin_dde_daemon_launcherd.h>

#include <QAbstractListModel>

//using DBusLauncher = com::deepin::dde::daemon::Launcher;

class QGSettings;

struct CellItem {
    QString cellName;
    QString cellIconName;
    QString cellDesktopName;
    QString cellCommand;
    EnumType::CellType cellType;

    CellItem() {}
    CellItem(const QString &name, const QString &iconName, EnumType::CellType type = EnumType::TypeUnknown
            , const QString &desktopName = QString(), const QString &command = QString())
        : cellName(name)
        , cellIconName(iconName)
        , cellDesktopName(desktopName)
        , cellCommand(command)
        , cellType(type)
    {

    }

    void refreshIcon(QString icon) { cellIconName = icon; }

    bool operator==(const CellItem &item) {
        return this->cellName == item.cellName;
    }
};

class ShortcutModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit ShortcutModel(QObject *parent = nullptr);
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole) override;

protected:
    QHash<int, QByteArray> roleNames() const override;

private:
    void initData();
    void parseConfig();
    void initConnect();
    void parseJsonFile(const QString &path);

private Q_SLOTS:
    void updateData();

private:
    QList<CellItem> m_preLoadList;  // 预设的设备设置列表
    QList<CellItem> m_plugInList;   // 预装的应用快捷设置列表
    QList<CellItem> m_addinList;    // 加载的快捷设置列表
    QGSettings *m_gsettings;        // 快捷设置插入配置
    QHash<int, QByteArray> m_roleNames;
    int m_maxItemCount;
};

#endif // SHORTCUTMODEL_H
