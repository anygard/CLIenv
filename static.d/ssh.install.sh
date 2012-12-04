#!/bin/bash

#       Copyright 2011 Anders Nygård
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
#           along with Foobar.  If not, see <http://www.gnu.org/licenses/>.


set -x

SRC="$1/misc/ssh.conf"
TRGDIR="$2/.ssh/"
TRG="$TRGDIR/config"

if [ ! -d $TRGDIR ]; then
    mkdir $TRGDIR 
    chmod a=,u=rwx $TRGDIR
fi

if [ -e $SRC ]; then
    if [ ! -e $TRG ]; then
	ln -s $SRC $TRG
    else
	echo "Not able to install SSH config file, please, merge manually $TRG.add into $TRG"
	cp $SRC $TRG.add
    fi
fi
