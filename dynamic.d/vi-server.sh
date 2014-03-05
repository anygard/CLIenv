
# this overrides any vi aliases setup
unalias vi &> /dev/null

VIM_SERVERNAME=VIMSERVER
VIM_VIM=""

if [[ "$(uname)" == "Darwin" ]]; then
    VER=mvim
else
    VER=gvim
fi

if VIM_VIM=$(which $VER) ; then
    function vi {

        if [[ ! "$($VIM_VIM --serverlist)" =~ "$VIM_SERVERNAME" ]]; then
            # starting server if needed
            $VIM_VIM --servername "$VIM_SERVERNAME" "$@"
        else
            # editing files
            $VIM_VIM --servername "$VIM_SERVERNAME" --remote "$@"
        fi


    }
else
    if VIM_VIM=$(which vim) ; then
        alias vi=$VIM_VIM
    fi
fi

unset VER

