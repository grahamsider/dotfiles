#=================#
# ~/.bash_profile #
#=================#

[[ -f $HOME/.bashrc ]] && . $HOME/.bashrc
[[ -f $HOME/.config/polybar/pbar-applet-rc.sh ]] && . $HOME/.config/polybar/pbar-applet-rc.sh

export QT_SELECT=5
export QT_QPA_PLATFORMTHEME="qt5ct"

# Custom ranger rc.conf
export RANGER_LOAD_DEFAULT_RC=false

export BROWSER=/usr/bin/qutebrowser
export TERM=st-256color

# Define Qsys variables (Quartus Platform Designer)
export QSYS_ROOTDIR="/home/gs/.cache/yay/quartus-free/pkg/quartus-free/opt/altera/18.1/quartus/sopc_builder/bin"
export QSYS_FONTSIZE=20
export QUARTUS_64BIT=1

export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_SCALE_FACTOR=0

export XDG_MUSIC_DIR="$HOME/Music"

export PATH=$PATH:/home/gs/.local/bin
export PATH=$PATH:/opt/altera/18.1/quartus/bin
export PATH=$PATH:/opt/altera/18.1/modelsim_ase/bin

export WINEDEBUG=-all
