#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebEngineQuick>

#include <QLocale>
#include <QTranslator>

#include "inc/togglebuttonviewmodel.h"
#include "inc/restaurantmodel.h"
#include "inc/tvmodel.h"
#include "inc/gamemodel.h"
#include "inc/utils.h"
#include "inc/serialcontroller.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
    QtWebEngineQuick::initialize();

    QGuiApplication app(argc, argv);

    QTranslator translator;
    const QStringList uiLanguages = QLocale::system().uiLanguages();
    for (const QString &locale : uiLanguages) {
        const QString baseName = "HAS_" + QLocale(locale).name();
        if (translator.load(":/i18n/" + baseName)) {
            app.installTranslator(&translator);
            break;
        }
    }

    QQmlApplicationEngine engine;

    qmlRegisterType<ToggleButtonViewModel>("com.nourbakhsh.ToggleButtonViewModel",1,0,"ToggleButtonViewModel");
    qmlRegisterType<RestaurantModel>("com.nourbakhsh.RestaurantModel",1,0,"RestaurantModel");
    qmlRegisterType<TVModel>("com.nourbakhsh.TVModel",1,0,"TVModel");
    qmlRegisterType<GameModel>("com.nourbakhsh.GameModel",1,0,"GameModel");
    qmlRegisterType<SerialController>("com.nourbakhsh.SerialController",1,0,"SerialController");
    Utils utils;
    engine.rootContext()->setContextProperty("utils", &utils);

    const QUrl url(u"qrc:/HAS/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
