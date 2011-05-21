#!/bin/bash

#       Copyright 2011 Anders Nygård
#       
#       This file is part of CLIenv.
#       
#           CLIenv is free software: you can redistribute it and/or modify
#           it under the terms of the GNU General Public License as published by
#           the Free Software Foundation, either version 3 of the License, or
#           (at your option) any later version.
#       
#           CLIenv is distributed in the hope that it will be useful,
#           but WITHOUT ANY WARRANTY; without even the implied warranty of
#           MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#           GNU General Public License for more details.
#       
#           You should have received a copy of the GNU General Public License
#           along with Foobar.  If not, see <http://www.gnu.org/licenses/>.

GITDIR=CLIenv
TARGET_PREFIX=.$GITDIR
LINK_PREFIX=~

if [ -e $TARGET_PREFIX ]; then
    echo "$TARGET_PREFIX allready exist"
    echo 1
fi

mv $PWD/../$GITDIR $PWD/../$TARGET_PREFIX 
if [ $? -ne 0 ]; then
    echo "Could not move $GITDIR to $TARGET_PREFIX"
    exit 2
fi

TARGET[0]=$TARGET_PREFIX/bin
LINK[0]=$LINK_PREFIX/bin

TARGET[1]=$TARGET_PREFIX/theme
LINK[1]=$LINK_PREFIX/.theme

TARGET[2]=$TARGET_PREFIX/vim/vimrc
LINK[2]=$LINK_PREFIX/.vimrc

TARGET[3]=$TARGET_PREFIX/vim/vim
LINK[3]=$LINK_PREFIX/.vim

i=0
while [ $i -le 3 ] ; do
    if [ -s ${LINK[$i]} ] ; then
            mv ${LINK[$i]} ${LINK[$i]}.orig
    fi 
    ln -s ${TARGET[$i]} ${LINK[$i]}
    i=$[ $i + 1 ]
done

cat <<EOF | cat >> ~/.bashrc
test -s ~/.theme/theme.sh && . ~/.theme/theme.sh gnome-terminal || true
EOF
