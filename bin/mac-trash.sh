#!/bin/bash

TRASH=$HOME/.Trash

if  [ -e $TRASH ] ; then
    mv $1 $TRASH
fi

