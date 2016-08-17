setopt DVORAK

# good feature set for term
export TERM=xterm
# using ~ doesn't seem to work right, may need to update as necessary
export HOME=/home/bertabus
# Source this file if this flag not set.
export PROFILE_FLAG="SET"

export PRINTER=HP_LaserJet_CP1525nw
# export TERM=xterm-256color #important for ssh compatibility
export EDITOR=atom
# export HISTFILE=$XDG_CONFIG_HOME/.zsh_history
export BROWSER=/usr/bin/google-chrome-stable
export wiki_browser=$BROWSER

# Set vimrc's location and source it on vim startup
# export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
# export XDG_CONFIG_HOME=~/.config
export LC_ALL=""
export LC_COLLATE=C
export LANG=en_US.UTF-8

export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=/opt/saleae:$PATH
export PATH=$PATH:/opt/google-appengine-go
export PATH=$PATH:$HOME/.dotfiles/bin


###ssh agent start, automates the ssh keychain loading
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
###ssh agent end

ssh-add $HOME/.ssh/github
ssh-add $HOME/.ssh/id_rsa
