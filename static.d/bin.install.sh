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

SRC=$1/bin
TRG=$2/bin

if [ -d $SRC -a ! -L $TRG ]; then
    ln -s $SRC $TRG
fi
