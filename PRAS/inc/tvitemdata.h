#ifndef TVITEMDATA_H
#define TVITEMDATA_H

#include <QObject>
#include <QString>

class TVItemData: public QObject
{
    Q_OBJECT
public:
    explicit TVItemData(QObject *parent = nullptr);

    Q_PROPERTY(QString header READ header WRITE setHeader NOTIFY headerChanged)
    Q_PROPERTY(QString subHeader READ subHeader WRITE setSubHeader NOTIFY subHeaderChanged)
    Q_PROPERTY(QString icon READ icon WRITE setIcon NOTIFY iconChanged)
    Q_PROPERTY(QString link READ link WRITE setLink NOTIFY linkChanged)


    const QString &header() const;
    void setHeader(const QString &newHeader);
    const QString &subHeader() const;
    void setSubHeader(const QString &newSubHeader);

    const QString &icon() const;
    void setIcon(const QString &newIcon);

    const QString &link() const;
    void setLink(const QString &newLink);

signals:
    void headerChanged();
    void subHeaderChanged();

    void iconChanged();

    void linkChanged();

private:
    QString m_header;
    QString m_subHeader;
    QString m_icon;
    QString m_link;
};

#endif // TVITEMDATA_H
