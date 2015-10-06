#!/bin/bash

VECTORFNAME='.vector.conf'

cd ~

cat << EOF > $VECTORFNAME
STARTPOINTS='.CLIenv/install.sh .vim/install.sh'
EOF

tar czf payload.tar.gz .CLIenv .vim $VECTORFNAME
