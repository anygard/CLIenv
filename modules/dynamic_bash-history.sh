# append instead of clobbering existing history
shopt -s histappend

# multi line commadn on one line
shopt -s cmdhist

# looooong history
export HISTFILESIZE=1000000
export HISTSIZE=1000000

# ignore command starting with a ' ' and duplicate issuances of a command
export HISTCONTROL=ignoreboth

# ignore these commands
#export HISTIGNORE='ls:bg:fg:history'

# time stamps in .bash_history
export HISTTIMEFORMAT='%F %T '

#comitting history to disk on each prompt, the () are critical
PROMPT_COMMAND_ARRAY+=('history -a')
