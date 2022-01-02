#!/bin/zsh

export basedir=${0:a:h}
echo "base directory: ${basedir} ..."
# check that shell is set to zsh
[[ $(echo $SHELL) == "/bin/zsh" ]] || { echo >&2 "must be running zsh - running ${SHELL}"; exit 1; } 
echo "shell is zsh ..."
echo "installing oh-my-zsh ..."
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# install brew
echo "beginning macos development Install ..."
echo "installing brew ..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "brew updating ..."
brew update
echo "brew upgrading ..."
brew upgrade
echo "brew installing wget, which, locate, vim, clang, curl, pgrep, and git ..."
brew install wget which locate vim clang curl pgrep git
# install vundle
if [ ! -d  ~/.vim/bundle/Vundle.vim ]; then
	echo 'installing vim vundle ...'
    	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
export VERSION=1.17.5
export DISTRO=darwin-amd64
export INSTALL_PATH=/usr/local
if command -v go >/dev/null 2>&1; then
 	echo 'golang installed ...'
 	echo "golang version:$(go version) ..."
else
   	echo 'installing golang ...'
    	golang/install_golang.sh
fi
# install nvm 
export NVM_VERSION=v0.39.1
echo "installing nvm version ${NVM_VERSION} ..."
js/install_nvm.sh

echo 'copying .zshrc ...'
cp $basedir/zshrc/.zshrc ~

echo 'copying .vimrc ...'
cp $basedir/vim/.vimrc ~

echo 'copying .gitconfig ...'
cp $basedir/git/.gitconfig ~

echo 'downloading docker ...'
docker/install_docker.sh