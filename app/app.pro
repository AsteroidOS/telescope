TEMPLATE = app
TARGET = telescope

load(ubuntu-click)

QT += qml quick dbus
CONFIG += c++11

SOURCES += \
    main.cpp

RESOURCES += app.qrc

# Default rules for deployment.
target.path = /
INSTALLS+=target
