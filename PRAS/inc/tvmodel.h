#ifndef TVMODEL_H
#define TVMODEL_H

#include <QObject>
#include <QString>
#include <QList>
#include <QFile>
#include <QStringList>
#include <QDebug>
#include <QtNetwork>

#include "tvitemdata.h"

class TVModel : public QObject
{
    Q_OBJECT
public:
    explicit TVModel(QObject *parent = nullptr);
    Q_PROPERTY(QList<TVItemData*> model READ model WRITE setModel NOTIFY modelChanged)

    Q_INVOKABLE void readData();

    const QList<TVItemData *> &model() const;
    void setModel(const QList<TVItemData *> &newModel);

signals:

    void modelChanged();
private:
    QList<TVItemData *> m_model;
};

#endif // TVMODEL_H
