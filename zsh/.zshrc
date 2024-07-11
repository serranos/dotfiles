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
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload bashcompinit && bashcompinit

# VIM
export EDITOR='nvim'

# ASDF versioning tool - https://github.com/asdf-vm/asdf
#source /usr/local/opt/asdf/asdf.sh

# History
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTCONTROL="ignoredups"
alias  h='history -i 1'

# PATH
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$HOME/.local/bin:/opt/local/bin:/opt/local/sbin:$TEXT_TEMPLATES:/usr/local/mysql/bin:/usr/local/lib/node_modules/npm/bin:$PATH

# Add custom aliases
source ~/.bashrc.local
source ~/.bashrc_aliases

## Add proper color palette for gruvbox color scheme in vim
#source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

source ~/apps/z/z.sh
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Add scoped configurations
source ~/.bashrc.aws
source ~/.bashrc.gcp
source ~/.bashrc.git
source ~/.bashrc.go
source ~/.bashrc.gpg
source ~/.bashrc.java
source ~/.bashrc.node
source ~/.bashrc.python
source ~/.bashrc.text
source ~/.bashrc.todo
source ~/.bashrc.vagrant

# Bitwarden completion
eval "$(bw completion --shell zsh); compdef _bw bw;"

# Commitizen completion
eval "$(register-python-argcomplete cz)"
