#!/bin/bash

case $1 in
    start)
        bcvi --listener &
        gvim --servername BCVI
        ;;

    stop)
        kill `cat ~/.config/bcvi/listener_pid`
        ;;
    *)
        echo "usage: $0 <start|stop> "
        exit 1
        ;;
esac
