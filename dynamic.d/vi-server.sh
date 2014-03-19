
# this overrides any vi aliases setup
unalias vi &> /dev/null

VIM_VIM=""

if [[ "$(uname)" == "Darwin" ]]; then
    VER=mvim
else
    VER=gvim
fi

if VIM_VIM=$(which $VER) ; then
    function vi {

        if [ $# -lt 1 ]; then
            echo "Usage: $FUNCNAME [-s <server>] [file1 [file2 [file3 . . . fileN ] ] ]"
            return
        fi

        if [ "$1" == "-s" ]; then
            if [ $2 ]; then
                export VIM_SERVERNAME=$(echo "$2" | tr '[:lower:]' '[:upper:]')
                shift 2
            else
                echo "Usage: $FUNCNAME [-s <server>] [file1 [file2 [file3 . . . fileN ] ] ]"
                return
            fi
        fi

        if [ ! $VIM_SERVERNAME ]; then
            echo "No servername set, use -s to rectify"
            return
        fi

        if [[ "$($VIM_VIM --serverlist)" =~ "$VIM_SERVERNAME" ]]; then
            # editing files
            $VIM_VIM --servername "$VIM_SERVERNAME" --remote "$@"
        else
            # starting server if needed
            $VIM_VIM --servername "$VIM_SERVERNAME" "$@"
        fi
    }
else
    if VIM_VIM=$(which vim) ; then
        alias vi=$VIM_VIM
    fi
fi

unset VER
