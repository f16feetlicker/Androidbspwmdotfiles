import QtQuick
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.DBusMenu

Rectangle {
   required property Item barid
   property bool isVisible
   property bool isPopvisible
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
        
        onTapped: if (isPopvisible) {
         closeTimer.start()
         isVisible = false
        }
        else {
         isPopvisible = true
         isVisible = true
        }
        
    }
    Timer {
      id: closeTimer
      running: false
      interval: 550
      onTriggered: isPopvisible = false
    }
    PopupWindow {
    
    id: popup
    height: 300
   
    width: 300
    color: "transparent"
    visible: isPopvisible
    anchor.item: barid
    anchor.edges: Edges.Bottom | Edges.left
    anchor.gravity: Edges.Bottom | Edges.left
         Rectangle {
             width: 300
             height: isVisible ? 300 : 2
             Behavior on height {
               NumberAnimation { 
                  duration: 450
                  easing.type: Easing.InOutQuad
               }
             }
             clip: true
             radius: 20
             color: "#88ffffff"
             opacity: isVisible ? 1 : 0
             Behavior on opacity {
               NumberAnimation { duration: 500 }
             }
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
                id: user
                anchors.top: parent.top
                anchors.topMargin: tray.anchors.topMargin + 50
                
                anchors.left: tray.anchors.left
                anchors.leftMargin: tray.anchors.leftMargin
             }
            Wifi {
               anchors.bottom: parent.bottom
               
            }
           
      }
   }
}
