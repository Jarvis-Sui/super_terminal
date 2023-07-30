set -e

# install tmux
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install zsh
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    yum install zsh -y
fi

# config zsh
sudo chsh -s $( which zsh )

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
ln -sf ~/super_terminal/zshrc ~/.zshrc

OMZ_C=~/.oh-my-zsh/custom
git clone https://github.com/zsh-users/zsh-autosuggestions ${OMZ_C}/plugins/zsh-autosuggestions
git clone https://github.com/romkatv/powerlevel10k.git ${OMZ_C}/themes/powerlevel10k
ln -sf ~/super_terminal/p10k.zsh ~/.p10k.zsh

# install powerfonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd $PWD

# install z
git clone https://github.com/rupa/z.git
chmod +x z/z.sh
cp z/z.sh /usr/local/bin
cp z/z.1 /usr/local/share/man/man1

# install fzf
if [ ! -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

# install tmux
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install tmux
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    yum install tmux -y
fi

ln -sf ~/super_terminal/tmux.conf ~/.tmux.conf

# install powerline for tmux
pip install --user powerline-status

# install cpu/mem monitor for tmux
git clone https://github.com/thewtex/tmux-mem-cpu-load.git
cd tmux-mem-cpu-load
cmake .
make
make install
cd $PWD

# install the dependencies
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install ripgrep
    brew install tree-sitter
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    yum install the_silver_searcher -y
fi

# config vim
mkdir -p ~/.config/
git clone git@github.com:Jarvis-Sui/nvim.git ~/.config/nvim

# install plug vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

set +e
