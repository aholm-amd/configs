# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/adamholm/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Prompt setup
PROMPT='%F{cyan}%m%f %F{033}%n%f %F{cyan}[%~]%f %(?.%F{046}->%f.%F{red}->%f) '

# Shell colors setup
zstyle ':completion:*:default' list-colors \
  ${(s.:.)LS_COLORS}

# Aliases

# Docker command line completion setup
fpath=(~/.zsh/completion $fpath)
