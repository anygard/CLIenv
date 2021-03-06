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
    INSTALLDIR="$HOME/foobar"
else
    INSTALLDIR="$HOME"
fi
TARGET="$INSTALLDIR/.CLIenv"

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTDIR="$THISDIR/modules" 

if [ ! -d "$SCRIPTDIR" ] ; then
    echo "$SCRIPTDIR missing."
    exit 1
fi

pushd $SCRIPTDIR > /dev/null

# filter on optional specific static modules to execute
#PROG=`basename $0`
TMPF=`mktemp /tmp/$PROG.XXXXXXX`
ls $LSOPT static*.sh > $TMPF

# iterate over all remaing static modules
for script in `cat $TMPF` ; do
    if [ -x $script ] ; then
    ./$script "$THISDIR" "$TARGET" "$INSTALLDIR" ENABLE
    fi
done

popd > /dev/null
rm $TMPF

