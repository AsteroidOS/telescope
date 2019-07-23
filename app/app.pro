TEMPLATE = app
TARGET = telescope

load(ubuntu-click)

QT += qml quick dbus
CONFIG += c++11

DESTDIR = lib/arm-linux-gnueabhif/qt5/qml/org/asteroid/syncservice/asteroidsyncserviceplugin

SOURCES += \
    main.cpp

RESOURCES += app.qrc

# Default rules for deployment.
target.path = /
INSTALLS+=target
