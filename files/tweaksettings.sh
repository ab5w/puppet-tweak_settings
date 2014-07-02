#!/bin/bash
#
#   Script to update a tweak settings value, or add it if it doesn't exist.
#
#   http://docs.cpanel.net/twiki/bin/view/AllDocumentation/InstallationGuide/AdvancedOptions#How%20to%20pre-configure%20cPanel%20%20WHM
#
#   Copyright (C) 2014 Craig Parker <craig@paragon.net.uk>
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; If not, see <http://www.gnu.org/licenses/>.
#
#

if [ $# -ne 2 ]; then

    exit 0

fi

name=$1
value=$2

cpconfig="/var/cpanel/cpanel.config";

if ! grep -qE '^\s*'"$name"'\s*=' $cpconfig; then

    echo "$name=$value" >> $cpconfig;
    `head $cpconfig | awk -F"'" '/whostmgr/ {print $2}'`

elif grep -qE '^\s*'"$name"'\s*=' $cpconfig; then

    cvalue=$(awk -F= '/^\s*'"$name"'\s*=/ {print $2}' $cpconfig | head -n 1)

    if ! [ "$cvalue" == "$value" ]; then

        sed -i '/^\s*'"$name"'\s*=/s/'"$cvalue"'/'"$value"'/' $cpconfig
        `head $cpconfig | awk -F"'" '/whostmgr/ {print $2}'`

    fi

fi
