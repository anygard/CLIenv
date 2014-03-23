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

case $CMD in 
    ENABLE)
	if [ "$SRC" != "$TRG" ]; then
	    if [ -d $TRG ]; then
		echo "$TRG ellready exist"
		exit 2
	    fi
	    if [ "$CLIENV_DEBUG" = "Y" ]; then
		cp -a $SRC $TRG
	    else
		mv $SRC $TRG
	    fi
	fi
	;;

    NAME)
	echo "install"
	;;

    DESCRIBE)
	echo "install in correct dir"
	;;

    DISABLE)
	echo "Ignored"
	;;
esac

