#!/bin/bash

bind '"\ez"':"\"fg\\n\""                # Esc-z emits fg\n for going back into to program you ctrl-z from
bind '"\ex"':"\"\$_\\n\""               # Esc-x emits $_\n adds the last arg of the previous command and executes the command
bind -x '"\es"':"\"echo \$_\""          # Esc-s echos the last arg of the prev command and then takes you to the same place in the command-line
