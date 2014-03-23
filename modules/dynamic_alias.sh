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

GNU='ls --color=auto'
BSD='ls -G'

case `uname -s` in
    Darwin)
	if ls --version > /dev/null ; then
	    alias ls=$GNU
	else
	    alias ls=$BSD
	fi
        ;;
    Linux)
	alias ls=$GNU
        ;;
esac

alias !=sudo
#alias vi='vim -u ~/.vimrc'
