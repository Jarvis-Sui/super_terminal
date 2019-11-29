set -e

# config vim
PWD=$( pwd )
git clone --recurse-submodules -j16 https://github.com/Jarvis-Sui/super_vim.git
ln -s $PWD/super_vim ~/.super_vim
sh super_vim/install.sh
cd super_vim/plugins/YouCompleteMe
./install.py --go-completer --ts-completer
cd $PWD

# config zsh
ln -sf ~/super_terminal/zshrc ~/.zshrc
brew install zsh
chsh -s $( which zsh )

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
OMZ_P=~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${OMZ_P}/zsh-autosuggestions
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

install powerfonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh

cd $PWD

# install z
git clone https://github.com/rupa/z.git

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# install tmux
if [[ "$OSTYPE" == "darwin"* ]]; then
    source mac.sh
else
    echo "third party tools not installed"
fi

ln -sf ~/super_terminal/tmux.conf ~/.tmux.conf

set +e
