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
alias whcy='whois -h whois.cymru.com'
alias whri='whois -h riswhois.ripe.net'
alias whma='whois -h pdns.circl.lu'
alias digr='dig +short -x'
alias vi='vim'
alias pyclean='find . -name "*.pyc" -exec rm {} \;'
alias pycheck='pep8 --ignore=E501 --show-source --show-pep8'
alias encode='python -c "import urllib, sys; print urllib.quote(sys.argv[1])"'
alias decode='python -c "import urllib, sys; print urllib.unquote(sys.argv[1])"'
alias chrome='open -a "Google Chrome"'
alias mail.sapo='open -a "Google Chrome" --args -app="https://mail.sapo.pt"'
alias mh='mdown_html'
alias myip='curl -s whatismyip.akamai.com'
alias bubu='brew update && brew upgrade'

# PKI
function jksprint { keytool -v -list -keystore $1; }
function pemprint { openssl x509 -in $1 -noout -issuer -subject -dates -fingerprint -serial; }
function pemprintfull { openssl x509 -in $1 -text -noout; }
function pemget { echo | openssl s_client -showcerts -connect $1; }
function pemgetprint { echo | openssl s_client -showcerts -connect $1 | openssl x509 -in /dev/stdin -text -noout; }
function pemgetsplit { echo | openssl s_client -showcerts -connect $1 2> /dev/null | awk -v c=-1 '/-----BEGIN CERTIFICATE-----/{inc=1;c++} inc {print > ("level" c ".crt")} /---END CERTIFICATE-----/{inc=0}'; }
function pemcachain { openssl verify -CAfile $1 $2; }
function pemmodpriv { openssl rsa -noout -modulus -in $1 | md5; }
function pemmodpub { openssl x509 -noout -modulus -in $1 | md5; }
function pemmodreq { openssl req -noout -modulus -in $1 | md5; }
function crlpemprint { openssl crl -inform PEM -in $1 -text -noout; }
function crlderprint { openssl crl -inform DER -in $1 -text -noout; }
function pemkeyremove { openssl rsa -in $1 -out $2; }
function p12topem { openssl pkcs12 -in $1 -out $2 -clcerts; }
function pemtop12 { openssl pkcs12 -export -inkey $1 -in $1 -out $2 ; }
function pemserver { echo '0:4433' ; openssl s_server -cert $1 -key $2 -www; }

# Calendar
alias cday='cal | grep -A7 -B7 --color=auto $(date +%d)'
alias cdayw='ncal -w | grep -A7 -B7 --color=auto $(date +%d)'

# Tmux
alias tmux='tmux -u'
alias ta='tmux attach-session -t'
alias tns='tmux new-session -s'
alias tls='tmux ls'

# TODO.TXT
alias gt='todo.sh'
alias gta='gt -t add'
alias gtaa='gt -t adda'
alias gtdp='gt dp'
alias gtpv='gt projectview'
alias gtb='gt birdseye'
alias gtl='gt lately'
alias gtls='gt ls'
alias gtlsp='gt lsp'
alias gtd='gt do'
alias gogt='cd $HOME/Documents/TRUNK/todo'
alias gogtn='cd $HOME/Documents/TRUNK/todo/notes'
source $HOME/.bash_completion.d/todo_completion
export TEXT_TEMPLATES='$HOME/CloudPT/library/text_templates'
alias gott='cd ~/Documents/text_templates'
alias gottw='cd ~/Documents/text_templates/work'

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

### Vagrant ###
alias vup='vagrant up'
alias vh='vagrant halt'
alias vs='vagrant suspend'
alias vr='vagrant resume'
alias vrld='vagrant reload'
alias vssh='vagrant ssh'
alias vstat='vagrant status'
alias vgstat='vagrant version && vagrant global-status'
alias vgstatu='vagrant version && vagrant global-status --prune'

## Local ##
source $HOME/.bashrc.local

## Development Environments ##
source $HOME/.bashrc.git
source $HOME/.bashrc.python
source $HOME/.bashrc.ruby
source $HOME/.bashrc.aws
source $HOME/.bashrc.tkd

## Vault and consul
complete -C /Users/serrano/bin/vault vault
complete -C /Users/serrano/bin/consul consul

# ASDF versioning tool - https://github.com/asdf-vm/asdf
source /usr/local/opt/asdf/asdf.sh

# Ranger
export RANGER_LOAD_DEFAULT_RC="FALSE"

qotd
