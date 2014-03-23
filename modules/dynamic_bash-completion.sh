#!/usr/bin/env bash

# are we on a mac with macports installed?
if [[ $(uname -s) == "Darwin" && $(which port) ]]; then
    FILE=/opt/local/etc/profile.d/bash_completion.sh
fi

# apply
if [[ $FILE && -f $FILE ]]; then
    source $FILE
fi
