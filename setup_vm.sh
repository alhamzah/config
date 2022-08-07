#!/usr/bin/env bash

git clone --separate-git-dir=$HOME/.myconf https://github.com/alhamzah/config.git $HOME/myconf-tmp
rm -r ~/myconf-tmp/
/usr/bin/git --git-dir=$HOME/.myconf/ config status.showUntrackedFiles no
/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME checkout .

# Set up Vundle https://github.com/VundleVim/Vundle.vim
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
