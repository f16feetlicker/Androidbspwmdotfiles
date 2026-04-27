import Quickshell
import QtQuick
import Quickshell.Io

Rectangle {
    property bool wifienabled
    id:parentRect
    height: 75
    width: 150
    radius: 10
    color: "yellow"
    Row {
        spacing: 2
        Rectangle {
            y: (parentRect.height - height) / 2
            anchors.left: parent.left
            anchors.leftMargin: 12

            height: 50
            width: 50 
            radius: 25
            color: wifienabled ? Theme.crimson : Theme.coldgray
            
        }
    }
    Process {
       command: ["nmcli", "radio", "wifi"]
       stdout: SplitParser{
        onRead: data => wifienabled = data === "enabled"
       }
           
    }
}
