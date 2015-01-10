# Bertabus customizations
# feh --randomize --bg-fill ~/Pictures/wallpapers/*
DISABLE_AUTO_UPDATE="true"
setopt DVORAK
export PRINTER=HP_LaserJet_CP1525nw
# export TERM=xterm
export EDITOR=vim
export HISTFILE=$XDG_CONFIG_HOME/.zsh_history

# Set vimrc's location and source it on vim startup
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
# export XDG_CONFIG_HOME=~/.config
export LC_ALL=""
export LC_COLLATE=C
export LANG=en_US.UTF-8

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.config/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="aussiegeek"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(archlinux git git-extras github pip python debian \
	colored-man fasd nyan vundle lol django extract golang)
#requires apt-get install of autojump pip

source $ZSH/oh-my-zsh.sh

# User configuration

# Aliases for Kirsten to be able to print from keypad hooked up

alias 01='scanimage --mode Binary --resolution 600 -x 215.9 -y 279.4 > test.ppm'
alias 01='scanimage --mode Binary --resolution 600 > test.ppm'
alias 01='scanimage --mode Binary --resolution 600 > test.ppm'

# A few customization aliases 
alias :q=exit
alias o=xdg-open
alias www=chromium %U
# alias ls='ls --color'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias lF='ls -F'
alias laF='ls -laF'
alias llF='ls -lF'
alias llaF='ls -alF'
alias j="z" #fasd alias for file jumping 
alias less='most'
alias get-groups='cut -d: -f1 /etc/group'

# for custom programs/installations
# All programs should be placed in /opt/
export PATH=$HOME/.config/bin:/usr/local/bin:$PATH
export GOPATH=~/go
export GOBIN=~/go/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:/opt/google/go_appengine/
export PATH=/opt/saleae:$PATH
export PATH=/opt/altera/13.1/quartus/bin:$PATH
export PATH=/usr/local/texlive/2013/bin/x86_64-linux/:$PATH
alias saleae=logic
alias quartus='quartus --64bit'
alias 'pypy.test'='/opt/pypy/bin/py.test'
alias 'pypy.install'='sudo /opt/pypy/bin/easy_install'
alias 'screen'='screen -c ~/.config/screenrc'

# for android setup
export LD_LIBRARY_PATH=/opt/google/Android-Sdk/sdk/tools/lib:$LD_LIBRARY_PAT
# android is general tool
alias 'android'='/opt/google/Android-Sdk/sdk/tools/android'
# use emu_android Lolipop_x86_avd_name
emu_android () {/opt/google/Android-Sdk/sdk/tools/emulator-x86 \
        -avd "$@" -gpu on -qemu -m 1024 -enable-kvm}

# add dvd and cd burning aliases
# use these as burn[cd/dvd] /dev/sr0 file1 file2 file3
# burndvd may need export MKISOFS="genisoimage"
burndvd () {growisofs -Z $1 -V "ARCHIVE_2013_07_27" -r -J ${*:2}}
alias burnblu=burndvd
burncd () {genisoimage -V "ARCHIVE_2013_07_27" -J -r ${*:2} | \
wodim -v dev=$1 -waiti -}

export MANPATH="/usr/local/man:$MANPATH"
export MANPATH="/usr/local/texlive/2013/texmf-dist/doc/man"


# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#

# display logo and info
# hypnotoad.sh
fortune

# startx if not started already
# only run if not running headless
# to get graphics run `touch ~/graphics`
graphics_file="~/graphics"
if [ -n graphics_file ]
then
  [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx ~/.config/X11/xinitrc 
fi
## add the following text to enable autologin for prior command
#/etc/systemd/system/getty@tty1.service.d/autologin.conf
#[Service]
#ExecStart=
#ExecStart=-/usr/bin/agetty --autologin username --noclear %I 38400 linux


