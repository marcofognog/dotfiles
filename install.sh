cp .bashrc ~/.bashrc

# Vim config
cp .vimrc ~/.vimrc
cp -r .vim/* ~/.vim

# urxvt config
cp .Xresources ~/
xrdb .Xresources

# I3 config
cp -r .i3/* ~/.i3

sudo apt-get install xdotool i3 curl xclip rxvt-unicode git
sudo cp urxvtclip /usr/lib/urxvt/perl/clipboard

# Finding files automated
sudo cp file-edit.sh /usr/local/bin

