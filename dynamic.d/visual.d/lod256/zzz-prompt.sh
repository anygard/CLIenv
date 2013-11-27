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

source palette.sh

# set a fancy prompt (non-color, unless we know we "want" color)

case "$TERM" in
    xterm-color|xterm|screen|screen-color|screen-256color|screen-bce|xterm-256color)

	. ../attributes.sh

	CLERROR=$RED
	CLUSERHOST=$GREEN
	CLPATH=$LIGHTBLUE3

	EXITCODE=

	#export PS1="\`Q=\$?; if [ \"\$Q\" -eq \"0\" ]; then echo \"\A\"; else printf \"\[\e[${CLERROR}m\]%05d\" \"\$Q\"; fi\`\[\033[00m\] \j \[\033[${CLUSERHOST}m\]\u@\h\[\033[00m\]:\[\033[${CLPATH}m\]\w\[\033[00m\]\$ "
	export PS1="\`Q=\$?; if [ \"\$Q\" -eq \"0\" ]; then echo \"\A\"; else printf \"\[\e[${CLERROR}m\]%05d\" \"\$Q\"; fi\`\[\033[00m\] \j \`if [ ! -z \"\$AUXPS1_INFO\" ]; then echo -e \"[\$AUXPS1_INFO] \"; fi\`\[\033[${CLUSERHOST}m\]\u@\h\[\033[00m\]:\[\033[${CLPATH}m\]\w\[\033[00m\]\$ "
	;;

    *)
	PS1='\u@\h:\w\$ '
	;;
esac
