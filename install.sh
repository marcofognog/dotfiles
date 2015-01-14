cp .bashrc ~/.bashrc

# Vim config
cp .vimrc ~/.vimrc
cp -r .vim/* ~/.vim

# urxvt config
cp .Xresources ~/
xrdb .Xresources

# Install recent I3wm
echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get --allow-unauthenticated install sur5r-keyring
sudo apt-get update
sudo apt-get install i3

# I3 config
cp -r .i3/* ~/.i3

sudo apt-get install xdotool treE curl xclip rxvt-unicode
sudo cp urxvtclip /usr/lib/urxvt/perl/clipboard

# Finding files automated
sudo cp file-edit.sh /usr/local/bin

