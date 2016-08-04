My dotfiles
===========

I Keep most my config files linked in my home folder from my dotfiles.
It would be great to have everything in a `.config` file but not enough
programs use this currently to make it worthwhile.

my ZSHrc is heavily dependant on [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
and I clone mine in ~/.oh-my-zsh/ (just take a look in my zshrc).
Clone my config with
``` sh
mkdir ~/.dotfiles
cd ~/.dotfiles
git clone https://github.com/bertabus/dotfiles .
```

In order to get everything setup right run the bootstrap file.
``` sh
cd ~/.dotfiles
chmod +x bootstrap.sh
./bootstrap.sh
```

Also take a look at the my [UDEV rules](rules.d/) that are useful for various
embedded programmers.

### Additional Notes

Problems can arise when connecting to remote hosts over ZSH, Typically this is as
simple as exporting the term variable.
```sh
export TERM=xterm
```

I used solve this by copying over my shell
with something along the lines of:
```sh
# on remote server
mkdir -p ~/.terminfo/rl
# on localhost machine
scp /usr/share/terminfo/r/rxvt-256color user@server.com:.terminfo/r/
```


## Mac notes
just clone it and link some files (...add details)
for sure
```sh
ln -s ~/.config/vim/vimrc .vimrc
```
also macvim is the way to go for clang and python interop

## Historical Notes
I really liked xmonad, but I have since move to XFCE. My former files may be found in
older commits under the .config/xmonad folder.

I also really tried to keep everything in a `.config` folder to follow XDG standards
but that didn't work very well for various reasons.
