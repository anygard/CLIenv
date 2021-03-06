#!/usr/bin/env bash

function refresh_prompt {
    if [ $VIRTUAL_ENV ]; then
        if echo $PS1 | egrep "^\($(basename $VIRTUAL_ENV)\)" > /dev/null ; then
            source ~/.CLIenv/modules/visual.d/default/prompt.sh
        fi
    fi
}

PROMPT_COMMAND_ARRAY+=(refresh_prompt)
