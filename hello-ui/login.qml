import QtQuick 2.4
import QtQuick.Window 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2

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



        StackView {
            id: stackViewLogin
            anchors.fill: parent
            focus: true
            initialItem: Item {
                Column{
                    id: row1
                    spacing: 10
                    anchors{
                        horizontalCenter: parent.horizontalCenter;
                        top: parent.top;
                        topMargin: 170;
                        left: parent.left;
                        leftMargin: 50
                    }

                    Text {
                        id: txt1
                        text: "Masukkan Password Administrator :"
                        font.pointSize: 24
                        font.family: "Helvetica"
                        color: "black"
                    }
                    TextField{
                        id: passAdmin
                        width: 650
                        height: 60
                        font.family: "Courier"
                        font.pointSize: 24
                        echoMode: TextInput.Password
                        style: TextFieldStyle {
                            textColor: "black"
                            background: Rectangle {
                                radius: 2
                                border.color: "red"
                                border.width: 3
                            }
                        }
                    }
                }
                Button{
                    id: btn_login_admin
                    anchors{

                        top: parent.top;
                        topMargin: 300;
                        left: parent.left;
                        leftMargin: 50
                    }
                    width: 170
                    height: 60
                    Text {
                        id: login_admin
                        anchors.centerIn: parent
                        text: "LOGIN"
                        font.pointSize: 18
                        font.bold: true
                        font.family: "Helvetica"
                    }
                    onClicked: {
                        if (!stackViewLogin.busy) {
                            stackViewLogin.push({
                                                    item : Qt.resolvedUrl("crypto.qml"),
                                                    properties: { stackViewLogin: stackViewLogin }
                                                });
                        }
                    }
                }
            }
        }
    }
}
