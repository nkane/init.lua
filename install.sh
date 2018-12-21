#!/bin/bash

export basedir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d  ~/.vim/bundle/Vundle.vim ]; then
    echo 'Installing vim vundle'
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo 'Copying .bashrc'
cp $basedir/bash/.bashrc ~

echo 'Copying .tmux.conf'
cp $basedir/tmux/.tmux.conf ~

echo 'Copying .vimrc'
cp $basedir/vim/.vimrc ~

echo 'Copying .gitconfig'
cp $basedir/git/.gitconfig ~
