#!/usr/bin/env bash

uname -s #Linux or Darwin or Cygwin

# if [ "$(uname)" == "Darwin" ]; then
#     # Do something under Mac OS X platform
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
#     # Do something under GNU/Linux platform
# elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
#     # Do something under Windows NT platform
# fi

# Link all shell files (ending in sh) to bin without sh extension
cd bin/src
for i in *.sh; do
    y=${i%.*}
    cd ..
    echo linking file $i to bin/${y##*/}
    ln -sf  src/${i} ${y##*/}
    cd src
done
cd ../..


# Compile all go sources
cd bin/src
for i in *.go; do
    y=${i%.*}
    cd ..
    echo building file $i to bin/${y##*/}
    go build  src/${i}
    cd src
done
cd ../..


# Make some links
# xfce keyboard shortcuts
cd ~
cd ~/.config/xfce4/xfconf/xfce-perchannel-xml/
ln -s ~/.dotfiles/xfce4-keyboard-shortcuts.xml
