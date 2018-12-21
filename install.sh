#!/bin/bash

export basedir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# install vundle
if [ ! -d  ~/.vim/bundle/Vundle.vim ]; then
    echo 'Installing vim vundle'
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# install node
if command -v node >/dev/null 2>&1; then
    echo 'Node installed'
    echo "Node version:$(node -v)"
else
    echo 'Installing nodejs'
    js/install_node.sh
fi

echo 'Copying .bashrc'
cp $basedir/bash/.bashrc ~

echo 'Copying .tmux.conf'
cp $basedir/tmux/.tmux.conf ~

echo 'Copying .vimrc'
cp $basedir/vim/.vimrc ~

echo 'Copying .gitconfig'
cp $basedir/git/.gitconfig ~
