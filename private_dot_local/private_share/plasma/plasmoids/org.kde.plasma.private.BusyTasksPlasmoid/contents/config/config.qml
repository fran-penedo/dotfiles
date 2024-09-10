/*
    SPDX-FileCopyrightText: 2023 Bernhard Mayr <unknown_spirit@gmx.at>

    SPDX-License-Identifier: GPL-3.0
*/

import QtQuick

import org.kde.plasma.configuration

ConfigModel {
    ConfigCategory {
         name: "General"
         icon: "plasma"
         source: "configGeneral.qml"
    }
}
