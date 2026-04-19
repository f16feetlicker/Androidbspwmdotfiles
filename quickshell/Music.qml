import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Services.Mpris
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Widgets

Rectangle {
    width: 298
    height: 80
    color: "#1e1e2e"
    radius: 12

    property string title: "Nothing playing"
    property string artist: ""
    property string artUrl: ""
    property bool isPlaying: false
    property real position: 0
    property real length: 1

    // Metadata
    Timer {
        interval: 5
        running: true
        repeat: true
        onTriggered: metaProcess.running = true
    }

    Process {
        id: metaProcess
        command: ["playerctl", "-p", "brave", "metadata",
                  "--format", "{{title}}|{{artist}}|{{mpris:artUrl}}|{{status}}|{{position}}|{{mpris:length}}"]
        running: true
        stdout: SplitParser {
            onRead: data => {
                let p = data.split("|")
                title = p[0] ?? "Nothing playing"
                artist = p[1] ?? ""
                artUrl = p[2] ?? ""
                isPlaying = (p[3] === "Playing")
                position = parseFloat(p[4]) ?? 0
                length = parseFloat(p[5]) ?? 1
            }
        }
    }

    // Position polling
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: posProcess.running = true
    }

    Process {
        id: posProcess
        command: ["playerctl", "-p", "brave", "position"]
        stdout: SplitParser {
            onRead: data => position = parseFloat(data) ?? 0
        }
    }

    // Controls
    Process { id: prevProcess; command: ["playerctl", "-p", "brave", "previous"] }
    Process { id: playProcess; command: ["playerctl", "-p", "brave", "play-pause"] }
    Process { id: nextProcess; command: ["playerctl", "-p", "brave", "next"] }

    // Album art
    ClippingWrapperRectangle {
        width: 60
        height: 60
        radius: 8
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter

        Image {
            anchors.fill: parent
            source: artUrl
            fillMode: Image.PreserveAspectCrop
        }
    }

    // Song info
    Column {
        anchors.left: parent.left
        anchors.leftMargin: 80
        anchors.top: parent.top
        anchors.topMargin: 10
        width: 140

        Text {
            id: titleText
            text: title
            color: "#cdd6f4"
            font.pixelSize: 13
            font.bold: true
            elide: Text.ElideRight
            width: parent.width
        }

        Text {
            text: artist
            color: "#a6adc8"
            font.pixelSize: 11
            elide: Text.ElideRight
            width: parent.width
        }
    }

    // Buttons
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

    // Progress bar
    Rectangle {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 80
        width: 140
        height: 3
        color: "#45475a"
        radius: 2

        Rectangle {
            width: parent.width * (position / length)
            height: parent.height
            color: "#ff0000"  // YouTube red
            radius: 2
        }
    }
}