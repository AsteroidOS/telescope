TEMPLATE = subdirs

load(ubuntu-click)

SUBDIRS += app asteroidsyncservice

# specify the manifest file, this file is required for click
# packaging and for the IDE to create runconfigurations
UBUNTU_MANIFEST_FILE=manifest.json.in

# specify translation domain, this must be equal with the
# app name in the manifest file
UBUNTU_TRANSLATION_DOMAIN="telescope.asteroidos"

# specify the source files that should be included into
# the translation file, from those files a translation
# template is created in po/template.pot, to create a
# translation copy the template to e.g. de.po and edit the sources
UBUNTU_TRANSLATION_SOURCES+= \
    $$files(app/qml/*.qml,true)
    
# specifies all translations files and makes sure they are
# compiled and installed into the right place in the click package
UBUNTU_PO_FILES+=$$files(po/*.po)

ASSETS_FILES += assets/icon.svg

ARCH_TRIPLET=$$(ARCH_TRIPLET)
QMAKE_SUBSTITUTES += telescope.desktop.in

#specify where the config files are installed to
assets_files.path = /assets
assets_files.files += $${ASSETS_FILES}
message($$assets_files.files)
INSTALLS+=assets_files

OTHER_FILES += asteroidsyncserviced.apparmor \
               telescope.apparmor \
               telescope.desktop

#specify where the config files are installed to
config_files.path = /
config_files.files += $${OTHER_FILES}
message($$config_files.files)
INSTALLS+=config_files
