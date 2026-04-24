import QtQuick
import Quickshell
import Quickshell.Hyprland 
import QtQuick.Layouts
     
    
Row {
        
    spacing: 4
        Repeater {
            model: 5

            Rectangle {
                property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
                property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
                border.color: isActive ? "Theme.orange" : (ws ? "blue" : "black")
                border.width: 2
                Behavior on color {
                    ColorAnimation { duration: 200 }
                }
                Behavior on border.color {
                    ColorAnimation { duration : 200 }
                }
               
                color: isActive ? Theme.orange : Theme.coldgray
                width: isActive ? 40 : 30
                height: 15
                radius: 10
                Behavior on width {
                    NumberAnimation {
                        duration: 150
                        easing.type:Easing.InOutQuads
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: Hyprland.dispatch("workspace " + (index + 1))
                }
            }
        }

        Item { Layout.fillWidth: true }
    }