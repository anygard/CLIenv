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

set -x
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
INSTALLDIR="$HOME/foo"
INSTALLDIR="$HOME"
TARGET="$INSTALLDIR/.CLIenv"

if [ "$THISDIR" != "$TARGET" ]; then
    if [ -d $TARGET ]; then
	echo "$TARGET ellready exist"
	exit 2
    fi
    mv $THISDIR $TARGET
    cd $TARGET
    $TARGET/static.sh $1
    exit 0
fi


if [ "$1" = "" ]; then
    COMMAND=INSTALL
else
    COMMAND=$1
fi

# install dynamic hook
HOOK="$TARGET/dynamic.sh"
for f in ".bash_profile" ".bashrc" ; do
    if ! grep "$HOOK" $INSTALLDIR/$f ; then
	echo -e "\n# CLIenv dynamic hook\ntest -s $HOOK && . $HOOK || true" >> $INSTALLDIR/$f
    fi
done

COMMAND=`echo $COMMAND | tr 'A-Z' 'a-z'`

SCRIPTDIR="$THISDIR/static.d" 
if [ -d "$SCRIPTDIR" ] ; then
    pushd $SCRIPTDIR > /dev/null
    for script in `ls *.$COMMAND.sh | sort` ; do
	if [ -x $script ] ; then
	    ./$script "$TARGET" "$INSTALLDIR"
	fi
    done
    popd > /dev/null
fi

