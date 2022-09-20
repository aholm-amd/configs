# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch
unsetopt BEEP
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/adamholm/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Configure cursor
echo -ne '\e[5 q'

# Prompt setup
if [[ -n $(echo $STY) ]] {
  SCREEN_WINDOW=' ['$WINDOW'] '
} else {
  SCREEN_WINDOW=''
}
PROMPT='%F{cyan}%m%f %F{033}%n%f %F{cyan}[%~]'$SCREEN_WINDOW'%f%(?.%F{046}->%f.%F{red}->%f) '

# Shell colors setup
LS_COLORS='no=00;37:fi=00:di=00;33:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
export LS_COLORS
zstyle ':completion:*:default' list-colors \
  ${(s.:.)LS_COLORS}

# Aliases
if [[ $(uname -n) = "AUS-LX-ADAMHOLM" ]] {
  alias ssh-lab="ssh adamholm@10.216.168.173"
}
#   for python and python related stuff
alias python="python3"
alias da="deactivate"

#   for Docker
alias dkr-cls="docker container ls -a"
alias dkr-ils="docker image ls"
alias dkr-cp="docker container prune -f"
alias dkr-ip="docker image prune -f"

# Docker command line completion setup
fpath=(~/.zsh/completion $fpath)

# Additions to $PATH
path+=(~/.local/bin $path)

# Adding Node binary install to path
VERSION=v16.14.2
DISTRO=linux-x64
path+=(/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin $path)

# GNU Screen setup
if [[ ! -d $HOME/.screen ]] {
  mkdir $HOME/.screen
  chmod 700 $HOME/.screen
}
export SCREENDIR=$HOME/.screen
# On login, reattach to the newest detached Screen session, if there are
# multiple detached sessions. Reattach to the detached session if there is
# only one. Start a Screen session, if none are found.
if [[ -z $STY ]] {
  screen -d -RR
}
