#export BASH_SILENCE_DEPRECATION_WARNING=1
#To update your account to use zsh, please run
#chsh -s /bin/zsh

# Text
export TT='/Users/serrano/Documents/TRUNK/text_templates'

# TODO.TXT
source $HOME/.bash_completion.d/todo_completion
complete -F _todo gt

# History
# append history entries..
shopt -s histappend
# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# X11
export DISPLAY=127.0.0.1:0.0

# Golang
export GOPATH=$HOME/go

# PATH
export PATH=$GOPATH/bin:/usr/local/bin:/usr/local/sbin:$HOME/bin:/opt/local/bin:/opt/local/sbin:$TEXT_TEMPLATES:/usr/local/mysql/bin:/usr/local/lib/node_modules/npm/bin:$PATH

# Node.js
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_162.jdk/Contents/Home"
export PATH=$JAVA_HOME/bin:$PATH

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# VIM
export EDITOR='vim'
vp() {
  vim "+TlistAddFilesRecursive . [^_]*py\|*html\|*css"
}
vj() {
  vim "+TlistAddFilesRecursive . [^_]*java"
}

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

## Development Environments ##
source $HOME/.bashrc.git
source $HOME/.bashrc.python
source $HOME/.bashrc.ruby
source $HOME/.bashrc.aws
source $HOME/.bashrc.gcp
source $HOME/.bashrc.tkd

## Vault and consul
complete -C /Users/serrano/bin/vault vault
complete -C /Users/serrano/bin/consul consul

# ASDF versioning tool - https://github.com/asdf-vm/asdf
source /usr/local/opt/asdf/asdf.sh

# Ranger
export RANGER_LOAD_DEFAULT_RC="FALSE"

# Autocomplete
source /usr/local/etc/bash_completion.d/*

# Heroku auto-complete
# heroku autocomplete:script bash
HEROKU_AC_BASH_SETUP_PATH=$HOME/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

qotd

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
