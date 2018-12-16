# ~/.bashrc

# Import colorscheme from wal asynchronously
(cat $HOME/.cache/wal/sequences &)

# Aliases
alias rootst="st -e su root"
alias r="ranger"
alias walr="cat $HOME/.cache/wal/sequences &"
alias localip="hostname -i"
alias scs="systemctl status"
alias kto="sudo python3 $HOME/PenTests/kickthemout/kickthemout.py"

GOPATH=$HOME/.config/go
export GOPATH
PATH=$PATH:$GOPATH/bin # Add GOPATH/bin to PATH for scripting
