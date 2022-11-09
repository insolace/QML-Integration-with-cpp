import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.12 // Google Material theme
import com.company.stopwatch 1.0 // qmlRegisterType from main.cpp

ApplicationWindow {
    id: applicationWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("StopWatch")

    Material.theme: Material.Light
    Material.accent: Material.Blue

    // class object
    Stopwatch
    {
        id: stopwatch
    }

    Row {
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 13
        Button {
            id: btnStart
            text: "Start"
            onClicked: {
                console.log("Start")
                stopwatch.start() // function called from stopwatch.cpp
            }
        }

        Button {
            id: btnStop
            text: "Stop"
            onClicked: {
                console.log("Stop")
                stopwatch.stop() // function called from stopwatch.cpp

            }
        }

        Button {
            id: btnReset
            text: "Reset"
            onClicked: {
                console.log("Reset")
                stopwatch.reset() // function called from stopwatch.cpp
            }
        }

        Button {
            id: btnGoal
            text: "Goal: 3.0"
            onClicked: {
                console.log("Set Goal")
                stopwatch.best = 3.0 // variable from stopwatch.cpp
            }
        }

    }

    Text {
        id: currentTime
        width: 100
        height: 20
        text: "Current Time"
        //anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenterOffset: -90
        anchors.horizontalCenterOffset: 0
        font.pointSize: 15
        font.bold: true
        font.family: "Arial"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

    }

    Text {
        id: userDisplay
        width: 155
        height: 41
        text: stopwatch.display // QString from stopwatch.cpp
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenterOffset: -50
        anchors.horizontalCenterOffset: 0
        font.pointSize: 60
        font.bold: true
        font.family: "Arial"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Text {
        id: bestTime
        width: 100
        height: 20
        color: "#af0b0b"
        text: "Best Time"
        //anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenterOffset: 30
        anchors.horizontalCenterOffset: 0
        font.pointSize: 15
        font.bold: true
        font.family: "Arial"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

    }

    Text {
        id: userBest
        width: 79
        height: 41
        color: "#af0b0b"
        text: Number(stopwatch.best).toFixed(2) // QString from stopwatch.cpp
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenterOffset: 60
        anchors.horizontalCenterOffset: 0
        font.pointSize: 30
        font.bold: true
        font.family: "Arial"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Switch {
        id: switch1
        y: 248
        text: qsTr("Slowest")
        anchors.left: parent.left
        anchors.leftMargin: 12
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 12
        onToggled: {
            console.log(switch1.checked)

            stopwatch.toggle(switch1.checked) // function from stopwatch.cpp

            if(switch1.checked) {
                switch1.text = 'Fastest'
            } else {
                switch1.text = 'Slowest'
            }
        }
    }



}
