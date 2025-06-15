import QtQml 2.15
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts  1.15

ApplicationWindow {

    visible: true
    width: 400
    height: 200
    title: qsTr("Passphrase entry")

// █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █
// do not change below until solid line

    id: mainwin
    signal putStr(string msg)
    signal killThread()
    onClosing: function() { if (control.dismiss == 0)  killThread(); }
    onAfterRendering: function() {width = box.width; height = box.height;}

    Item {
        id: control
        objectName: "controlObject"
        property int dismiss: 0
        onDismissChanged: mainwin.close();
    }
    Item {
        id: st
        objectName: "stateObject"

// ███████████████████████████████████████████████████████████████
// things below this line can be changed:

        property string prompt: "";
        onPromptChanged: lbl.text = prompt;
    }

    GroupBox {
        id: box
        GridLayout {
            columns: 1;
            Label {
                id: lbl;
                text: "well, enter something..."
                font.pointSize: 32
                font.family: "Courier"
            }
            TextField {
                Layout.fillWidth: true
                echoMode: TextInput.Password;
                onAccepted: function() {putStr(text); mainwin.close();}
            }
        }
    }
}
