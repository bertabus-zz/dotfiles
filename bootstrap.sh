#!/bin/env sh

# Link all shell files (ending in sh) to bin without sh extension
cd bin/src
for i in *.sh; do
    y=${i%.*}
    cd ..
    echo linking file $i to bin/${y##*/}
    ln -s  src/${i} ${y##*/}
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
