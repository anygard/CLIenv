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

if [ "$CLIENV_DEBUG" = "Y" ]; then
    set -x
fi

THISDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ -z $VISUAL_THEME ]; then
    VISDIR=$THISDIR/visual.d/default
else
    VISDIR=$THISDIR/visual.d/$VISUAL_THEME
fi

if [ ! -e $VISDIR ]; then
    echo "Visual dir does not exist, $VISDIR"
    exit 2
fi

pushd $VISDIR > /dev/null

for a in `ls *.sh` ; do
    if [ -f $a -a -x $a ]; then
	source ./$a
    fi
done

popd > /dev/null
