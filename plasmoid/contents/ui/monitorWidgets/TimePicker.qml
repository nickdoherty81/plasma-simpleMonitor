/**
 * Copyright 2013-2016 Dhaby Xiloj, Konstantin Shtepa
 *
 * This file is part of plasma-simpleMonitor.
 *
 * plasma-simpleMonitor is free software: you can redistribute it
 * and/or modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation, either
 * version 3 of the License, or any later version.
 *
 * plasma-simpleMonitor is distributed in the hope that it will be
 * useful, but WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with plasma-simpleMonitor.  If not, see <http://www.gnu.org/licenses/>.
 **/

import QtQuick 2.0

Item {
    id: timePicker

    LayoutMirroring.enabled: false
    LayoutMirroring.childrenInherit: true

    implicitWidth: secs.x + secs.width
    implicitHeight: hour.implicitHeight - 11

    FontLoader {
        id: playRegular
        source: "../../fonts/Play/Play-Regular.ttf"
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: {
            var dateTime = new Date()
            hour.text = Qt.formatDateTime(dateTime,'hh')+':'
            mins.text = Qt.formatDateTime(dateTime,'mm')+':'
            secs.text = Qt.formatDateTime(dateTime,'ss')
        }
    }

    Text {
        id: hour
        anchors.left: parent.left
        height: 40
        text: "00:"
        font {
            family: playRegular.name
            pointSize: 35
        }
        color: "white"
    }
    Text {
        id: mins
        anchors.left: hour.right
        height: 40
        text: "00:"
        font {
            family: playRegular.name
            pointSize: 35
        }
        color: "#a30303"
    }
    Text {
        id: secs
        anchors.left: mins.right
        height: 40
        text: "00"
        font {
            family: playRegular.name
            pointSize: 35
        }
        color: "#a30303"
    }
}
