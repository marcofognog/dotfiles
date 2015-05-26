sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
       libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
       libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
       ruby-dev mercurial

sudo apt-get remove vim vim-runtime gvim
sudo apt-get install -y checkinstall

cd /tmp/
hg clone https://code.google.com/p/vim/
cd vim

./configure --enable-perlinterp \
    --enable-cscope \
    --enable-gui=auto \
    --enable-gtk2-check \
    --enable-gnome-check \
    --with-features=huge \
    --enable-multibyte \
    --with-x \

export VIMRUNTIME=/usr/local/share/vim/vim74/
sudo checkinstall -D -y

sudo rm -rf /tmp/vim
