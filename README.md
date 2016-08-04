My dotfiles
===========

I prefer most of my settings to live in the **XDG_CONFIG_HOME**
in order to hide them and keep them all under version control.
I place mine in */home/bertabus/.config* in keeping with the
freedesktop standards. Don't forget to create these files
if they don't exist already.
``` sh
mkdir ~/.config
mkdir ~/.cache
```


*.gitignore* will exclude everything that is in the
directory except those files/folders explicitly called out.
The easiest way to clone is to do it in a clean
folder and move everything from there to where you want it.

my ZSHrc is heavily dependant on [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
and I clone mine in ~/.config/oh-my-zsh/ (just take a look in my zshrc).
Clone my config with
``` sh
cd ~/.config
git clone https://github.com/bertabus/dotfiles .
```

In order to get PATHs setup right link the zshenv file.
``` sh
ln -s ~/.config/zsh/.zshenv ~/.zshenv
```

Vim won't work right without setting RTP and cloning [vundle](https://github.com/gmarik/Vundle.vim)
``` sh
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Also take a look at the my [UDEV rules](rules.d/) that are useful for various
embedded programmers.

I really like xmonad, I don't have a clever way to locate them in .config permanently
so symlink them as usual
``` sh
ln -s ~/.config/xmonad ~/.xmonad
xmonad --recompile
xmonad --restart
touch ~/graphics
```

### Additional Notes

Problems can arise when connecting to remote hosts over ZSH, I solve this by copying over my shell
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
