#include "../inc/tvitemdata.h"

TVItemData::TVItemData(QObject *parent)
  : QObject{parent}
{

}

const QString &TVItemData::header() const
{
    return m_header;
}

void TVItemData::setHeader(const QString &newHeader)
{
    if (m_header == newHeader)
        return;
    m_header = newHeader;
    emit headerChanged();
}

const QString &TVItemData::subHeader() const
{
    return m_subHeader;
}

void TVItemData::setSubHeader(const QString &newSubHeader)
{
    if (m_subHeader == newSubHeader)
        return;
    m_subHeader = newSubHeader;
    emit subHeaderChanged();
}

const QString &TVItemData::icon() const
{
    return m_icon;
}

void TVItemData::setIcon(const QString &newIcon)
{
    if (m_icon == newIcon)
        return;
    m_icon = newIcon;
    emit iconChanged();
}

const QString &TVItemData::link() const
{
    return m_link;
}

void TVItemData::setLink(const QString &newLink)
{
    if (m_link == newLink)
        return;
    m_link = newLink;
    emit linkChanged();
}
