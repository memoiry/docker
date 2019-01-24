# @Author: xuguodong
# @Date:   2018-06-18 15:08:17
# @Last Modified by:   Guodong Xu
# @Last Modified time: 2018-06-18 16:18:48
# setup tmux
if [ -z "$(command -v proxychains4)" ]; then
    echo "Use ${CHAINS_CMD} without version 4 support."
    if [ -z "$(command -v proxychains)" ]; then
        CHAINS_CMD=""
    else
        CHAINS_CMD="proxychains"
    fi
else
    CHAINS_CMD="proxychains4"
fi

# setup zsh
chsh -s `which zsh`

# Setup git
git config --global user.name "xuguodong"
git config --global user.email "memoiry@outlook.com"
# ssh-keygen -t rsa -C "memoiry@outlook.com"

#CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:
#LD_LIBRARY_PATH=$LD_LIBRARY_PATH:

# setup tmux
echo "Setup tmux"
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# Setup oh-my-zsh 
${CHAINS_CMD} sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# https://github.com/gigi206/tmux-gigix for suggestion for zsh
# https://github.com/zsh-users/zsh-history-substring-search 
# with oh-my-zsh to configure your reliance
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Setup auto jump
git clone https://github.com/wting/autojump
cd autojump
python install.py

# Setup vim
rm ~/.vimrc
rm -rf ~/.vim
git clone https://github.com/madeye/dotfiles
mv dotfiles/vimrc ~/.vimrc
mv dotfiles/vim ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
${CHAINS_CMD} vim +PluginInstall +qall
vi ~/.vimrc

docker pull xuguodong/dev-env:0.1
