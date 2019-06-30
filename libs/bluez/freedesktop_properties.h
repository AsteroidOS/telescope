/*
 * This file was generated by qdbusxml2cpp version 0.8
 * Command line was: qdbusxml2cpp -c FreeDesktopProperties -p freedesktop_properties -v org.freedesktop.DBus.Properties.xml
 *
 * qdbusxml2cpp is Copyright (C) 2015 Digia Plc and/or its subsidiary(-ies).
 *
 * This is an auto-generated file.
 * Do not edit! All changes made to it will be lost.
 */

#ifndef FREEDESKTOP_PROPERTIES_H_1442473392
#define FREEDESKTOP_PROPERTIES_H_1442473392

#include <QtCore/QObject>
#include <QtCore/QByteArray>
#include <QtCore/QList>
#include <QtCore/QMap>
#include <QtCore/QString>
#include <QtCore/QStringList>
#include <QtCore/QVariant>
#include <QtDBus/QtDBus>

/*
 * Proxy class for interface org.freedesktop.DBus.Properties
 */
class FreeDesktopProperties: public QDBusAbstractInterface
{
    Q_OBJECT
public:
    static inline const char *staticInterfaceName()
    { return "org.freedesktop.DBus.Properties"; }

public:
    FreeDesktopProperties(const QString &service, const QString &path, const QDBusConnection &connection, QObject *parent = 0);

    ~FreeDesktopProperties();

public Q_SLOTS: // METHODS
    inline QDBusPendingReply<QDBusVariant> Get(const QString &interface, const QString &name)
    {
        QList<QVariant> argumentList;
        argumentList << QVariant::fromValue(interface) << QVariant::fromValue(name);
        return asyncCallWithArgumentList(QStringLiteral("Get"), argumentList);
    }

    inline QDBusPendingReply<QVariantMap> GetAll(const QString &interface)
    {
        QList<QVariant> argumentList;
        argumentList << QVariant::fromValue(interface);
        return asyncCallWithArgumentList(QStringLiteral("GetAll"), argumentList);
    }

    inline QDBusPendingReply<> Set(const QString &interface, const QString &name, const QDBusVariant &value)
    {
        QList<QVariant> argumentList;
        argumentList << QVariant::fromValue(interface) << QVariant::fromValue(name) << QVariant::fromValue(value);
        return asyncCallWithArgumentList(QStringLiteral("Set"), argumentList);
    }

Q_SIGNALS: // SIGNALS
    void PropertiesChanged(const QString &interface, const QVariantMap &changed_properties, const QStringList &invalidated_properties);
};

namespace org {
  namespace freedesktop {
    namespace DBus {
      typedef ::FreeDesktopProperties Properties;
    }
  }
}
#endif
