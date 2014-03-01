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
In order to get PATHs setup right edit your bash or zsh
environment.
``` sh
# File at /etc/zsh/zshenv

if [[ -z "$XDG_CONFIG_HOME" ]]
then
        export XDG_CONFIG_HOME=$HOME/.config
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
then
        export ZDOTDIR="$XDG_CONFIG_HOME/zsh/"
fi


if [[ -z "$XDG_CACHE_HOME" ]]
then
        export XDG_CACHE_HOME=$HOME/.cache
fi
```

Lastly to get X11 set up without needing to move files
edit gdm/kdm/xdm/slim loader config.
``` sh
# File at /etc/slim.conf
# the pertinent line should read
login_cmd  exec /bin/bash -login ~/.config/X11/.xinitrc %session
```

my ZSHrc is heavily dependant on https://github.com/robbyrussell/oh-my-zsh
and I clone mine in ~/.config/oh-my-zsh/ (just take a look in my zshrc).
Clone my config with
``` sh
cd ~/.config
git clone https://github.com/bertabus/dotfiles .
``` 


