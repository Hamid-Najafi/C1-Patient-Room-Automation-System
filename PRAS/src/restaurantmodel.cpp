#include "../inc/restaurantmodel.h"

RestaurantModel::RestaurantModel(QObject *parent)
    : QObject{parent}
{

}

void RestaurantModel::readData()
{
    QFile file("C:\\C1\\Food.txt");
    if (!file.open(QIODevice::ReadOnly)) {
        qDebug() << file.errorString();
        return;
    }

    QByteArray bytes = file.readAll();
    file.close();

    QJsonParseError jsonError;


    QJsonDocument d = QJsonDocument::fromJson(bytes, &jsonError);
    if( jsonError.error != QJsonParseError::NoError )
    {
        qDebug() << "fromJson failed: " << jsonError.errorString() << "\n";
        return ;
    }
    if(!d.isArray())
    {
        qDebug() << "fromJson failed: " << jsonError.errorString() << "\n";
        return ;
    }
    for (auto obj: d.array()) {
        RestaurantItemData *m_data = new RestaurantItemData(this) ;
        QJsonObject tempData = obj.toObject();
        m_data->setHeader(tempData.value(QString("header")).toString());
        m_data->setSubHeader(tempData.value(QString("subHeader")).toString());
        m_data->setIcon(tempData.value(QString("image")).toString());
        bool ok;
        m_data->setPrice(QString::number( tempData["price"].toInteger(0)));
        m_model.append(m_data);
    }
}

const QList<RestaurantItemData*> &RestaurantModel::model() const
{
    return m_model;
}

void RestaurantModel::setModel(const QList<RestaurantItemData*> &newModel)
{
    m_model = newModel;
    emit modelChanged();
}
