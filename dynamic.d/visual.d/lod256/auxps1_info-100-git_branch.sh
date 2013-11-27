function auxps1_info-100-git_branch {
    GITSTAT=$(git status --porcelain)
    GITES=$?
    if [ $GITES -eq 0 ]; then
	BRANCH=$(git status | head -1 | cut -d' ' -f4)

	if [ -z "$GITSTAT" ]; then
	    COLOR=${GREEN}
	else
	    COLOR=${ORANGE}
	fi
	AUXPS1_INFO_ARRAY+=("gb:${DELIM}\033[${COLOR}m${BRANCH}\033[00m")
    fi
}

PROMPT_COMMAND_ARRAY=+('auxps1_info-100-git_branch')
