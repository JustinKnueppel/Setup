#!/usr/bin/bash

# Get directory and cd to home
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ~

# Fix file structure
rm -rf Videos/ Templates/ Music/ Public/

# Update system and correct clock
sudo pacman -Syu
timedatectl set-local-rtc 1 --adjust-system-clock

# Git
sudo pacman -S gvim yay git
echo "Enter your email"
read email
git config --global user.email "\"${email}\""
echo "Enter your name"
read name
git config --global user.name "\"${name}\""

# Vim
yay -S vundle
git clone https://github.com/JustinKnueppel/Vim-RC.git
mv Vim-RC/.vimrc ~/.vimrc
rm -rf Vim-RC
vim -c VundleUpdate -c quitall

echo "export VISUAL=vim" >> ~/.bashrc
echo "export EDITOR=\$VISUAL" >> ~/.bashrc

# Git utilities
mkdir Coding
git clone https://github.com/JustinKnueppel/Git-Utilities.git ~/Coding/Git-Utilities
cd ~/Coding/Git-Utilities
git remote set-url origin git@github.com:JustinKnueppel/Git-Utilities.git 
cd ~

echo "alias ug=~/Coding/Git-Utilities/UpdateGitRepos.sh" >> ~/.bashrc
echo "alias ugl=~/Coding/Git-Utilities/UpdateGitList.sh" >> ~/.bashrc
~/Coding/Git-Utilities/UpdateGitList.sh

# Python environment
pip install --upgrade --user pip
mkdir ~/Backups
pip freeze > ~/Backups/baserequirements.txt
pip install --user virtualenv
mkdir venv
cd venv
python -m virtualenv general
cd
echo "alias general='source ~/venv/general/bin/activate'" >> ~/.bashrc
activate ~/venv/general/bin/activate
pip install -r "${DIR}/requirements.txt"
deactivate

# Node
yay -S nvm
nvm install-latest-npm
source /usr/share/nvm/init-nvm.sh
npm i -g eslint typescript

# VS Code
yay -S code

# SSH
ssh-keygen -o -a 100 -t ed25519

# Redshift
sudo pacman -S redshift
mkdir ~/.config/redshift
cat "${DIR}/redshift.conf" > ~/.config/redshift/redshift.conf
echo "Please autostart redshift"

source ~/.bashrc

