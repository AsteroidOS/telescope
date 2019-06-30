TEMPLATE = app
TARGET = telescope

load(ubuntu-click)

#QT += qml quick dbus
#CONFIG += c++11

OTHER_FILES += icon.svg

#specify where the config files are installed to
config_files.path = /assets
config_files.files += $${OTHER_FILES}
message($$config_files.files)
INSTALLS+=config_files
