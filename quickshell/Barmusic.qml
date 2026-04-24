import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Services.Mpris
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Widgets

Rectangle {
    width: 20 
    height: 15
    color: "transparent"
    
Process {
    id: checkplaying
    command: ["playerctl", "status"]
    stdout: SplitParser {
        onRead: data => isPlaying = (data==="Playing")
    }
}
Process { id: playProcess; command: ["playerctl", "-p", "brave", "play-pause"] }

Process { id: nextProcess; command: ["playerctl", "-p", "brave", "next"] }
 
Process {
    id: prevProcess
    command: ["playerctl", "-p", "brave", "previous"]
}
Row {
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 8
        spacing: 8

        Text {
            text: "⏮"
            color: "#cdd6f4"
            font.pixelSize: 18
            MouseArea { anchors.fill: parent; onClicked: prevProcess.running = true }
        }

        Text {
            text: isPlaying ? "⏸" : "▶"
            color: "#cdd6f4"
            font.pixelSize: 18
            MouseArea { anchors.fill: parent; onClicked: playProcess.running = true }
        }

        Text {
            text: "⏭"
            color: "#cdd6f4"
            font.pixelSize: 18
            MouseArea { anchors.fill: parent; onClicked: nextProcess.running = true }
        }
    }
}
