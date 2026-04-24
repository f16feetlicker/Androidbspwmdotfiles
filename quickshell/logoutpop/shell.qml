import Quickshell
import QtQuick
import Quickshell.Io

ShellRoot {
    property bool isVisible: false
    
    IpcHandler {
        target: "session"
        function toggle() {
            isVisible = !isVisible
        }
    }
    
    Variants {
        required property bool visiblity
        model: Quickshell.screens
        delegate: Component {
            FloatingWindow {
                property var modelData
                screen: modelData
                visible: visiblity
                
                // Set size to match screen or desired fill
                implicitWidth: modelData.geometry.width
                implicitHeight: modelData.geometry.height
                
                // Optional: Make it tsransparent or set a background
                color: "#525252"
                
                
                Logout {

                }        
            }
        }
    }
}   