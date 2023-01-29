#include "inc/togglebuttonviewmodel.h"

ToggleButtonViewModel::ToggleButtonViewModel(QObject *parent)
    : QObject{parent}
{

}

void ToggleButtonViewModel::toggleState()
{
    this->setState(!this->state());
}

const QString &ToggleButtonViewModel::header() const
{
    return m_header;
}

void ToggleButtonViewModel::setHeader(const QString &newHeader)
{
    if (m_header == newHeader)
        return;
    m_header = newHeader;
    emit headerChanged();
}

const QString &ToggleButtonViewModel::iconOn() const
{
    return m_iconOn;
}

void ToggleButtonViewModel::setIconOn(const QString &newIconOn)
{
    if (m_iconOn == newIconOn)
        return;
    m_iconOn = newIconOn;
    emit iconOnChanged();
}

const QString &ToggleButtonViewModel::iconOff() const
{
    return m_iconOff;
}

void ToggleButtonViewModel::setIconOff(const QString &newIconOff)
{
    if (m_iconOff == newIconOff)
        return;
    m_iconOff = newIconOff;
    emit iconOffChanged();
}

bool ToggleButtonViewModel::state() const
{
    return m_state;
}

void ToggleButtonViewModel::setState(bool newState)
{
    if (m_state == newState)
        return;
    m_state = newState;
    if(m_state){
        m_subHeader = this->m_offString;
    }
    else{
        m_subHeader = this->m_onString;
    }
    emit stateChanged();
    emit iconChanged();
}

const QString &ToggleButtonViewModel::icon() const
{
    if(m_state)
        return m_iconOn;
    return m_iconOff;
}

void ToggleButtonViewModel::setIcon(const QString &newIcon)
{

}

const QString &ToggleButtonViewModel::offString() const
{
    return m_offString;
}

void ToggleButtonViewModel::setOffString(const QString &newOffString)
{
    if (m_offString == newOffString)
        return;
    m_offString = newOffString;
    emit offStringChanged();
}

const QString &ToggleButtonViewModel::onString() const
{
    return m_onString;
}

void ToggleButtonViewModel::setOnString(const QString &newOnString)
{
    if (m_onString == newOnString)
        return;
    m_onString = newOnString;
    emit onStringChanged();
}

const QString &ToggleButtonViewModel::subHeader() const
{
    return m_subHeader;
}

void ToggleButtonViewModel::setSubHeader(const QString &newSubHeader)
{

}
