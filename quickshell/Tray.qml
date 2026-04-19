import QtQuick
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.DBusMenu
import Quickshell.Widgets


Rectangle {
    id: trayBar
    implicitWidth: 280
    implicitHeight: 30
    radius: 10
    color: "black"
    Row {
        id: tray
        spacing: 5
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.centerIn: parent.centerIn
        anchors.verticalCenter: parent.verticalCenter
        
        
        Repeater {
            model: SystemTray.items
            delegate: Rectangle {
                implicitHeight: 23
                implicitWidth: 23
                color: "gray"
                radius: 2
                

                IconImage {
                    source: modelData.icon
                    implicitSize: 20
                    anchors.fill: parent
                }

                QsMenuOpener { id: menuOpener }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        modelData.activate()
                        if (modelData.hasmenu) {
                            
                            modelData.menu.open(trayBar, mouseX, mouseY)
                        }
                    }
                }
            }
        }
    }
}