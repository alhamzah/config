#!/usr/bin/env bash

git clone --separate-git-dir=$HOME/.myconf https://github.com/alhamzah/config.git $HOME/myconf-tmp
rm -r ~/myconf-tmp/
/usr/bin/git --git-dir=$HOME/.myconf/ status.showUntrackedFiles no
/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME checkout .

vim +PluginInstall +qall

source $HOME/.bashrc
