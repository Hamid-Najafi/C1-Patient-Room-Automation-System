#ifndef TOGGLEBUTTONVIEWMODEL_H
#define TOGGLEBUTTONVIEWMODEL_H

#include <QObject>
#include <QString>

class ToggleButtonViewModel : public QObject
{
    Q_OBJECT
public:
    explicit ToggleButtonViewModel(QObject *parent = nullptr);

    Q_PROPERTY(QString header READ header WRITE setHeader NOTIFY headerChanged)
    Q_PROPERTY(QString subHeader READ subHeader WRITE setSubHeader NOTIFY subHeaderChanged)
    Q_PROPERTY(QString offString READ offString WRITE setOffString NOTIFY offStringChanged)
    Q_PROPERTY(QString onString READ onString WRITE setOnString NOTIFY onStringChanged)
    Q_PROPERTY(QString iconOn READ iconOn WRITE setIconOn NOTIFY iconOnChanged)
    Q_PROPERTY(QString iconOff READ iconOff WRITE setIconOff NOTIFY iconOffChanged)
    Q_PROPERTY(bool state READ state WRITE setState NOTIFY stateChanged)
    Q_PROPERTY(QString icon READ icon WRITE setIcon NOTIFY iconChanged)

    Q_INVOKABLE void toggleState();

    const QString &header() const;
    void setHeader(const QString &newHeader);

    const QString &iconOn() const;
    void setIconOn(const QString &newIconOn);

    const QString &iconOff() const;
    void setIconOff(const QString &newIconOff);

    bool state() const;
    void setState(bool newState);


    const QString &icon() const;
    void setIcon(const QString &newIcon);

    const QString &offString() const;
    void setOffString(const QString &newOffString);

    const QString &onString() const;
    void setOnString(const QString &newOnString);

    const QString &subHeader() const;
    void setSubHeader(const QString &newSubHeader);

signals:

    void headerChanged();

    void iconOnChanged();

    void iconOffChanged();

    void stateChanged();

    void iconChanged();

    void offStringChanged();

    void onStringChanged();

    void subHeaderChanged();

private:
    QString m_header;
    QString m_iconOn;
    QString m_iconOff;
    bool m_state;
    QString m_icon;
    QString m_offString;
    QString m_onString;
    QString m_subHeader;
};

#endif // TOGGLEBUTTONVIEWMODEL_H
