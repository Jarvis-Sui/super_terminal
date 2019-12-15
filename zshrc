export TERM="xterm-256color"
export ZSH=$HOME/".oh-my-zsh"
export LC_ALL=en_US.UTF-8

DIR=~/super_terminal

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    tmux
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

[ -f ${DIR}/z/z.sh ] && source ${DIR}/z/z.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# POWERLEVEL9K configure
source ${DIR}/powerlevel9k.sh
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# virtualenvwrapper
export VIRTUALENVWRAPPER_VIRTUALENV=/Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenv
source /Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh

mkcd() {
    mkdir "$1"
    cd "$1"
}

