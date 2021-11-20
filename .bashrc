###############
## ~/.bashrc ##
###############

## Aliases ##

# Nvim - (Use \vim for regular Vim)
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# Tmux
alias tmux="TERM=screen-256color tmux -f $HOME/.config/tmux/tmux.conf"
alias tma="tmux attach-session -t"
alias tml="tmux list-sessions"

# CTags/CScope
alias gtags="ctags -R --tag-relative -f ./.git/tags ." # Git Tags
alias dtags="ctags -R --tag-relative -f ./tags ."      # Dir Tags
alias csc="rm -f cscope.* ; cscope -b -q -R"

# Git
alias gs='git status'
alias gsh='git show'
alias ga='git add'
alias gc='git commit'
alias gca='git commit --amend'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gps='git push'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gd='git diff'
alias gb='git branch'
alias gba='git branch --all'
alias gl='git log'
alias gsb='git show-branch'
alias gco='git checkout'
alias gg='git grep'
alias gk='gitk --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias grc='git rebase --continue'
alias gcp='git cherry-pick'
alias grm='git rm'
alias glola='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all'

# Apply git am patches in dir ($1) in order
function gamps() {
	if [ -d "$1" ]; then
		for p in $(find "$1" -name '*.patch' -type f -print0 | \
			sort -z | xargs -0 printf '%s\n'); do
			git am "$p"
		done
	fi
}

# Apps
alias weather="curl http://wttr.in/$1"  # Weather
alias cheat="curl cht.sh/$1/$2"         # Cheat
alias r="ranger"
alias c="qalc"
alias clk="tty-clock -c -C $1"
alias ascii-vis="python3 $HOME/Projects/ascii-vis/vis.py"
alias tetris="vitetris"
alias ncmp="ncmpcpp"
alias calnext="notify-send -u normal -t 10000 -a calcurse \"[Calcurse]\" \"$(calcurse --next)\""
alias calall="notify-send -u normal -t 10000 -a calcurse \"[Calcurse] Appointments:\"  \"$(calcurse -a)\""

# Utils
alias ls="ls --color=auto -h"
alias ll="ls --color=auto -hal"
alias dog="bat"
alias psg="ps -ef | grep"
alias getip="ip addr | grep -Po '^\d+:.*:|inet \K[\d.]+' | sed '$!N;s/\n/ /' | column -t"
alias scs="systemctl status"
alias de="disown && exit"
alias d="disown"

# Wine Shortcuts
alias ableton="cd $HOME/.wine/drive_c/ProgramData/Ableton/Live\ 10\ Suite/Program/ && sg no-internet \"wine ./Ableton\ Live\ 10\ Suite.exe\" & disown"
alias ltspice="wine $HOME/.wine/drive_c/Program\ Files/LTC/LTspiceXVII/XVIIx64.exe"
alias adobe-de="wine $HOME/.wine/drive_c/Program\ Files\ \(x86\)/Adobe/Adobe\ Digital\ Editions/digitaleditions.exe"

# MPV
alias mpvq4k='mpv --ytdl-format="bestvideo[height<=?2160]+bestaudio/best"'
alias mpvq3k='mpv --ytdl-format="bestvideo[height<=?2000]+bestaudio/best"'
alias mpvq2k='mpv --ytdl-format="bestvideo[height<=?1440]+bestaudio/best"'
alias mpvq1080='mpv --ytdl-format="bestvideo[height<=?1080]+bestaudio/best"'
alias mpvq720='mpv --ytdl-format="bestvideo[height<=?720]+bestaudio/best"'
alias mpvq480='mpv --ytdl-format="bestvideo[height<=?480]+bestaudio/best"'

# Pacman
alias pm-update-mirrors='sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup && sudo reflector --country Canada --latest 5 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist'

## Env Vars ##

# Go Paths
export GOPATH="$HOME/.config/go"
PATH="$PATH:$GOPATH/bin"         # Add GOPATH/bin to PATH for scripting

# Add local binaries to path
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.local/csbin"

# Set default editor (nvim)
EDITOR='nvim'

# Set WeeChat config dir
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"

# Prompt
export PS1='\[\e]0;\w\a\]\[\e[92m\]\u@\h: \[\e[33m\]\w\[\e[0m\]\n\[\e[94m\]➜ \[\e[0m\]'

# SSH / Pi / Backup
export GSPI="pi@192.168.0.25"
alias sshpi="ssh $GSPI"
alias pi-backup="rsync -aP --exclude-from=$HOME/.rsyncignore $HOME $GSPI:/mnt/backups/$HOSTNAME$HOME"
