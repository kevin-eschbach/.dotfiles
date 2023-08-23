#!/bin/bash

log_file=~/.dotfiles/install_progress.txt

sudo apt-get -y install zsh
if type -p zsh > /dev/null; then
	echo "zsh Installed"  >> $log_file
else
	echo "zsh failed to install!" >> $log_file
fi

sudo apt-get -y install nvim
if type -p nvim > /dev/null; then
	echo "NeoVim Installed" >> $log_file
else
	echo "NeoVim failed to install!" >> $log_file
fi

sudo apt-get -y install curl
if type -p curl > /dev/null; then
	echo "curl Installed" >> $log_file
else
	echo "curl failed to install!" >> $log_file
fi

sudo apt-get -y install unzip
if type -p unzip > /dev/null; then
	echo "unzip installed" >> $log_file
else
	echo "unzipf failed to install" >> $log_file
fi

sudo apt-get -y install ripgrep
if type -p ripgrep > /dev/null; then
	echo "ripgrep installed" >> $log_file
else
	echo "ripgrep failed to install" >> $log_file
fi

sudo apt-get -y install build-essential
if type -p build-essential > /dev/null; then
	echo "build-essential installed" >> $log_file
else
	echo "build-essential failed to install" >> $log_file
fi

curl -fsSl https://fnm.vercel.app/install | bash
