#include "../inc/gamemodel.h"

GameModel::GameModel(QObject *parent)
    : QObject{parent}
{

}

void GameModel::readData()
{
    QFile file("C:\\C1\\game.txt");
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
        GameItemData *m_data = new GameItemData(this) ;
        QJsonObject tempData = obj.toObject();
        m_data->setHeader(tempData.value(QString("header")).toString());
        m_data->setSubHeader(tempData.value(QString("subHeader")).toString());
        m_data->setIcon(tempData.value(QString("image")).toString());
        m_data->setLink(tempData.value(QString("link")).toString());
//        qDebug() << "{";
//        qDebug() << "\t header : " << m_data->header();
//        qDebug() << "\t subHeader : " << m_data->subHeader();
//        qDebug() << "\t image : " << m_data->icon();
//        qDebug() << "\t link: " << m_data->link();
//        qDebug() << "}";
        m_model.append(m_data);
    }
}

const QList<GameItemData *> &GameModel::model() const
{
    return m_model;
}

void GameModel::setModel(const QList<GameItemData *> &newModel)
{
    if (m_model == newModel)
        return;
    m_model = newModel;
    emit modelChanged();
}
