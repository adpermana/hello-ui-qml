import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.4

Window {
    id: latih
    visible: true

    Image {
        id: name
        source: "images/images.jpeg"
        anchors.fill: parent
        width: 800; height: 400

        ListModel{
            id: akuModel

            ListElement {
                name: "Bill Smith"
                number: "555 3264"
            }
            ListElement {
                name: "John Brown"
                number: "555 8426"
            }
            ListElement {
                name: "Sam Wise"
                number: "555 0473"
            }
            ListElement {
                name: "Rahsksoaksoakos"
                number: "555 3264"
            }
            ListElement {
                name: "alsjaksakoskaok"
                number: "555 8426"
            }
            ListElement {
                name: "aslkaoskaksoak"
                number: "555 0473"
            }
        }

        Component {
            id: contactDelegate
            Item {
                width: 180; height: 40
                Column {
                    Text { text: '<b>Name:</b> ' + name }
                    Text { text: '<b>Number:</b> ' + number }
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: parent.GridView.view.currentIndex = index;
                }
            }
        }

        Component {
            id: highlight
            Rectangle {
                width: 180; height: 40
                color: "lightsteelblue"; radius: 5
            }
        }

        ScrollView{
            anchors.centerIn: parent
            id: dde

            GridView {
                id: list
                width: 180; height: 40
                model: akuModel
                delegate: contactDelegate
                highlight: highlight

            }
        }

        Text {
            id: outsideText
            text: "Default text"
            anchors{
                top: dde.top
            }
        }
    }
}
