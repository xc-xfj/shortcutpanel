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
import QtQuick.Window 2.2
//import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
//import com.deepin.dtk 1.0
import org.nemomobile.mpris 1.0
import EnumType 1.0
//import "../../common"

/*!
    \ qmltype mediaplaer
    \ 音乐插件子界面
*/
Rectangle {
    id: rect

    readonly property real mainLayoutSpaceing: 15
    readonly property real mainLayoutMargins: 20
    readonly property real iconSize: 40

    property bool isPlaying: mprisManager.currentService && mprisManager.playbackStatus === Mpris.Playing

    visible: mprisManager.currentService

    MprisManager {
        id: mprisManager
        onCurrentServiceChanged: {
            if(currentService) {
                mediaControls.visible = true
            } else {
                mediaControls.visible = false
            }
        }

        onMetadataChanged: {
            var artistTag = Mpris.metadataToString(Mpris.Artist)
            var titleTag = Mpris.metadataToString(Mpris.Title)
            var artUrlTag = Mpris.metadataToString(Mpris.ArtUrl)

            artistLabel.text = (artistTag in mprisManager.metadata) ? mprisManager.metadata[artistTag].toString() : qsTr("Unknown artist")
            songLabel.text = (titleTag in mprisManager.metadata) ? mprisManager.metadata[titleTag].toString() : qsTr("Unknown track")
            imageView.source = (artUrlTag in mprisManager.metadata) ? mprisManager.metadata[artUrlTag].toString() : ""
            opacityMask.visible = imageView.source !== ""
        }
    }

    Column {
        spacing: mainLayoutSpaceing
        anchors {
            fill: parent
            margins: mainLayoutMargins
        }

        Row {
            spacing: 10;
            width: parent.width

            Item {
                width: iconSize
                height: iconSize

                Image {
                    id: imageView

                    width: iconSize
                    height: iconSize
                    //                    source: mprisManager.metadata[Mpris.metadataToString(Mpris.ArtUrl)].toString()
                    Accessible.role: Accessible.Graphic
                    Accessible.name: "graphic_music"
                    visible: false
                }

                Rectangle{
                    id: mask

                    anchors.fill: imageView
                    radius: 8
                    visible: false
                }

                OpacityMask {
                    id: opacityMask

                    anchors.fill: imageView
                    source: imageView
                    maskSource: mask
                }
            }

            Column {
                width: rect.width - mainLayoutSpaceing - 2 * mainLayoutMargins - iconSize
                Text {
                    id: songLabel

                    //                    text: MediaModel.title
                    width: parent.width
                    //                    font: DTK.fontManager.t6
                    //                    color: DsPalette.hightlight
                    Accessible.role: Accessible.StaticText
                    Accessible.name: "label_musicname"
                    elide: Text.ElideRight
                }

                Text {
                    id: artistLabel

                    //                    text: MediaModel.artist
                    width: parent.width
                    //                    font: DTK.fontManager.t8
                    //                    color: DsPalette.artistText
                    Accessible.role: Accessible.StaticText
                    Accessible.name: "label_artist"
                    elide: Text.ElideRight
                }
            }
        }

        Row {
            spacing: 103
            anchors.horizontalCenter: parent.horizontalCenter

            Repeater {
                model: [
                    { buttonType: EnumType.PrevButton },
                    { buttonType: EnumType.PlayButton },
                    { buttonType: EnumType.NextButton }
                ]

                MediaPlayerButton {
                    width: 24 * 2
                    height: 24 * 2
                    buttonType: modelData.buttonType

                    onButtonClicked: {
                        switch(buttonType) {
                        case EnumType.PrevButton:
                            mprisManager.previous()
                            break
                        case EnumType.PlayButton:
                            isPlaying ? mprisManager.pause() : mprisManager.play()
                            break
                        case EnumType.NextButton:
                            mprisManager.next()
                            break
                        default:
                            break
                        }
                    }

                    Component.onCompleted: {
                        name = Qt.binding(function() {
                            /*!
                                  PrevButton: 上一首图标
                                  PlayButton: 播放/暂停图标
                                  NextButton: 下一首图标
                            */
                            switch(buttonType) {
                            case EnumType.PrevButton:
                                return "qrc:/icons/deepin/builtin/light/icons/mediaplayer_prev.svg"
                            case EnumType.PlayButton:
                                return !isPlaying ? "qrc:/icons/deepin/builtin/light/icons/mediaplayer_pause.svg" : "qrc:/icons/deepin/builtin/light/icons/mediaplayer_play.svg"
                            case EnumType.NextButton:
                                return "qrc:/icons/deepin/builtin/light/icons/mediaplayer_next.svg"
                            default:
                                break
                            }
                        })
                    }
                }
            }
        }
    }
}
