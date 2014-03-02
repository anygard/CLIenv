#!/bin/bash

export PROMPT_INFO_ARRAY=()

function prompt_info_framework {
    PROMPT_INFO_ARRAY=()
    for f in ~/.CLIenv/dynamic.d/prompt_info_framework.d/*  ; do
        if [ -x $f ] ; then
            source $f
        fi
    done

    PROMPT_INFO_FRAMEWORK=""
    for ITEM in "${PROMPT_INFO_ARRAY[@]}"; do 
        LABEL=$(echo $ITEM | cut -d\\ -f1)
        DATA=$(echo $ITEM | cut -d\\ -f2)
        PROMPT_INFO_FRAMEWORK+="${LABEL}:${DATA} "
    done
    if [ "$PROMPT_INFO_FRAMEWORK" ]; then
        echo $PROMPT_INFO_FRAMEWORK 
    fi
}

PROMPT_COMMAND_ARRAY+=('prompt_info_framework')
