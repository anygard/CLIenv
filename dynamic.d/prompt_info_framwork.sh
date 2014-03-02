#!/bin/bash

function prompt_information_framwwork {
    pushd ~/.CLIenv/dynamic.d/prompt_infoemation_framework.d > /dev/null
    for f in * ; do
        if [ -x $f ] ; then
            source $f
        fi
    done
    popd
    for ITEM in \"\${PROMPT_INFO_FRAMWORK[@]}\"; do 
        LABEL=$(echo $ITEM | cut -f1)
        DATA=$(echo $ITEM | cut -f2)
        PROMPT_INFO_FRAMEWORK+="${LABEL}:${DATA} "
    done
}

PROMPT_COMMAND_ARRAY+=(prompt_infoemation_framework)
