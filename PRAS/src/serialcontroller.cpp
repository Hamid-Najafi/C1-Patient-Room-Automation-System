#include "inc/serialcontroller.h"
#include "QDebug"
#include <QColor>

SerialController::SerialController(QObject *parent)
    : QObject{parent}
{


    serialPort.setPortName(serialPortName);

    const int serialPortBaudRate = serialPortBuad.toInt();
    serialPort.setBaudRate(serialPortBaudRate);

    serialPort.open(QIODevice::ReadWrite);


    serialPortWriter.setSerialPort(&serialPort);
    serialPortReader.setSerialPort(&serialPort);
}

void SerialController::setRelay(int number, bool state)
{
    QString str = QString("{\"dest_id\":%1,\"button\":\"R0%2:%3\"}").arg(relay_id).arg(number).arg((state?"on":"off"));
    QByteArray arr = str.toLatin1();
    serialPortWriter.write(arr);
    serialPort.flush();
    qDebug()<< "###############  "+str+"   #################";
}

void SerialController::setCurtain(bool state)
{
    QString str = QString("{\"dest_id\":%1,\"button\":\"%2\"}").arg(Curtain_id).arg((state?"OPEN":"CLOSE"));
    QByteArray arr = str.toLatin1();
    serialPortWriter.write(arr);
    serialPort.flush();
    qDebug()<< "###############  "+str+"   #################";
}

void SerialController::increaseDim()
{
    QString str = QString("{\"dest_id\":%1,\"button\":1}").arg(Right_light_id);
    QByteArray arr = str.toLatin1();
    serialPortWriter.write(arr);
    serialPort.flush();
    str = QString("{\"dest_id\":%1,\"button\":1}").arg(Left_light_id);
    arr = str.toLatin1();
    serialPortWriter.write(arr);
    serialPort.flush();
    qDebug()<< "###############  "+str+"   #################";
}

void SerialController::decreaseDim()
{
    QString str = QString("{\"dest_id\":%1,\"button\":-1}").arg(Right_light_id);
    QByteArray arr = str.toLatin1();
    serialPortWriter.write(arr);
    serialPort.flush();
    str = QString("{\"dest_id\":%1,\"button\":-1}").arg(Left_light_id);
    arr = str.toLatin1();
    serialPortWriter.write(arr);
    serialPort.flush();
    qDebug()<< "###############  "+str+"   #################";
}

void SerialController::setColor(float rr, float gg, float bb)
{
    int r = rr * 255;
    int g = gg * 255;
    int b = bb * 255;
    QString str = QString("{\"dest_id\":%1,\"button\":[\"DATA\",%2,%3,%4]}").arg(RGB_id).arg(r).arg(g).arg(b);
    QByteArray arr = str.toLatin1();
    serialPortWriter.write(arr);
    serialPort.flush();
    qDebug()<< "###############  "+str+"   #################";
}

