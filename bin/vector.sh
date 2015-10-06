#!/bin/bash

# this script is really just the first part of a weapnonized tar.gz file if you
# will. It is mated to an archive and will unpack that as a part of its
# execution

CONFIGFNAME='.vector.conf'

match=$(grep --text --line-number '^PAYLOAD:$' $0 | cut -d ':' -f 1)
payload_start=$((match + 1))
tail -n +$payload_start $0 | tar -tzvf -

if [ -f $CONFIGFNAME ]; then
    source $CONFIGFNAME
else
    echo "no config file: $CONFIGFNAME"
    exit 1
fi

for sp in $STARTPOINTS ; do
    $sp
done


exit 0

