import QtQuick 2.0
import Sailfish.Settings.Networking 1.0 as Networking
import com.jolla.connection 1.0                         // ConnectionAgent
import Sailfish.Policy 1.0                              // AccessPolicy
import MeeGo.Connman 0.2                                // NetworkTechnology,NetworkManager
import Nemo.Configuration 1.0
import Nemo.DBus 2.0

Item {
    property bool available: AccessPolicy.wlanToggleEnabled
    property bool active: wifiTechnology && wifiTechnology.connected
    property bool enabled: wifiTechnology.powered && !wifiTechnology.tethering
    property string name: networkManager.WifiTechnology

    function toggled() {
//        if (!AccessPolicy.wlanToggleEnabled) {
//            errorNotification.notify(SettingsControlError.BlockedByAccessPolicy)
//        } else if (wifiTechnology.tethering) {
//            connectionAgent.stopTethering(true)
//        } else {
//            wifiTechnology.powered = !wifiTechnology.powered
//                       if (wifiTechnology.powered) {
//                           busyTimer.stop()
//                       } else if (connDialogConfig.rise) {
//                           busyTimer.restart()
//                       }
//        }
        wifiTechnology.powered = !wifiTechnology.powered
        console.info("..........wire")
    }


    Timer {
        id: busyTimer
        interval: 100
        onTriggered: connectionSelector.openConnection()
        onRunningChanged: {
            if (running) {
                wifiTechnology.connectedChanged.connect(stop)
            } else {
                wifiTechnology.connectedChanged.disconnect(stop)
            }
        }
    }

    ConfigurationGroup {
        id: connDialogConfig

        path: "/apps/jolla-settings/wlan_fav_switch_connection_dialog"

        property bool rise: true
        property int scanningWait: 5000
    }

    NetworkTechnology {
        id: wifiTechnology
        path: networkManager.WifiTechnology
    }

    NetworkManager { id: networkManager }

    ConnectionAgent { id: connectionAgent }

    TechnologyModel {
        id: wifiMode
    }

    DBusInterface {
        id: connectionSelector

        service: "com.jolla.lipstick.ConnectionSelector"
        path: "/"
        iface: "com.jolla.lipstick.ConnectionSelectorIf"

        function openConnection() {
            call('openConnectionNow', 'wifi')
        }
    }
}
