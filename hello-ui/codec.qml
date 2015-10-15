import QtQuick 2.4
import QtQuick.Window 2.0
import QtQuick.Controls 1.4

Rectangle {

    Image {
        id: name
        source: "images/images.jpeg"
        anchors.fill: parent

        property StackView stackViewSettings;

        Image {
            id: img
            width: 190
            height: 140
            fillMode: Image.PreserveAspectFit
            source: "images/lemsaneg.png"
            anchors {
                top: parent.top;
                topMargin: 10;
                left: parent.left;
                leftMargin: 30
            }
        }

        Text {
            id: timeText
            anchors {
                horizontalCenter: parent.horizontalCenter;
                top: parent.top;
                topMargin: 0;
                left: parent.left;
                leftMargin: 666
            }
            text: Qt.formatTime(new Date(),"HH : mm")
            font.pointSize: 30
            color: "white"
            font.family: "Helvetica"
        }

        Timer {
            id: timer
            interval: 60000
            repeat: true
            running: true
            onTriggered: { timeText.text =  Qt.formatTime(new Date(),"HH : mm") }
        }

        Image {
            id: img1
            source: "images/back.png"
            width: 50; height: 50
            anchors {
                bottom: parent.bottom;
                bottomMargin: 30;
                left: parent.left;
                leftMargin: 720
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (!stackViewSettings.busy) {
                        stackViewSettings.pop();
                    }
                }
            }
        }

        Row{
            id: codec
            spacing: 10
            anchors{
                horizontalCenter: parent.horizontalCenter;
                top: parent.top;
                topMargin: 180;
                left: parent.left;
                leftMargin: 50
            }
            Column{
                spacing: 25
                Text {
                    id: audio_codec
                    text: "Audio Codec"
                    font.pointSize: 24
                    font.family: "Helvetica"
                    color: "white"
                    font.bold: true
                }
                Text {
                    id: bit_rate
                    text: "Bit Rate"
                    font.pointSize: 24
                    font.family: "Helvetica"
                    color: "white"
                    font.bold: true
                }
            }
            Column{
                spacing: 25
                Text {
                    id: codec_type
                    text: ": MDV MA24126-P1"
                    font.pointSize: 24
                    font.family: "Helvetica"
                    color: "white"
                    font.bold: true
                }
                Text {
                    id: rate_type
                    text: ": 2400 bps"
                    font.pointSize: 24
                    font.family: "Helvetica"
                    color: "white"
                    font.bold: true
                }
            }
        }
    }
}
