#!/usr/bin/env bash

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

if [ "$CLIENV_DEBUG" = "Y" ]; then
    set -x
fi

THISDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DYNDIR=$THISDIR/modules
CONF_FILE=$THISDIR/etc/dynamic.conf

if [ ! -e $DYNDIR ]; then
    echo "dynamic dir does not exist, $DYNDIR"
    exit 2
fi

if [ -e $CONF_FILE ]; then
    source $CONF_FILE
fi

pushd $DYNDIR > /dev/null

for a in `ls dynamic_*sh` ; do
    if [ -f $a -a -x $a ]; then
	source ./$a
    fi
done

popd > /dev/null

if [ "$CLIENV_DEBUG" = "Y" ]; then
    set +x
fi
