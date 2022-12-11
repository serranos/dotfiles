#export BASH_SILENCE_DEPRECATION_WARNING=1
#To update your account to use zsh, please run
#chsh -s /bin/zsh

# History
# append history entries..
shopt -s histappend
# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# X11
export DISPLAY=127.0.0.1:0.0

# PATH
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:/opt/local/bin:/opt/local/sbin:$TEXT_TEMPLATES:/usr/local/mysql/bin:$PATH
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# VIM
export EDITOR='vim'

export CLICOLOR=1

# Color less - also affects manpages (Arch style)
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Aliases
source $HOME/.bashrc_aliases

## Local ##
source $HOME/.bashrc.local

## Vault and consul
complete -C /Users/serrano/bin/vault vault
complete -C /Users/serrano/bin/consul consul

# Autocomplete
source /usr/local/etc/bash_completion.d/*

qotd

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add scoped configurations
source ~/.bashrc.java
source ~/.bashrc.gcp
source ~/.bashrc.git
source ~/.bashrc.st
source ~/.bashrc.heroku
source ~/.bashrc.node
source ~/.bashrc.python
source ~/.bashrc.text
source ~/.bashrc.todo
source ~/.bashrc.vagrant
source ~/.bashrc.rust
