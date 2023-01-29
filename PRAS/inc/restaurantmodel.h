#ifndef RESTAURANTMODEL_H
#define RESTAURANTMODEL_H

#include <QObject>
#include <QString>
#include <QList>
#include <QFile>
#include <QStringList>
#include <QDebug>
#include <QtNetwork>

#include "restaurantitemdata.h"

class RestaurantModel : public QObject
{
    Q_OBJECT
public:
    explicit RestaurantModel(QObject *parent = nullptr);

    Q_PROPERTY(QList<RestaurantItemData*> model READ model WRITE setModel NOTIFY modelChanged)

    Q_INVOKABLE void readData();

    const QList<RestaurantItemData*> &model() const;
    void setModel(const QList<RestaurantItemData*> &newModel);

signals:

    void modelChanged();
private:
    QList<RestaurantItemData*> m_model;
};

#endif // RESTAURANTMODEL_H
