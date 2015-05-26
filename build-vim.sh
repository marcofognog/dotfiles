sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
       libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
       libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
       ruby-dev mercurial

sudo apt-get remove vim vim-runtime gvim
sudo apt-get install -y checkinstall

cd /tmp/
hg clone https://code.google.com/p/vim/
cd vim

--enable-perlinterp \
    --enable-cscope \
    --enable-gui=auto \
    --enable-gtk2-check \
    --enable-gnome-check \
    --with-features=huge \
    --enable-multibyte \
    --with-x \

export VIMRUNTIMEDIR=/usr/share/vim/vim74
make
sudo checkinstall -D -y
mkdir -p /usr/share/vim/vim74/syntax
sudo ln -s /usr/local/share/vim/vim74/syntax/syntax.vim /usr/share/vim/vim74/syntax/syntax.vim

