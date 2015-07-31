set -xe
cp .bashrc ~/.bashrc
cp -rf .bashrc.d/* ~/.bashrc.d
cp .gitconfig ~/.gitconfig
cp -rf .i3/* ~/.i3

# Vim config
cp .vimrc ~/.vimrc
cp -rf .vim/* ~/.vim
