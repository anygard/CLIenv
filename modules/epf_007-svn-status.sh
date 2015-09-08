#!/usr/bin/env bash
#set -x
FOO=$(mktemp)
LABEL=svn
DATA=""
svn status &> $FOO
grep "W155007" $FOO &> /dev/null
if [ "$?" != 0 ] ; then
        ALL="$(cat $FOO | wc -l)"
        cat /dev/null > $FOO
        svn status --depth files &> $FOO
        SHALLOW="$(cat $FOO | wc -l)"
        if [ "$ALL" -gt 0 ]; then 
                DATA="$SHALLOW($ALL)"
        else
                DATA="ok"
        fi
fi
rm $FOO

if [ $DATA ]; then
    echo -e "${LABEL}:${DATA}"
fi
