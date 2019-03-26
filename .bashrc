###############
## ~/.bashrc ##
###############

## Aliases ##

# Nvim - (Use \vim for regular Vim)
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gsb='git show-branch'
alias gco='git checkout'
alias gg='git grep'
alias gk='gitk --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'
alias glola='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all'

# Curl
alias weather="curl http://wttr.in/$1"
alias cheat="curl cht.sh/$1/$2"

# Misc
alias r="ranger"
alias c="qalc"
alias q="qutebrowser"
alias qp="qutebrowser --temp-basedir -s content.private_browsing true" # Private Window
eval $(thefuck --alias)

alias cat="bat" # Use \cat for regular cat

alias psg="ps -ef | grep"
alias walr="cat $HOME/.cache/wal/sequences &"
alias localip="hostname -i"
alias scs="systemctl status"

alias calnext="notify-send -u normal -t 10000 -a calcurse \"[Calcurse]\" \"$(calcurse --next)\""
alias calall="notify-send -u normal -t 10000 -a calcurse \"[Calcurse] Appointments:\"  \"$(calcurse -a)\""
alias clk="tty-clock -c -C $1"

## Environment Variables ##

# Go
GOPATH=$HOME/.config/go
PATH=$PATH:$GOPATH/bin # Add GOPATH/bin to PATH for scripting
export GOPATH

# Add local binaries to path
PATH=$PATH:$HOME/.local/bin

# Set default editor (Nvim)
EDITOR='nvim'

## Other ##

# Import colorscheme from wal asynchronously
(\cat $HOME/.cache/wal/sequences &)
