# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"
export ZSH=$HOME/".oh-my-zsh"
export LC_ALL=en_US.UTF-8

USER=`whoami`
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
# source ${DIR}/powerlevel9k.sh

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /Library/Frameworks/Python.framework/Versions/3.11/bin/virtualenvwrapper.sh

# go
export PATH=/usr/local/go/bin:$PATH

mkcd() {
    mkdir -p "$1"
    cd "$1"
}

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=122'

export PATH="/usr/local/opt/ruby/bin:$PATH"

alias vim=nvim


# export http_proxy=http://127.0.0.1:10794;
# export https_proxy=http://127.0.0.1:10794;

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
