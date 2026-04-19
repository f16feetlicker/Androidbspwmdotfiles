import QtQuick
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.DBusMenu

Rectangle {
    id: menuTrigger
    height: 22
    width: 26
    radius: 8
    color: "#000000"
    Text {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 5
        anchors.bottomMargin: 7
        text:"󰍜"
        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 20
        color: "white"
    }
    TapHandler {
        
        onTapped: popup.visible = !popup.visible
        
    }
    
    PopupWindow {
    id: popup
    height: 500
    width: 300
    color: "transparent"
    visible: false
    anchor.item: menuTrigger
    anchor.edges: Edges.Bottom | Edges.left
    anchor.gravity: Edges.Bottom
         Rectangle {
             anchors.fill: parent
             radius: 20
             color: "#88ffffff"
             Tray {
                id:tray
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin:12
                anchors.centerIn: parent.centerIn
             }
             Rectangle {
                implicitHeight: 1
                implicitWidth: 288
                anchors.centerIn: parent.centerIn
                anchors.left: parent.left
                anchors.leftMargin: 6
                anchors.top: parent.top
                anchors.topMargin: 50
             }


             User {
                anchors.top: parent.top
                anchors.topMargin: tray.anchors.topMargin + 50
                anchors.centerIn: parent.centerIn
                anchors.left: tray.anchors.left
                anchors.leftMargin: tray.anchors.leftMargin

                  

             }
             Music {
                anchors.top: parent.top
                anchors.topMargin: 200
             }
            }
    }
}





