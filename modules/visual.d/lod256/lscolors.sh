#!/usr/bin/env bash

#       Copyright 2011, 2012, 2013 Anders Nygård
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
#           along with CLIenv.  If not, see <http://www.gnu.org/licenses/>.

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $THISDIR/../attributes.sh

source palette.sh

EXECUTABLE=$LIGHTBLUE
REGULAR=$GREY
SYMLINK=$CYAN
SYMLORPH=$CYAN2
SYMLMISS=$CYAN3
SOCKET=$PURPLE
DEVICE=$ORANGE
DIRECTORY=$LIGHTBLUE2
FIFO=$PINK
ARCHIVE=$RED
MULTIMEDIA=$PURPLE2

export LS_COLORS="\
no=$REGULAR:\
fi=$REGULAR:\
di=$DIRECTORY:\
ln=$SYMLINK:\
pi=$FIFO:\
so=$SOCKET:\
do=01;35:\
bd=$DEVICE:\
cd=$DEVICE:\
or=$SYMLORPH:\
ex=$EXECUTABLE:\
*.cmd=$EXECUTABLE:\
*.exe=$EXECUTABLE:\
*.com=$EXECUTABLE:\
*.bat=$EXECUTABLE:\
*.btm=$EXECUTABLE:\
*.dll=$EXECUTABLE:\
*.tar=$ARCHIVE:\
*.tbz=$ARCHIVE:\
*.tgz=$ARCHIVE:\
*.rpm=$ARCHIVE:\
*.deb=$ARCHIVE:\
*.arj=$ARCHIVE:\
*.taz=$ARCHIVE:\
*.lzh=$ARCHIVE:\
*.zip=$ARCHIVE:\
*.zoo=$ARCHIVE:\
*.z=$ARCHIVE:\
*.Z=$ARCHIVE:\
*.gz=$ARCHIVE:\
*.bz2=$ARCHIVE:\
*.tb2=$ARCHIVE:\
*.tz2=$ARCHIVE:\
*.tbz2=$ARCHIVE:\
*.avi=$MULTIMEDIA:\
*.bmp=$MULTIMEDIA:\
*.fli=$MULTIMEDIA:\
*.gif=$MULTIMEDIA:\
*.jpg=$MULTIMEDIA:\
*.jpeg=$MULTIMEDIA:\
*.mng=$MULTIMEDIA:\
*.mov=$MULTIMEDIA:\
*.mpg=$MULTIMEDIA:\
*.pcx=$MULTIMEDIA:\
*.pbm=$MULTIMEDIA:\
*.pgm=$MULTIMEDIA:\
*.png=$MULTIMEDIA:\
*.ppm=$MULTIMEDIA:\
*.tga=$MULTIMEDIA:\
*.tif=$MULTIMEDIA:\
*.xbm=$MULTIMEDIA:\
*.xpm=$MULTIMEDIA:\
*.dl=$MULTIMEDIA:\
*.gl=$MULTIMEDIA:\
*.aiff=$MULTIMEDIA:\
*.au=$MULTIMEDIA:\
*.mid=$MULTIMEDIA:\
*.mp3=$MULTIMEDIA:\
*.ogg=$MULTIMEDIA:\
*.voc=$MULTIMEDIA:\
*.wav=$MULTIMEDIA:\
"



# OS X works a bit differently, or rahter BSD does
# a     black
# b     red
# c     green
# d     brown
# e     blue
# f     magenta
# g     cyan
# h     light grey
# A     bold black, usually shows up as dark grey
# B     bold red
# C     bold green
# D     bold brown, usually shows up as yellow
# E     bold blue
# F     bold magenta
# G     bold cyan
# H     bold light grey; looks like bright white
# x     default foreground or background

DIR=ex
SYMLINK=fx
SOCKET=cx
PIPE=dx
EXEC=bx
BLOCK=eg
CHAR=ed
SUID=ab
GUID=ag
SWO=ac
SWWO=ad
export LSCOLORS="$SYMLINK$SOCKET$PIPE$EXEC$BLOCK$CHAR$SUID$GUID$SWO$SWWO"


