function auxps1_info-virtual_env {
    if [ ! -z $VIRTUAL_ENV ]; then
	AUXPS1_INFO_ARRAY+=("ve:$(basename $VIRTUAL_ENV)")
    fi
}

PROMPT_COMMAND_ARRAY+=('auxps1_info-virtual_env')
