import Quickshell
import QtQuick
import Quickshell.Io
 
 PanelWindow {
    anchors{
        top: true
        left: true
        right: true
    }
    margins {
        top: 5
        right: 5
        left: 5

    }
    height: 30

    color: "#00000000"
    Rectangle {
        anchors.fill: parent 
        anchors.right: parent.right
        color: "#aafff400"
        radius: 10 
        
        
        height: 25    
        Workspaces {
            anchors.left: parent.left
            anchors.leftMargin: 12
            anchors.verticalCenter: parent.verticalCenter
        }

        Button{
        anchors.right: parent.right
        anchors.rightMargin: 12
        anchors.verticalCenter: parent.verticalCenter
        }

 }
}