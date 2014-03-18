#!/usr/bin/env bash

# are we on a mac with macports installed?
if [[ $(uname -o) == "Darwin" && $(which port) ]]; then
    FILE=/opt/local/etc/profile.d/bash_completion.sh
fi

# apply
if [ -f $FILE ]; then
    source $FILE
fi
