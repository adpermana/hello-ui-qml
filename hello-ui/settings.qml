import QtQuick 2.4
import QtQuick.Window 2.0
import QtQuick.Controls 1.4

Rectangle {

    Image {
        id: name
        source: "images/images.jpeg"
        anchors.fill: parent

        property StackView stackView;

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
                    if (!stackView.busy) {
                        stackView.pop();
                    }
                }
            }
        }

        ListModel {
            id: settingModel
            ListElement { name: "Info Akun";    icon: "images/account.png";     page: "account.qml" }
            ListElement { name: "Server";       icon: "images/server.png";      page: "server.qml" }
            ListElement { name: "Audio Codec";  icon: "images/codec.png";       page: "codec.qml" }
            ListElement { name: "Keamanan";     icon: "images/crypto.png";      page: "login.qml" }
        }

        StackView {
            id: stackViewSettings
            anchors.fill: parent
            focus: true
            initialItem: Item {
                GridView {
                    width: 800; height: 90
                    cellWidth: 200; cellHeight: 200
                    focus: true
                    model: settingModel
                    anchors.centerIn: parent

                    highlight: Rectangle { width: 40; height: 40; color: "orange" }

                    delegate: Item {
                        width: 200; height: 200

                        Image {
                            id: myIcon
                            width: 95; height: 95
                            anchors.horizontalCenter: parent.horizontalCenter
                            y: 45
                            source: icon
                        }
                        Text {
                            anchors { top: myIcon.bottom; horizontalCenter: parent.horizontalCenter }
                            text: name
                            font.pointSize: 24
                            color: "blue"
                            font.bold: true
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                parent.GridView.view.currentIndex = index;
                                if (!stackViewSettings.busy) {
                                    stackViewSettings.push({
                                                       item : Qt.resolvedUrl(page),
                                                       properties: { stackView: stackViewSettings }
                                                   });
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

