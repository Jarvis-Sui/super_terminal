export TERM="xterm-256color"
export ZSH=$HOME/".oh-my-zsh"
export LC_ALL=en_US.UTF-8

DIR=~/super_terminal

ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

[ -f ${DIR}/z/z.sh ] && source ${DIR}/z/z.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# POWERLEVEL9K configure
source ${DIR}/powerlevel9k.sh

# # virtualenvwrapper
# export VIRTUALENVWRAPPER_VIRTUALENV=/Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenv
# source /Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh

