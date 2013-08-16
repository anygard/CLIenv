#!/bin/bash

#       Copyright 2011, 2012, 2013 Anders Nygård
#       
#       This file is part of CLIenv.
#       
#           CLIenv is free software: you can redistribute it and/or modify
#           it under the terms of the GNU General Public License as published by
#           the Free Software Foundation, either version 3 of the License, or
#           (at your option) any later version.
#       
#           CLIenv is distributed in the hope that it will be useful,
#           but WITHOUT ANY WARRANTY; without even the implied warranty of
#           MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#           GNU General Public License for more details.
#       
#           You should have received a copy of the GNU General Public License
#           along with CLIenv.  If not, see <http://www.gnu.org/licenses/>.

function usage {
    echo "usage: $0 <theme>"
    exit 1
}

if [ "$1" = "" ]; then
    usage
fi

THEMEDIR=$HOME/.theme/$1

if [ ! -d $THEMEDIR ]; then
    echo "Theme dir non existant ($THEMEDIR)"
    exit 2
fi

pushd $THEMEDIR > /dev/null
for a in *.sh ; do
    if [ -x $a ]; then
        source ./$a
    fi
done
popd > /dev/null

COMMONDIR=$HOME/.theme/common
if [ ! -d $COMMONDIR ]; then
    echo "Theme dir non existant ($COMMONDIR)"
    exit 2
fi

pushd $COMMONDIR > /dev/null
for a in *.sh ; do
    if [ -x $a ]; then
        source ./$a
    fi
done
popd > /dev/null
