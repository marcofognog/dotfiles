set -xe
cp .bashrc ~/.bashrc
mkdir -p ~/.bashrc.d
cp -rf .bashrc.d/* ~/.bashrc.d/
cp -rf .scripts/ ~/.scripts/
cp .gitconfig ~/.gitconfig
rm -rf ~/.i3
mkdir -p ~/.i3
cp -rf .i3/* ~/.i3
