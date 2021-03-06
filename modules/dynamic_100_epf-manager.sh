#!/usr/bin/env bash

export PROMPT_INFO_ARRAY=()
export PROMPT_INFO_LABEL_COL=105
export PROMPT_INFO_DATA_COL=115

function epf-manager {
    PROMPT_INFO_ARRAY=()
    DELIM=""
    for f in ~/.CLIenv/modules/epf*sh  ; do
        if [ -x $f ] ; then
            BUFFER=$(source $f)
            if [ "$BUFFER" ]; then
                LABEL=$(echo $BUFFER | cut -d: -f1)
                DATA=$(echo $BUFFER | cut -d: -f2)
                echo -en "${DELIM}$(echoc ${CLIenv_PALETTE["DIMMED"]} $LABEL):$(echoc ${CLIenv_PALETTE["HIGHLIGHT"]} $DATA)"
                #echo -en "${DELIM}\033[${CLIenv_PALETTE_DIMMED}m${LABEL}\033[0m:\033[${CLIenv_PALETTE_EMPHASIS}m${DATA}\033[0m"
                #echo -en "${DELIM}(\033[38;5;${PROMPT_INFO_LABEL_COL}m${LABEL}\033[0m:\033[38;5;${PROMPT_INFO_DATA_COL}m${DATA}\033[0m)"
                #DELIM="--"
                DELIM=" "
            fi
        fi
    done
    if [[ $DELIM != "" ]]; then
        echo
    fi

}

PROMPT_COMMAND_ARRAY+=('epf-manager')
