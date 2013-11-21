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

if [ "`uname -s`" = "Darwin" ]; then
    if [ ! -e "/opt/local/etc/macports/" ]; then
	echo "MacPorts installation not detected"
	echo -e "\nsudo ports install coreutils"
	exit
    fi
fi

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTDIR="$THISDIR/static.d" 

# INSTALL is the default command
if [ "$1" = "" ]; then
    COMMAND="ENABLE"
else
    COMMAND=$1
fi
COMMAND=`echo $COMMAND | tr 'a-z' 'A-Z'`

if [ ! -z "$3" ]; then
    SUBSET=$3
fi

case "$COMMAND" in 
    TAR)
	pushd "$THISDIR/.."
	dir=`echo $THISDIR | awk -F/ '{print $NF}'`
	tar czf "$INSTALLDIR/$dir.tar.gz" $dir
	res=$?
	popd
	exit $res
	;;
	
    LIST)
	pushd $SCRIPTDIR > /dev/null
	for f in `ls *.sh` ; do
	   name=`./$f foo bar NAME` 
	   desc=`./$f foo bar DESCRIBE` 
	   echo "$name - $desc"
	done
	popd
	;;

    ENABLE|DISABLE)
	if [ -d "$SCRIPTDIR" ] ; then

	    pushd $SCRIPTDIR > /dev/null

	    # reverse order when removing
	    LSOPT=""
	    if [ "$COMMAND" = "DISABLE" ]; then
		LSOPT="-r"
	    fi

	    # filter on optional specific static modules to execute
	    prog=`basename $0`
	    TMPF=`mktemp /tmp/$prog.XXXXXXX`
	    TMPF2=`mktemp /tmp/$prog.XXXXXXX`
	    ls $LSOPT *.sh > $TMPF
	    if [ ! -z $SUBSET ]; then
		grep $SUBSET $TMPF > $TMPF2
	    else
		cat $TMPF > $TMPF2
	    fi

	    # iterate over all remaing static modules
	    for script in `cat $TMPF2` ; do
		if [ -x $script ] ; then
		    ./$script "$THISDIR" "$TARGET" "$INSTALLDIR" "$COMMAND"
		fi
	    done
	    rm $TMPF $TMPF2
	    popd > /dev/null
	fi
	;;

    *)
	echo "Usage: $0 <ENABLE|DISABLE|LIST> [modules]"
	exit 1
	;;

esac
