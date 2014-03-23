#!/usr/bin/env bash

LABEL='vim'

if [ "$VIM_SERVERNAME" ] ; then
    echo -e "${LABEL}:$(echo $VIM_SERVERNAME | tr [:upper:] [:lower:])"
fi
