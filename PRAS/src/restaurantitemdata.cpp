#include "../inc/restaurantitemdata.h"

RestaurantItemData::RestaurantItemData(QObject *parent)
    : QObject{parent}
{

}

const QString &RestaurantItemData::header() const
{
    return m_header;
}

void RestaurantItemData::setHeader(const QString &newHeader)
{
    if (m_header == newHeader)
        return;
    m_header = newHeader;
    emit headerChanged();
}

const QString &RestaurantItemData::subHeader() const
{
    return m_subHeader;
}

void RestaurantItemData::setSubHeader(const QString &newSubHeader)
{
    if (m_subHeader == newSubHeader)
        return;
    m_subHeader = newSubHeader;
    emit subHeaderChanged();
}

const QString &RestaurantItemData::icon() const
{
    return m_icon;
}

void RestaurantItemData::setIcon(const QString &newIcon)
{
    if (m_icon == newIcon)
        return;
    m_icon = newIcon;
    emit iconChanged();
}

const QString &RestaurantItemData::price() const
{
    return m_price;
}

void RestaurantItemData::setPrice(const QString &newPrice)
{
    if (m_price == newPrice)
        return;
    m_price = newPrice;
    emit priceChanged();
}

const QString &RestaurantItemData::priceTag() const
{
    return m_priceTag;
}

void RestaurantItemData::setPriceTag(const QString &newPriceTag)
{
    if (m_priceTag == newPriceTag)
        return;
    m_priceTag = newPriceTag;
    emit priceTagChanged();
}

qint32 RestaurantItemData::count() const
{
    return m_count;
}

void RestaurantItemData::setCount(qint32 newCount)
{
    if (m_count == newCount)
        return;
    m_count = newCount;
    emit countChanged();
}
