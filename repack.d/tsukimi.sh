#!/bin/sh -x

# It will be run with two args: buildroot spec
BUILDROOT="$1"
SPEC="$2"

. $(dirname $0)/common.sh

add_bin_link_command $PRODUCT $PRODUCTDIR/$PRODUCT

add_requires "/usr/bin/clapper"

install_file https://raw.githubusercontent.com/tsukinaha/tsukimi/refs/heads/main/resources/icons/tsukimi.png /usr/share/pixmaps/$PRODUCT.png
install_file https://raw.githubusercontent.com/tsukinaha/tsukimi/refs/heads/main/resources/moe.tsuna.tsukimi.gschema.xml /usr/share/glib-2.0/schemas/moe.tsuna.tsukimi.gschema.xml

# create desktop file
cat <<EOF | create_file /usr/share/applications/$PRODUCT.desktop
[Desktop Entry]
Name=Tsukimi
Exec=$PRODUCT
Type=Application
Icon=$PRODUCT
Categories=AudioVideo;
StartupWMClass=moe.tsuna.tsukimi
EOF

add_libs_requires
