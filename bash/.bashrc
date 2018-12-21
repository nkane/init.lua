# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# 256-colors
export TERM=screen-256color

# User specfic aliases and functions
export GOPATH=$HOME/gocode
export GOROOT="/usr/local/go"
export GOBIN="$HOME/bin"

alias ls='ls --color=auto'
alias ll='ls -aFl'

alias psqlconsole='psql -U postgres'
alias psqllog='sudo tail -f /var/log/postgresql-10/postgresql-10.log'
alias psqlstatus='sudo service postgresql-10 status'
alias psqlstart='sudo service postgresql-10 start'
alias psqlstop='sudo service postgresql-10 stop'
alias psqlrs='sudo service postgresql-10 restart'

alias dockerstatus='sudo service docker status'
alias dockerstart='sudo service docker start'
alias dockerstop='sudo service docker stop'
alias dockerrs='sudo service docker restart'

alias gg='go get -f -v -u'

alias services='service --status-all'

alias dep-rm='rm -rfv $GOPATH/pkg/dep/sources'
alias gde='dep ensure -v --vendor-only'

export PS1="\e[92m[\e[35m\u@\h:\e[91m\W\e[92m]\[$(tput sgr0)\]\e[0m\$ "

# User specific aliases and functions

#set path
export PATH=$PATH:$GOROOT/bin:$HOME/.npm-global/bin:$HOME/bin
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

export VISUAL=vim
export EDITOR="$VISUAL"
