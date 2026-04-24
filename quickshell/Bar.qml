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
        right: 10
        left: 10

    }
    height: 40

    color: "#00000000"
    Rectangle {
        id: topBar
        anchors.fill: parent 
        anchors.right: parent.right
        color: Theme.bgColor
        radius: 5
        
        
        height: 25    
        Rectangle {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            id: pos
        }
        Workspaces {
            anchors.left: parent.left
            anchors.leftMargin: 12
            anchors.top: parent.top
            anchors.topMargin: 12
            anchors.verticalCenter: parent.verticalCenter
        }

        Button{
        barid: pos
        anchors.right: parent.right
        anchors.rightMargin: 12
        anchors.verticalCenter: parent.verticalCenter
        }
        Clock {
            anchors.left: parent.left
            anchors.leftMargin: 556
            anchors.verticalCenter: parent.verticalCenter
          
            
            anchors.top: parent.top
            anchors.topMargin: 7
        }
        
 }
}