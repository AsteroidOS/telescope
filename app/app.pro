TEMPLATE = app
TARGET = telescope

load(ubuntu-click)

QT += qml quick dbus
CONFIG += c++11

SOURCES += \
    servicecontrol.cpp \
    watch.cpp \
    watches.cpp \
    main.cpp

RESOURCES += app.qrc

# Default rules for deployment.
target.path = /
INSTALLS+=target

HEADERS += \
    servicecontrol.h \
    watch.h \
    watches.h \
