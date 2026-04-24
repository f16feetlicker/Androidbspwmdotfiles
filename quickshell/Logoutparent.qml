import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
Variants {
	Quickshell.panelName: "logout"
        required property bool visiblity
        model: Quickshell.screens
        delegate: Component {
            PanelWindow {
                property var modelData
                screen: modelData
                visible: visiblity
                anchors {
                    top: true
                    bottom: true
                    left: true
                    right: true

                }
            
                // Set size to match screen or desired fill
                implicitWidth: screen.width
                implicitHeight: screen.height
                
                // Optional: Make it tsransparent or set a background
                color: "transparent"
                Rectangle {
                    anchors.fill: parent
                    color: "#000000"
                    id: logoutRect
                }
                
                
            

                        
            }
        }
    }
