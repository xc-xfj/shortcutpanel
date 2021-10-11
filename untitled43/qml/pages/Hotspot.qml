import QtQuick 2.0
import com.jolla.connection 1.0
import MeeGo.Connman 0.2

Item {
    property bool active: wifiTechnology.tethering
    property bool enabled: wifiTechnology.tethering

    function toggled() {
        if (active) {
            wifiAgent.stopTethering()
        } else {
            wifiAgent.startTethering("wifi")
        }

        console.info("..........hotspot")
    }

    ConnectionAgent {
        id: wifiAgent
    }

    NetworkManager {
        id: networkManager
    }

    NetworkTechnology {
        id: wifiTechnology
        path: networkManager.WifiTechnology
    }
}
