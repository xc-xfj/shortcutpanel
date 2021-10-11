#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <QtQml>
#include <sailfishapp.h>
#include "shortcut/shortcutmodel.h"
#include "shortcut/enumtype.h"
#include "shortcut/cellmanager.h"

int main(int argc, char *argv[])
{
    // SailfishApp::main() will display "qml/untitled38.qml", if you need more
    // control over initialization, you can use:
    //
    //   - SailfishApp::application(int, char *[]) to get the QGuiApplication *
    //   - SailfishApp::createView() to get a new QQuickView * instance
    //   - SailfishApp::pathTo(QString) to get a QUrl to a resource file
    //   - SailfishApp::pathToMainQml() to get a QUrl to the main QML file
    //
    // To display the view, call "show()" (will show fullscreen on device).

    qmlRegisterType<ShortcutModel>("com.deepin.dte", 1, 0, "ShortcutModel");
    qmlRegisterType<EnumType>("EnumType", 1, 0, "EnumType");
    qmlRegisterType<CellManager>("cellManager", 1, 0, "CellManager");

    return SailfishApp::main(argc, argv);
}
