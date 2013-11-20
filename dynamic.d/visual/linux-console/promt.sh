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

# set a fancy prompt (non-color, unless we know we "want" color)
echo "TERM:${TERM}"
case "$TERM" in
xterm-color|xterm)
    . ~/.theme/attributes.sh
    CLERROR="$DEFAULT;$RED"
    CLERROR="$DEFAULT;$ORANGE"
    CLUSERHOST="$DEFAULT;$GREEN"
    CLPATH="$DEFAULT;$LIGHTBLUE"
    export PS1='$(Q=$?; if [ "$Q" -eq "0" ]; then echo "\A";  else printf "\[\e[00;31m\]%05d\[\e[00m\]" $Q; fi) \j \[\033[00;32m\]\u@\h\[\033[00m\]:\[\033[00;94m\]\w\[\033[00m\]\$ '
#    PS1="$(Q=$?; if [ \"$Q\" -eq \"0\" ]; then echo \"\A\";  else printf \"\[\e[${CLERROR}m\]%05d\[\e[00m\]\" $Q; fi) \j \[\033[${CLUSERHOST}m\]\u@\h\[\033[00m\]:\[\033[${CLPATH}m\]\w\[\033[00m\]\$ "
    ;;
*)
    PS1='\u@\h:\w\$ '
    ;;
esac
