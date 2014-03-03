#!/bin/bash

export PROMPT_INFO_ARRAY=()
export PROMPT_INFO_LABEL_COL=105
export PROMPT_INFO_DATA_COL=115

function prompt_info_framework {
    PROMPT_INFO_ARRAY=()
    DELIM=""
    for f in ~/.CLIenv/dynamic.d/prompt_info_framework.d/*  ; do
        if [ -x $f ] ; then
            BUFFER=$(source $f)
            LABEL=$(echo $BUFFER | cut -d\\ -f1)
            DATA=$(echo $BUFFER | cut -d\\ -f2)
            echo -en "${DELIM}\033[38;5;${PROMPT_INFO_LABEL_COL}m${LABEL}\033[0m:\033[38;5;${PROMPT_INFO_DATA_COL}m${DATA}\033[0m"
            DELIM=" "
        fi
    done
    if [[ $DELIM = " " ]]; then
        echo
    fi

    #PROMPT_INFO_FRAMEWORK=""
    #for ITEM in "${PROMPT_INFO_ARRAY[@]}"; do 
    #    LABEL=$(echo $ITEM | cut -d\\ -f1)
    #    DATA=$(echo $ITEM | cut -d\\ -f2)
    #    #PROMPT_INFO_FRAMEWORK+="\e[${PROMPT_INFO_LABEL_COL}m]${LABEL}\e[00m]:\e[${PROMPT_INFO_DATA_COL}m]${DATA}\e[00m]${DELIM}"
    #    echo -en "${DELIM}\033[38;5;${PROMPT_INFO_LABEL_COL}m${LABEL}\033[0m:\033[38;5;${PROMPT_INFO_DATA_COL}m${DATA}\033[0m"
    #    DELIM=" "
    #done
    #if [[ $DELIM = " " ]]; then
    #    echo
    #fi
    #if [ "$PROMPT_INFO_FRAMEWORK" ]; then
    #    echo -e "$PROMPT_INFO_FRAMEWORK"
    #fi
}

PROMPT_COMMAND_ARRAY+=('prompt_info_framework')
