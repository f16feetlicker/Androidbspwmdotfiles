import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Io


    
    
    RowLayout {
        property string timeText: ""
    
        spacing: 12
        Rectangle {
        id: date
        height: 30
        width: 85
        radius: 5
        color: Theme.coldgray
        anchors.bottom: parent.bottom
        
        Text {
            text: Qt.formatDateTime(new Date(), "dd,") + timeText + Qt.formatDateTime(new Date(), "yyyy")
            color: "darkblue"
            anchors.verticalCenter: parent.verticalCenter
            anchors.centerIn: parent
        }
       }
       Rectangle {
        id: hour
        width: 60
        height: 30
        radius: 5
        anchors.bottom: parent.bottom
        color: Theme.crimson
        Text {
            text: Qt.formatDateTime(new Date(), "HH:mm")
            anchors.centerIn: parent
            color: "black"
            
        }
       }
           Timer {
        interval: 100000
        running: true
        
        onTriggered: date.text = Qt.formatDateTime(new Date(), "dd, ") + timeText + Qt.formatDateTime(new Date(), "yyyy")
    }
        Timer {
            interval: 1000
            running: true
            onTriggered: hour.text = Qt.formatDateTime(new Date(),"HH:mm")

        }
    Process {
        command: ["date"]
        running: true
        stdout: SplitParser {
            onRead: data =>{
                var p = data.trim().split(/\s+/)
                timeText = p[1]
            }
        }  
    }
       
   
    }
    

