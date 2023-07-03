#!/bin/sh -x
# It will run with two args: buildroot spec
BUILDROOT="$1"
SPEC="$2"

PRODUCT=brave-browser
PRODUCTCUR=brave-browser-nightly
PRODUCTDIR=/opt/brave.com/brave-nightly

. $(dirname $0)/common-chromium-browser.sh

subst '1iConflicts:brave-browser brave-browser-beta' $SPEC

set_alt_alternatives 80

copy_icons_to_share

cleanup

add_bin_commands

use_system_xdg

add_deps

subst '1iAutoReq:no' $SPEC
