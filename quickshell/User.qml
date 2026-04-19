import QtQuick
import Quickshell
import Quickshell.Widgets
import QtQuick.Layouts
import Quickshell.Io

Rectangle {
    width: 170
    height: 60
    radius: 7
    Row {
        spacing: 5
        
        ClippingWrapperRectangle {
            id:frame
            implicitHeight: 48
            implicitWidth: 48
            radius: 24
            anchors.left: parent.left
            anchors.leftMargin: 12
            anchors.top: parent.top
            anchors.topMargin: 4

            

            AnimatedImage {
                id:gif
               
                
                source: "images/thragg.gif" 
                anchors.fill: parent
                fillMode: AnimatedImage.PreserveAspectCrop

            }
        
        }
     Text {
        id: username
        text: ""
        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 20
        anchors.left: parent.left
        anchors.leftMargin: 70
        anchors.top: parent.top 
        anchors.topMargin: 10
       
      }   
     Process {
        command: ["whoami"]
        running: true
        stdout: SplitParser {
          onRead: data => username.text = ":  " +   data
        }
      }
    
    }

}