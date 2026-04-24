import QtQuick
import Quickshell
import Quickshell.Widgets
import QtQuick.Layouts
import Quickshell.Io


Rectangle {
    property string host
    property string user
    width: 280
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
       Process {
        command: ["whoami"]
        running: true
        stdout: SplitParser {
          onRead: data => { if (user === "" ) user = data } 
        }
      }
      Process {
        command: ["hostname"]
        running: true
        stdout: SplitParser {
          onRead: data =>  { if ( host === "" ) host = data }
        }
      } 
     Text {
        id: username
        text: " : " + user + "@" + host
        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 20
        anchors.left: parent.left
        anchors.leftMargin: 70
        anchors.top: parent.top 
        anchors.topMargin: 10
        color: "black"
       
      }    
    }

}