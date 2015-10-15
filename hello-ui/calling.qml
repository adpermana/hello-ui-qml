import QtQuick 2.4
import QtQuick.Window 2.0
import QtQuick.Controls 1.4

Rectangle {

    Image {
        id: name
        source: "images/images.jpeg"
        anchors.fill: parent

        property StackView stackViewCall;

        ListModel{
            id: viewModel
            ListElement{name:"Accept"; icon:"images/accept.png"}
            ListElement{name:"Hangup"; icon:"images/end_call.png"}
            ListElement{name:"Reject"; icon:"images/reject.png"}
        }

        Image {
            id: userFoto
            source: "images/user.png"
            width: 150; height: 150
            anchors{
                top: parent.top
                topMargin: 70
                left: parent.left
                leftMargin: 220
            }
        }

        Text {
            id: username_detail
            text: "Username"
            font.pointSize: 24
            color: "blue"
            font.bold: true
            anchors{
                top: parent.top
                topMargin: 100
                left: parent.left
                leftMargin: 390
            }
        }

        Text {
            id: ip_addr_detail
            text: "Address"
            font.pointSize: 24
            color: "blue"
            font.bold: true
            anchors{
                top: parent.top
                topMargin: 160
                left: parent.left
                leftMargin: 390
            }
        }

        Text {
            id: status
            text: "Memanggil ..."
            font.pointSize: 35
            color: "blue"
            font.bold: true
            anchors{
                top: parent.top
                topMargin: 250
                left: parent.left
                leftMargin: 250
            }
        }

        GridView {
            width: 780; height: 50
            cellWidth: 170; cellHeight: 200
            focus: true
            model: viewModel
            anchors{
                top: parent.top
                topMargin: 310
                left: parent.left
                leftMargin: 150
            }

            highlight: Rectangle { width: 40; height: 40; color: "lightblue" }

            delegate: Item {
                width: 160; height: 160

                Image {
                    id: myIcon
                    width: 70; height: 70
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: 45
                    source: icon
                }
                Text {
                    anchors { top: myIcon.bottom; horizontalCenter: parent.horizontalCenter }
                    text: name
                    font.pointSize: 20
                    color: "blue"
                    font.bold: true
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        parent.GridView.view.currentIndex = index;
                        if(index == 2){
                            if (!stackViewCall.busy) {
                                stackViewCall.pop();
                            }
                        }
                    }
                }
            }
        }
    }
}

