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

    implicitWidth: monthName.x + monthName.width
    implicitHeight: dayNumber.implicitHeight - 11

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
            dayName.text = Qt.formatDateTime(dateTime,'ddd')
            dayNumber.text = Qt.formatDateTime(dateTime,'dd')
            monthName.text = Qt.formatDateTime(dateTime,'MMM')
        }
    }
    
    Text {
        id: dayName
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        height: 40
        text: "00:"
        font {
            family: playRegular.name
            pointSize: 30
        }
        font.capitalization: Font.AllLowercase
        color: "#a30303"
    }
    Text {
        id: dayNumber
        anchors.left: dayName.right
        height: 40
        text: "00:"
        font {
            family: playRegular.name
            pointSize: 50
        }
        color: "white"
    }
    Text {
        id: monthName
        anchors.left: dayNumber.right
        anchors.bottom: parent.bottom
        height: 40
        text: "00"
        font {
            family: playRegular.name
            pointSize: 30
        }
        font.capitalization: Font.AllLowercase
        color: "#a30303"
    }
}
