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

SRC=$1
TRG=$2
INST=$3
CMD=$4

if [ "$CLIENV_DEBUG" = "Y" ]; then
    set -x
fi

SRCFILE="$1/misc/ssh.conf"
TRGDIR="$INST/.ssh/"
TRGFILE="$TRGDIR/config"

case $CMD in 
    ENABLE)
	if [ ! -d $TRGDIR ]; then
	    mkdir $TRGDIR 
	    chmod a=,u=rwx $TRGDIR
	fi

	if [ -e $SRCFILE ]; then
	    if [ ! -e $TRGFILE ]; then
		ln -s $SRCFILE $TRGFILE
	    else
		echo "Not able to install SSH config file, please, merge manually $TRGFILE.add into $TRGDIR"
		cp $SRCFILE $TRGFILE.add
	    fi
	fi
	;;

    NAME)
	echo "ssh"
	;;

    DESCRIBE)
	echo "ssh config template"
	;;

    DISABLE)
	if [ -e $TRGFILE ]; then
	    rm $TRGFILE
	fi
	;;
esac
