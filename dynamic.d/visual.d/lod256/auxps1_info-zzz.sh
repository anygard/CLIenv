function auxps1_info {
    AUXPS1_INFO=
    DELIM=""

    for aux in "${AUXPS1_INFO_ARRAY[@]}" ; do
	AUXPS1_INFO+="${DELIM}$aux"
	DELIM="|"
    done

    AUXPS1_INFO_ARRAY=()
}

PROMPT_COMMAND_ARRAY+=('auxps1_info')
