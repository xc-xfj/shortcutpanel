# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = untitled43

CONFIG += sailfishapp

SOURCES += src/untitled43.cpp \
src/shortcut/cellmanager.cpp \
src/shortcut/enumtype.cpp \
src/shortcut/shortcutmodel.cpp

HEADERS += src/shortcut/cellmanager.h \
         src/shortcut/enumtype.h \
         src/shortcut/constant.h \
         src/shortcut/shortcutmodel.h

DISTFILES += qml/untitled43.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/untitled43.changes.in \
    rpm/untitled43.changes.run.in \
    rpm/untitled43.spec \
    rpm/untitled43.yaml \
    translations/*.ts \
    untitled43.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/untitled43-de.ts

RESOURCES += \
    untitled43.qrc
