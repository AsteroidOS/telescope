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

OTHER_FILES += telescope.apparmor \
               telescope.desktop \
               icon.svg

#specify where the config files are installed to
config_files.path = /telescope
config_files.files += $${OTHER_FILES}
message($$config_files.files)
INSTALLS+=config_files

# Default rules for deployment.
target.path = /telescope
INSTALLS+=target

HEADERS += \
    servicecontrol.h \
    watch.h \
    watches.h \
