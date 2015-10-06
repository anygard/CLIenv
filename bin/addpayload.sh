#!/bin/bash

# this script adds a binary blob a tar.gz file at the en of a shell script
# usefull for shell install scripts. The resulting file will start with a
# script and after the script there will be the word PAYLOAD on a line by
# itself. All data after that is the blob

# Check for payload format option (default is uuencode).


if [[ "$#" -ne 4 ]]; then
	echo "Usage: $0 SCRIPT_FILE PAYLOAD_FILE $#"
	exit 1
fi
scriptfname=$1
if [ -f $scriptfname ]; then
    echo "Could not open scriptfile: $scriptfname"
    exit 2
fi
payloadfname=$2
if [ -f $payloadfname ]; then
    echo "Could not open payloadfile: $payloadfname"
    exit 3
fi
targetfname=$3

cat $scriptfname > $targetfname
echo "PAYLOAD:" >> $targetfname
cat $payloadfname >> $targetfname

