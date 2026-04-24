import QtQuick
import Quickshell
import Quickshell.Hyprland 

     
    
Row {
     spacing: 5

    Repeater {
        model: Hyprland.workspaces
        delegate: Rectangle{
            id: workspace
            width: 15
            height: 15
            radius: 7.5
            color: modelData.id===Hyprland.focusedWorkspace.id
                   ? "#ffffff"
                   : "transparent"
            border.color: "#000000"
            border.width: 2
                }
            
            
    }
}
    
