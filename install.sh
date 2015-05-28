set -xe

cp .bashrc ~/.bashrc
cp -r .bashrc.d ~/.bashrc.d
cp .gitconfig ~/.gitconfig

#---- I3 ----
sudo echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get -y --allow-unauthenticated install sur5r-keyring
sudo apt-get update
sudo apt-get -y install i3

echo "---------------------------- >creating i3 dir"
cp -r .i3/ ~/.i3

# ---- VIM ----
./build-vim.sh

# Vim config
cp .vimrc ~/.vimrc
cp -r .vim/* ~/.vim

# install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# ---- URXVT ----
cp .Xresources ~/
xrdb .Xresources

sudo apt-get -y install xdotool tree curl xclip rxvt-unicode
sudo cp urxvtclip /usr/lib/urxvt/perl/clipboard

# Finding files automated
sudo cp file-edit.sh /usr/local/bin

# FZF finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
