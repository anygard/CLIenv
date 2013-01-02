#!/bin/bash

if [ "`uname`" = "Darwin" ]; then
    PROMPT_COMMAND+="~/bin/mac-battery -pi"
fi
