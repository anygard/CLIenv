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

_hostname_complete () {
   local cur prev
   COMPREPLY=()
   cur=`echo ${COMP_WORDS[COMP_CWORD]} | tr [:lower:] [:upper:]`
   prev=`echo ${COMP_WORDS[COMP_CWORD-1]} | tr [:lower:] [:upper:]`

   if [[ "${cur}" == "" ]] ; then
       COMPREPLY=( $(compgen -A hostname }) )
       return 0
   else
       COMPREPLY=( $(compgen -A hostname | grep ${cur}) )
       return 0
   fi
}
complete -F _hostname_complete jc
complete -F _hostname_complete ssh-copy-id
complete -F _hostname_complete ping
complete -F _hostname_complete colonize
complete -F _hostname_complete scp
