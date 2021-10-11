import QtQuick 2.0
//import Sailfish.Bluetooth 1.0
import Sailfish.Lipstick 1.0
import MeeGo.Connman 0.2

Item {
    property bool active: bluetoothStatus.connected
    property bool enabled: btTechModel.powered && bluetoothStatus.powered

    BluetoothStatus {
        id: bluetoothStatus
    }

    TechnologyModel {
        id: btTechModel
        name: "bluetooth"
    }

    function toggled() {
        btTechModel.powered = !btTechModel.powered
        console.info("..........blue")
    }
}
