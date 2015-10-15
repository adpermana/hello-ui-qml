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


        Row{
            id: crypto
            spacing: 10
            anchors{
                horizontalCenter: parent.horizontalCenter;
                top: parent.top;
                topMargin: 200;
                left: parent.left;
                leftMargin: 50
            }
            Column{
                spacing: 25
                Text {
                    id: algoritma_text
                    text: "Username :"
                    font.pointSize: 24
                    font.family: "Helvetica"
                    color: "white"
                }
                Text {
                    id: kunci_pwd
                    text: "Password :"
                    font.pointSize: 24
                    font.family: "Helvetica"
                    color: "white"
                }

            }
            Column{
                spacing: 15
                TextField{
                    id: algor_edit
                    width: 450
                    height: 50
                    font.family: "Courier"
                    font.pointSize: 24
                }
                TextField{
                    id: kunci_edit
                    width: 450
                    height: 50
                    font.family: "Courier"
                    font.pointSize: 24
                }

                Row{
                    spacing: 20
                    Button{
                        id: btn_save
                        width: 215
                        height: 60
                        Text {
                            id: save
                            anchors.centerIn: parent
                            text: "SAVE"
                            font.pointSize: 18
                            font.bold: true
                            font.family: "Helvetica"
                        }
                    }
                    Button{
                        id: btn_cancel
                        width: 215
                        height: 60
                        Text {
                            id: cancel
                            anchors.centerIn: parent
                            text: "CANCEL"
                            font.pointSize: 18
                            font.bold: true
                            font.family: "Helvetica"
                        }
                        onClicked: {
                            if (!stackViewSettings.busy) {
                                stackViewSettings.pop();
                            }
                        }
                    }
                }
            }
        }
    }
}

