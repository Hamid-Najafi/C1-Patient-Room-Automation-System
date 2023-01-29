#ifndef GAMEMODEL_H
#define GAMEMODEL_H

#include <QObject>
#include <QString>
#include <QList>
#include <QFile>
#include <QStringList>
#include <QDebug>
#include <QtNetwork>

#include "gameitemdata.h"

class GameModel : public QObject
{
    Q_OBJECT
public:
    explicit GameModel(QObject *parent = nullptr);

    Q_PROPERTY(QList<GameItemData*> model READ model WRITE setModel NOTIFY modelChanged)

    Q_INVOKABLE void readData();

    const QList<GameItemData *> &model() const;
    void setModel(const QList<GameItemData *> &newModel);

signals:

    void modelChanged();
private:
    QList<GameItemData *> m_model;
};

#endif // GAMEMODEL_H
