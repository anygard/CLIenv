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
            if [ "$BUFFER" ]; then
                LABEL=$(echo $BUFFER | cut -d\\ -f1)
                DATA=$(echo $BUFFER | cut -d\\ -f2)
                echo -en "${DELIM}\033[38;5;${PROMPT_INFO_LABEL_COL}m${LABEL}\033[0m:\033[38;5;${PROMPT_INFO_DATA_COL}m${DATA}\033[0m"
                DELIM=" "
            fi
        fi
    done
    if [[ $DELIM = " " ]]; then
        echo
    fi

}

PROMPT_COMMAND_ARRAY+=('prompt_info_framework')
