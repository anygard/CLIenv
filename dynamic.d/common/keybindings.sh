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

bind '"\ez"':"\"fg\\n\""                # Esc-z emits fg\n for going back into to program you ctrl-z from
bind '"\ex"':"\"\$_\\n\""               # Esc-x emits $_\n adds the last arg of the previous command and executes the command
bind -x '"\es"':"\"echo \$_\""          # Esc-s echos the last arg of the prev command and then takes you to the same place in the command-line
