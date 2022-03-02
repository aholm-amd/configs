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
PROMPT='%m %n %# %~ -> '

# Shell colors setup
zstyle ':completion:*:default' list-colors \
  ${(s.:.)LS_COLORS}
