# COMMAND aliases
alias lla='ls -laGF'
alias ll='ls -lGF'
alias g='grep --color=auto'
alias l='less'
alias m='more'
alias h='history'
alias ..='cd ..'
alias ...='cd .. ; cd ..'
alias l.='ls -dG .[a-zA-Z]*'
alias tx='tar xvfz'
alias tc='tar cvfz'
alias tl='tail -f'
alias k9='kill -9'
alias ipc='ipcalc'
alias minic='sudo minicom -c on'
alias whcy='whois -h whois.cymru.com'
alias whri='whois -h ris.ripe.net'
alias whma='whois -h pdns.circl.lu'
alias digr='dig +short -x'
alias vi='vim'
alias pyclean='find . -name "*.pyc" -exec rm {} \;'
alias pycheck='pep8 --ignore=E501 --show-source --show-pep8'
alias mdown='markdown.pl --html4tags'
alias encode='python -c "import urllib, sys; print urllib.quote(sys.argv[1])"'
alias decode='python -c "import urllib, sys; print urllib.unquote(sys.argv[1])"'
#alias wget="curl -L --compressed -C - -O"

# TODO.TXT specific
export GTD_CONTEXTS=/Users/serrano/Documents/\@TRUNK/todo/notes/contexts
export GTD_PROJECTS=/Users/serrano/Documents/\@TRUNK/todo/notes/projects
alias contexts='cat $GTD_CONTEXTS'
alias projects='cat $GTD_PROJECTS'
alias t='todo.sh -d ~/.todo'
alias gtd='cd $HOME/Documents/@TRUNK/todo'
alias gtdn='cd $HOME/Documents/@TRUNK/todo/notes'
source ~/.bash_completion.d/todo_completion
export TEXT_TEMPLATES='$HOME/CloudPT/library/text_templates'

# X11
export DISPLAY=127.0.0.1:0.0

# PATH
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:/opt/local/bin:/opt/local/sbin:$TEXT_TEMPLATES:/usr/local/mysql/bin:/usr/local/lib/node_modules/npm/bin:$PATH

# MySQL
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/usr/local/mysql/lib/"

# Node.js
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

# PostgreSQL
#source /Library/PostgreSQL/8.4/pg_env.sh
export LC_ALL=C

# Development Environments
source $HOME/.config/git.env
source $HOME/.config/python.env

# VIM
export EDITOR='vi'
vd() {
  vim "+cd $1" "+TlistAddFilesRecursive . [^_]*py\|*html\|*css" +TlistOpen
}
vj() {
  vim "+cd $1" "+TlistAddFilesRecursive . [^_]*java" +TlistOpen
}

# Tmux related
alias tmux='tmux -u'

# Markdown
export MDOWN_HDR="<?xml version='1.0' encoding='utf-8'?>
<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.1//EN' 'http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd'>
<html xmlns='http://www.w3.org/1999/xhtml' xml:lang='en'>
<body>"
export MDOWN_FTR="</body></html>"

# Color less - also affects manpages (Arch style)
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# INCLUDE SCRIPTS #

## Development Environments ##
source $HOME/.config/git.env
source $HOME/.config/python.env

## Local ##
source $HOME/.profile.local
