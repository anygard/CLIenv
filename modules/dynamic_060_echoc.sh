function echoc {
    color=$1
    shift
    if [ $# -lt 1 ]; then
        msg=$color
        color=
    else
        msg="$*"
    fi

    if [ $color ]; then
        echo -e "\033[${color}m${msg}\033[0m"
    else
        echo "${msg}"
    fi

}
