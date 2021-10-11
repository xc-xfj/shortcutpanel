import QtQuick 2.0
import com.jolla.settings 1.0
import org.nemomobile.configuration 1.0

Item {
    property bool enabled: doNotDisturbConfig.value
    function toggled() {
        doNotDisturbConfig.value = !doNotDisturbConfig.value
        console.info("................dnd")
    }

    ConfigurationValue {
        id: doNotDisturbConfig
        defaultValue: false
        key: "/lipstick/do_not_disturb"
    }
}
