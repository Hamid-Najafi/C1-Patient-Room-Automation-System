#include "../inc/gameitemdata.h"

GameItemData::GameItemData(QObject *parent)
    : QObject{parent}
{

}

const QString &GameItemData::header() const
{
    return m_header;
}

void GameItemData::setHeader(const QString &newHeader)
{
    if (m_header == newHeader)
        return;
    m_header = newHeader;
    emit headerChanged();
}

const QString &GameItemData::subHeader() const
{
    return m_subHeader;
}

void GameItemData::setSubHeader(const QString &newSubHeader)
{
    if (m_subHeader == newSubHeader)
        return;
    m_subHeader = newSubHeader;
    emit subHeaderChanged();
}

const QString &GameItemData::icon() const
{
    return m_icon;
}

void GameItemData::setIcon(const QString &newIcon)
{
    if (m_icon == newIcon)
        return;
    m_icon = newIcon;
    emit iconChanged();
}

const QString &GameItemData::link() const
{
    return m_link;
}

void GameItemData::setLink(const QString &newLink)
{
    if (m_link == newLink)
        return;
    m_link = newLink;
    emit linkChanged();
}
