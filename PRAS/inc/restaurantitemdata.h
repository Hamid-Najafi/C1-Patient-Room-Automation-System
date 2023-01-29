#ifndef RESTAURANTITEMDATA_H
#define RESTAURANTITEMDATA_H

#include <QObject>
#include <QString>

class RestaurantItemData : public QObject
{
    Q_OBJECT
public:
    RestaurantItemData(QObject *parent = nullptr);

    Q_PROPERTY(QString header READ header WRITE setHeader NOTIFY headerChanged)
    Q_PROPERTY(QString subHeader READ subHeader WRITE setSubHeader NOTIFY subHeaderChanged)
    Q_PROPERTY(QString icon READ icon WRITE setIcon NOTIFY iconChanged)
    Q_PROPERTY(QString price READ price WRITE setPrice NOTIFY priceChanged)
    Q_PROPERTY(QString priceTag READ priceTag WRITE setPriceTag NOTIFY priceTagChanged)
    Q_PROPERTY(qint32 count READ count WRITE setCount NOTIFY countChanged)

    const QString &header() const;
    void setHeader(const QString &newHeader);

    const QString &subHeader() const;
    void setSubHeader(const QString &newSubHeader);

    const QString &icon() const;
    void setIcon(const QString &newIcon);

    const QString &price() const;
    void setPrice(const QString &newPrice);

    const QString &priceTag() const;
    void setPriceTag(const QString &newPriceTag);

    qint32 count() const;
    void setCount(qint32 newCount);

signals:
    void headerChanged();

    void subHeaderChanged();

    void iconChanged();

    void priceChanged();

    void priceTagChanged();

    void countChanged();

private:
    QString m_header;
    QString m_subHeader;
    QString m_icon;
    QString m_price;
    QString m_priceTag;
    qint32 m_count;
};

#endif // RESTAURANTITEMDATA_H
