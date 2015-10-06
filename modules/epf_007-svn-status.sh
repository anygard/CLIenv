#!/usr/bin/env bash
#
#   Copyright
#
#       Copyright (C) 2015 Anders Nygard <anders.nygard@anygard.com>
#
#   License
#
#       This program is free software; you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation; either version 2 of the License, or
#       (at your option) any later version.
#
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#       GNU General Public License for more details
#       at <http://www.gnu.org/licenses/>.
#
#set -x
FOO=$(mktemp)
LABEL=svn
DATA=""
svn status &> $FOO
grep "W155007" $FOO &> /dev/null
if [ "$?" != 0 ] ; then
        ALL="$(cat $FOO | wc -l)"
        cat /dev/null > $FOO
        svn status --depth files &> $FOO
        SHALLOW="$(cat $FOO | wc -l)"
        if [ "$ALL" -gt 0 ]; then 
                DATA="$SHALLOW($ALL)"
        else
                DATA="ok"
        fi
fi
rm $FOO

if [ $DATA ]; then
    echo -e "${LABEL}:${DATA}"
fi
