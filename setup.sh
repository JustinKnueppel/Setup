#!/usr/bin/bash

# Get directory and cd to home
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ~

# Fix file structure
rm -rf Videos/ Templates/ Music/ Public/
mkdir Coding

# Update system and correct clock
sudo pacman -Syu
timedatectl set-local-rtc 1 --adjust-system-clock

# Install packages
sudo pacman -S gvim yay git xclip redshift pip3 base-devel
echo "Enter your email"
read email
git config --global user.email "\"${email}\""
echo "Enter your name"
read name
git config --global user.name "\"${name}\""

# Dotfiles
git clone https://github.com/JustinKnueppel/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git remote set-url origin git@github.com:JustinKnueppel/dotfiles.git 
./.dotfiles/init.sh
cd ~

# SSH
ssh-keygen -o -a 100 -t ed25519

# Vim
yay -S vundle
vim -c VundleUpdate -c quitall

# Python environment
pip3 install --upgrade --user pip
mkdir ~/Backups
pip3 freeze > ~/Backups/requirements.txt
pip3 install --user virtualenv
python3 -m virtualenv env
source ~/env/bin/activate
pip install -r "${DIR}/requirements.txt"
deactivate

# Node
yay -S nvm
source /usr/share/nvm/init-nvm.sh
nvm install `nvm ls-remote | tail -n 1`
npm i -g eslint typescript

# VS Code
yay -S code

# Redshift
mkdir -p ~/.config/redshift
cat "${DIR}/redshift.conf" > ~/.config/redshift/redshift.conf

echo "TODO"
echo "Autostart redshift"
echo "Add public SSH key to Github"
echo "Install VS Code extensions/themes"

source ~/.bashrc
