set -xe

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list

sudo apt-get update --allow-unauthenticated --allow-insecure-repositories
sudo apt-get -y --allow-unauthenticated install sur5r-keyring
sudo apt-get -y install build-essential texinfo libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev
sudo apt-get -y	install libtiff-dev libgtk2.0-dev libncurses-dev --allow-unauthenticated
sudo apt-get -y install i3 dmenu i3lock jq vim flameshot fzf --allow-unauthenticated
sudo apt-get -y emacs # postfix instalation requires manual clicking on terminal
