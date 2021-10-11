import QtQuick 2.0
import Sailfish.Silica 1.0
import com.jolla.settings 1.0
import org.nemomobile.systemsettings 1.0 // DisplaySettings

Item {
    // Lock mode from user point of view
    readonly property bool portraitLock: displaySettings.orientationLock == "portrait" || displaySettings.orientationLock == "portrait-inverted"
    readonly property bool landscapeLock: displaySettings.orientationLock == "landscape" || displaySettings.orientationLock == "landscape-inverted"


    property bool enabled: displaySettings.orientationLock !== "dynamic"

    function toggled() {
                console.info("..........orirntion")
        if (enabled) {
            displaySettings.orientationLock = "dynamic"
        } else if (__silica_applicationwindow_instance.orientation === Orientation.Portrait) {
            displaySettings.orientationLock = "portrait" // v
        } else if (__silica_applicationwindow_instance.orientation === Orientation.PortraitInverted) {
            displaySettings.orientationLock = "portrait-inverted"
        } else if (__silica_applicationwindow_instance.orientation === Orientation.Landscape) {
            displaySettings.orientationLock = "landscape" // h
        } else if (__silica_applicationwindow_instance.orientation === Orientation.LandscapeInverted) {
            displaySettings.orientationLock = "landscape-inverted"
        }
    }

    DisplaySettings { id: displaySettings }
}

