#!/bin/bash

export basedir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo 'Installing vim vundle'

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp $basedir/bash/.bashrc ~
cp $basedir/tmux/.tmux.conf ~
cp $basedir/vim/.vimrc ~

