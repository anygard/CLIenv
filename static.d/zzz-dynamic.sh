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

HOOK="$TARGET/dynamic.sh"
case $3 in
    ENABLE)
	for f in ".bash_profile" ".bashrc" ; do
	    if ! grep "$HOOK" $INSTALLDIR/$f ; then
		echo -e "\n# CLIenv dynamic hook\ntest -s $HOOK && . $HOOK || true" >> $INSTALLDIR/$f
	    fi
	done
	;;

    NAME)
	echo "dynhook"
	;;

    DESCRIBE)
	echo "installs dynamic hook"
	;;

    DISABLE)
	if [ -e "$HOOK" ]; then
	    mv "$HOOK" "$HOOK.disabled"
	fi
	;;
esac
