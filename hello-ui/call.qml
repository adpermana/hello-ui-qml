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

        StackView {
            id: stackViewCall
            anchors.fill: parent
            focus: true
            initialItem: Item {
                Row{
                    id: row1
                    spacing: 15
                    anchors {
                        horizontalCenter: parent.horizontalCenter;
                        top: parent.top;
                        topMargin: 180;
                        left: parent.left;
                        leftMargin: 30
                    }

                    TextField{
                        id: inputSIP
                        width: 650
                        height: 70
                        readOnly: true
                        font.family: "Courier"
                        font.pointSize: 24
                        placeholderText: "sip:caller@server.org"
                    }

                    Image {
                        id: img3
                        source: "images/call.png"
                        width: 75; height: 75
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                if (!stackViewCall.busy) {
                                    stackViewCall.push({
                                                       item : Qt.resolvedUrl("calling.qml"),
                                                       properties: { stackViewCall: stackViewCall }
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

