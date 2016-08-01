set -xe

./build-vim.sh

rm -rf /tmp/vundle
git clone https://github.com/gmarik/vundle.git /tmp/vundle

rm -rf ~/.vim/bundle/vundle
mkdir -p  ~/vim/bundle
mkdir -p ~/.vim/bundle
mv /tmp/vundle ~/.vim/bundle/vundle
