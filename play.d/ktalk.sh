#!/bin/sh

PKGNAME=ktalk
SUPPORTEDARCHES="x86_64"
VERSION="$2"
DESCRIPTION="Контур.Толк (ktalk) from the official site"
URL="https://kontur.ru/talk"

. $(dirname $0)/common.sh

warn_version_is_not_supported

PKGURL="https://app.ktalk.ru/system/dist/download/linux"

# curl can't get filename: https://github.com/curl/curl/issues/8461
epm assure wget || fatal
EGET_BACKEND=wget epm pack --install $PKGNAME $PKGURL
