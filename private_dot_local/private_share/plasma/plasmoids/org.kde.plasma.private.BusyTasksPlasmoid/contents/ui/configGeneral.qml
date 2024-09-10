/*
    SPDX-FileCopyrightText: 2023 Bernhard Mayr <unknown_spirit@gmx.at>

    SPDX-License-Identifier: GPL-3.0
*/

import QtQuick
import QtQuick.Controls as QQC

Item
{
    id: iconsPage
    width: childrenRect.width
    height: childrenRect.height
    implicitHeight: pageColumn.implicitHeight

    property alias cfg_fontsize: spinbox.value
    property alias cfg_password: textfield.text
    property alias cfg_showunits: showUnits.checked
    property alias cfg_usesmem: useSMEM.checked

    Column
    {
        id: pageColumn
        anchors.fill: parent
        spacing: 4
        Row
        {
            QQC.Label
            {
                text: "Font size"
                anchors.verticalCenter: parent.verticalCenter
            }
            QQC.SpinBox
            {
               id: spinbox
               from: 10
               to: 20
            }
        }
        Row
        {
            QQC.Label
            {
                text: "Password for\niotop and nethogs"
            }
            QQC.TextField
            {
                id: textfield
                echoMode: TextInput.Password
            }
        }
        Row
        {
            QQC.CheckBox
            {
                id: showUnits
                text: "Show units"
            }
        }
        Row
        {
            QQC.CheckBox
            {
                id: useSMEM
                text: "Use SMEM"
            }
        }
    }
}
