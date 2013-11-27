

#Set xterm title
function xterm-title {
    pwd=`echo ${PWD} | awk -v h="$HOME" '{gsub(h,"~") ; print}'`
    echo -ne "\033]0;${USER}@${HOSTNAME}: ${pwd}\007"
}

PROMPT_COMMAND_ARRAY+=('xterm-title')
