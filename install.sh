set -e

# config vim
PWD=$( pwd )
git clone --recurse-submodules -j16 https://github.com/Jarvis-Sui/super_vim.git
ln -s $PWD/super_vim ~/.super_vim
sh super_vim/install.sh
cd super_vim/plugins/YouCompleteMe
./install.py --go-completer --ts-completer
cd $PWD

# install tmux
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install zsh
    brew install tmux
    brew install the_silver_searcher
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    yum install zsh -y
    yum install tmux -y
    yum install the_silver_searcher -y
fi

# config zsh
chsh -s $( which zsh )

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
ln -sf ~/super_terminal/zshrc ~/.zshrc

OMZ_C=~/.oh-my-zsh/custom/
git clone https://github.com/zsh-users/zsh-autosuggestions ${OMZ_C}/plugins/zsh-autosuggestions
git clone https://github.com/bhilburn/powerlevel9k.git ${OMZ_C}/themes/powerlevel9k

# install powerfonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd $PWD

# install z
git clone https://github.com/rupa/z.git

# install fzf
if [ ! -f ~/.fzf.zsh ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

# config tmux
ln -sf ~/super_terminal/tmux.conf ~/.tmux.conf
set +e