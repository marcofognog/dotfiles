cp .bashrc ~/.bashrc
cp -r .bashrc.d ~/.bashrc.d
cp .gitconfig ~/.gitconfig

# urxvt config
cp .Xresources ~/
xrdb .Xresources

# Install recent I3wm
echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get -y --allow-unauthenticated install sur5r-keyring
sudo apt-get update
sudo apt-get -y install i3

# I3 config
echo "---------------------------- >creating i3 dir"
mkdir ~/.i3
cp -r .i3/* ~/.i3

# ---- VIM ----
./build-vim

# Vim config
cp .vimrc ~/.vimrc
cp -r .vim/* ~/.vim

sudo apt-get -y install xdotool tree curl xclip rxvt-unicode
sudo cp urxvtclip /usr/lib/urxvt/perl/clipboard

# install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Finding files automated
sudo cp file-edit.sh /usr/local/bin

# FZF finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

source ~/.bashrc
