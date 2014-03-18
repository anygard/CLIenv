#!/usr/bin/env bash
FOO=$(mktemp)
LABEL=git
DATA=""
if git status &> $FOO ; then
    if BAR=$(grep "On branch" $FOO) ; then
        BRANCH=$(echo $BAR | awk '{print $NF}')
    else
        DATA="ERROR1"
    fi
    if grep "nothing to commit" $FOO > /dev/null ; then
        DIRTY=""

    else
        DIRTY="+"
    fi
    if [ -z $DATA ] ; then
        DATA="${BRANCH}${DIRTY}"
    fi
else
    if grep -v "Not a git repository" $FOO > /dev/null ; then
        DATA="ERROR2"
    fi
fi
rm $FOO

if [ $DATA ]; then
    echo -e "${LABEL}:${DATA}"
fi
