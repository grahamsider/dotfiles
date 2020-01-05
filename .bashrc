###############
## ~/.bashrc ##
###############

## Aliases ##

# Commandline editing
alias sv="set -o vi"
alias se="set -o emacs" # Default

# Nvim - (Use \vim for regular Vim)
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias gtags="ctags -R -f ./.git/tags ."

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
alias vis="python3 $HOME/Projects/ascii-vis/vis.py"
alias ableton="cd $HOME/.wine/drive_c/ProgramData/Ableton/Live\ 10\ Suite/Program/ && sg no-internet \"wine ./Ableton\ Live\ 10\ Suite.exe\" & disown"
eval $(thefuck --alias)

alias tetris="vitetris"
alias ncmp="ncmpcpp"

alias cat="bat" # Use \cat for regular cat
alias ls="ls --color=auto -h" # Use \ls for regular ls
alias ll="ls --color=auto -hal"

alias psg="ps -ef | grep"
alias walr="cat $HOME/.cache/wal/sequences &"
alias localip="hostname -i"
alias scs="systemctl status"

alias calnext="notify-send -u normal -t 10000 -a calcurse \"[Calcurse]\" \"$(calcurse --next)\""
alias calall="notify-send -u normal -t 10000 -a calcurse \"[Calcurse] Appointments:\"  \"$(calcurse -a)\""
alias clk="tty-clock -c -C $1"

alias mpvq4k='mpv --ytdl-format="bestvideo[ext=mp4][height<=?2160]+bestaudio[ext=m4a] $1"'
alias mpvq3k='mpv --ytdl-format="bestvideo[ext=mp4][height<=?2000]+bestaudio[ext=m4a] $1"'
alias mpvq2k='mpv --ytdl-format="bestvideo[ext=mp4][height<=?1440]+bestaudio[ext=m4a] $1"'
alias mpvq1080='mpv --ytdl-format="bestvideo[ext=mp4][height<=?1080]+bestaudio[ext=m4a] $1"'
alias mpvq720='mpv --ytdl-format="bestvideo[ext=mp4][height<=?720]+bestaudio[ext=m4a] $1"'
alias mpvq480='mpv --ytdl-format="bestvideo[ext=mp4][height<=?480]+bestaudio[ext=m4a] $1"'

## Environment Variables ##

# Go
GOPATH=$HOME/.config/go
PATH=$PATH:$GOPATH/bin # Add GOPATH/bin to PATH for scripting
export GOPATH

# Add local binaries to path
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$HOME/.local/csbin

# Set default editor (Nvim)
EDITOR='nvim'

## Other ##

# Import colorscheme from wal asynchronously
# (\cat $HOME/.cache/wal/sequences &)

# PROMPT
export PS1='\[\e]0;\w\a\]\[\e[92m\]\u@\h: \[\e[33m\]\w\[\e[0m\]\n\[\e[94m\]➜ \[\e[0m\]'

# SSH
alias sshpi='ssh pi@192.168.0.25'
