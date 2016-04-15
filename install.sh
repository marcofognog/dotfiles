set -xe

sudo add-apt-repository ppa:shutter/ppa

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
sudo echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get -y --allow-unauthenticated install sur5r-keyring
sudo apt-get update
sudo apt-get -y install i3 shutter google-chrome-stable

# ---- VIM ----
./build-vim.sh

rm -rf /tmp/vundle
git clone https://github.com/gmarik/vundle.git /tmp/vundle

rm -rf ~/.vim/bundle/vundle
mkdir -p ~/.vim/bundle/vundle

mv /tmp/vundle/ ~/.vim/bundle/

# ---- URXVT ----

cp .Xresources ~/
xrdb .Xresources

sudo apt-get -y install xdotool tree curl xclip rxvt-unicode
sudo cp urxvtclip /usr/lib/urxvt/perl/clipboard

# Finding files automated
sudo cp file-edit.sh /usr/local/bin

# FZF finder
git clone --depth 1 https://github.com/junegunn/fzf.git /tmp/.fzf

if [ -d ~/.fzf ]
then
  rm -rf ~/.fzf
fi
mv /tmp/.fzf ~/.fzf

~/.fzf/install

./copy-dots.sh

