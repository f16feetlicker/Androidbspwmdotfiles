import QtQuick
import Quickshell

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

            }
    }
}





