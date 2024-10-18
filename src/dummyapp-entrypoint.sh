#!/bin/bash
# SPDX-FileCopyrightText: 2024 UnionTech Software Technology Co., Ltd.
#
# SPDX-License-Identifier: CC0-1.0

# Command-line arguments
# $1: app name
# $2: app package name to be filled in appstore business URI

. gettext.sh

# We make app names passed by arguments recognizable by gettext, at the cost of writing them down
# twice in the source code and having to go through case statement once
function get_i18n_appname()
{
    case "$1" in
        "WPS Office") eval_gettext "WPS Office"; echo;;
        "Netease Cloud Music") eval_gettext "Netease Cloud Music"; echo;;
        *) echo "$1";;
    esac
}

TEXTDOMAIN="dummyapp-entrypoint"
export TEXTDOMAIN
TEXTDOMAINDIR=/usr/share/locale
export TEXTDOMAINDIR

appname=$(get_i18n_appname "$1")
msg_app_not_installed=$(eval_gettext "\$appname is not installed yet, please install it in the app store."; echo)

notify-send -i deepin-app-store -t 5000 "$msg_app_not_installed"
dbus-send --session --print-reply=literal --dest=com.home.appstore.client \
    /com/home/appstore/client com.home.appstore.client.openBusinessUri string:"app_detail_info/$2"
