#ifndef SERIALCONTROLLER_H
#define SERIALCONTROLLER_H

#include <QObject>
#include <QString>
#include <inc/serialportreader.h>
#include <inc/serialportwriter.h>

class SerialController : public QObject
{
    Q_OBJECT

    QSerialPort serialPort;
    QString serialPortName = "COM8";
    QString serialPortBuad = "115200";

    QString relay_id       = "680834697";
    QString hub_id         = "676650989";
    QString Curtain_id     = "2525972361";
    QString Right_light_id = "680857577";
    QString Left_light_id  = "3288725753";
    QString RGB_id         = "2882870609";

    SerialPortWriter serialPortWriter;
    SerialPortReader serialPortReader;

    QByteArray writeData;
    QByteArray readData;


public:
    explicit SerialController(QObject *parent = nullptr);

    Q_INVOKABLE void setRelay(int number, bool state);

    Q_INVOKABLE void setCurtain(bool state);

    Q_INVOKABLE void increaseDim();
    Q_INVOKABLE void decreaseDim();

    Q_INVOKABLE void setColor(float r, float g, float b);

signals:

};

#endif // SERIALCONTROLLER_H
