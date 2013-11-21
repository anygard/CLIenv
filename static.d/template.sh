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

SRC=$1
TRG=$2
INST=$3
CMD=$4

SOURCE=$TRG/FOOBAR.conf
TARGET=$INST/FOOBAR.conf

case $CMD in
    ENABLE)
	if [ -e $SOURCE ]; then
	    if [ ! -e $TARGET ]; then
		ln -s $SOURCE $TARGET
	    else
		echo "Could not install FOOBAR please merge manually $TARGET.add into $TARGET"
		cp $SOURCE $TARGET.add
	    fi
	fi
	;;

    NAME)
	echo "FOOBAR"
	;;

    DESCRIBE)
	echo "Config file for FOOBAR"
	;;

    DISABLE)
	if [ -e $TARGET ]; then
		rm $TARGET
	fi
	;;

esac
