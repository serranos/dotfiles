# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload bashcompinit && bashcompinit

# Add custom aliases
source ~/.bashrc.local
source ~/.bashrc_aliases
source ~/.bashrc.aws
source ~/.bashrc.python
source ~/.bashrc.gcp
#source ~/.bashrc.ruby
source ~/.bashrc.git

# Add proper color palette for gruvbox color scheme in vim
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# Text
export TT='/Users/serrano/Documents/TRUNK/text_templates'

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

# ASDF versioning tool - https://github.com/asdf-vm/asdf
#source /usr/local/opt/asdf/asdf.sh

# Ranger
export RANGER_LOAD_DEFAULT_RC="FALSE"

# History
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTCONTROL="ignoredups"
alias  h='history -i 1'

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/serrano/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/apps/z/z.sh
fpath+=${ZDOTDIR:-~}/.zsh_functions

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
