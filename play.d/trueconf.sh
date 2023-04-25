#!/bin/sh

PKGNAME=trueconf
SUPPORTEDARCHES="x86_64"
VERSION="$2"
DESCRIPTION="TrueConf client for Linux from the official site"

. $(dirname $0)/common.sh

epmopt=''
case "$(epm print info -e)" in
    ALTLinux/p10|ALTServer/10|ALTLinux/Sisyphus)
        URL="https://mirror.trueconf.ru/altlinux/p10/x86_64/RPMS.non-free/trueconf-${VERSION}.x86_64.rpm"
        epmopt='--direct --repack'
        ;;
    ALTLinux/p9)
        URL="https://mirror.trueconf.ru/altlinux/p9/x86_64/RPMS.non-free/trueconf-${VERSION}.x86_64.rpm"
        epmopt='--direct --repack'
        ;;
    AstraLinuxCE/2.12*)
        URL="https://mirror.trueconf.ru/astra212/pool/non-free/t/trueconf/trueconf_${VERSION}_amd64.deb"
        ;;
    AstraLinuxSE/1.7*)
        URL="https://mirror.trueconf.ru/astra17/pool/non-free/t/trueconf/trueconf_${VERSION}_amd64.deb"
        ;;
    RedOS/7.2)
        URL="https://mirror.trueconf.ru/redos/7.2/x86_64/release/trueconf-${VERSION}.x86_64.rpm"
        ;;
    RedOS/7.3*)
        URL="https://mirror.trueconf.ru/redos/7.3.1/x86_64/release/trueconf-${VERSION}.x86_64.rpm"
        ;;
    ROSA/2021)
        URL="https://mirror.trueconf.ru/rosa/R12/x86_64/testing/trueconf-${VERSION}.x86_64.rpm"
        ;;
    *)
        fatal "$(epm print info -e) is not supported"
esac

# --repack includes --noscripts
epm install $epmopt "$URL" || exit
