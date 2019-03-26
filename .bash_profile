#=================#
# ~/.bash_profile #
#=================#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export QT_SELECT=5
export QT_QPA_PLATFORMTHEME="qt5ct"

# Env var below must stay on line 11
export PBAR_APPLET=false

# Custom ranger rc.conf
export RANGER_LOAD_DEFAULT_RC=false

export BROWSER=/usr/bin/qutebrowser
export TERM=st-256color

# Define Qsys variables (Quartus Platform Designer)
export QSYS_ROOTDIR="/home/gs/.cache/yay/quartus-free/pkg/quartus-free/opt/altera/18.1/quartus/sopc_builder/bin"
export QSYS_FONTSIZE=20
QUARTUS_64BIT=1

QT_AUTO_SCREEN_SCALE_FACTOR=1
QT_QPA_PLATFORMTHEME=qt5ct

PATH=$PATH:/home/gs/.local/bin
PATH=$PATH:/opt/altera/18.1/quartus/bin
PATH=$PATH:/opt/altera/18.1/modelsim_ase/bin
