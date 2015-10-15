import QtQuick 2.4
import QtQuick.Window 2.0
import QtQuick.Controls 1.3

Window{
    id: latihan
    visible: true
    width: 1000; height: 600

    Image {
        id: image1
        source: "images/images.jpeg"
        anchors.fill: parent

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

        ListModel {
            id: appModel
            ListElement { name: "Panggilan";    icon: "images/phone.png";       page: "call.qml" }
            ListElement { name: "Kontak";       icon: "images/addressbook.png"; page: "contact.qml" }
            ListElement { name: "Pengaturan";   icon: "images/setting.png";     page: "settings.qml" }
        }

        StackView {
            id: stackView
            anchors.fill: parent
            focus: true
            initialItem: Item {
                GridView {
                    width: 780; height: 50
                    cellWidth: 260; cellHeight: 200
                    focus: true
                    model: appModel
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
                                if (!stackView.busy) {
                                    stackView.push({
                                                       item : Qt.resolvedUrl(page),
                                                       properties: { stackView: stackView }
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
