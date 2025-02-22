#!/bin/bash

## Variables
dotfiles_dir=~/.dotfiles

## Delete existing dotfiles
echo "Deleting existing dotfiles..."
sudo rm -rf $HOME/.bashrc > /dev/null 2>&1
sudo rm -rf $HOME/.bash_profile > /dev/null 2>&1
sudo rm -rf $HOME/.bash_aliases > /dev/null 2>&1
sudo rm -rf $HOME/.gitconfig > /dev/null 2>&1
sudo rm -rf $HOME/.config/nvim > /dev/null 2>&1
sudo rm -rf $HOME/.config/i3 > /dev/null 2>&1
sudo rm -rf $HOME/.config/i3status > /dev/null 2>&1
sudo rm -f $HOME/.config/compton.conf > /dev/null 2>&1
sudo rm -f $HOME/.tmux.conf > /dev/null 2>&1
sudo rm -f $HOME/.config/kitty/kitty.conf > /dev/null 2>&1
sudo rm -f $HOME/.inputrc > /dev/null 2>&1

## Create symlinks
echo "Creating symlinks..."
ln -sf $dotfiles_dir/.bashrc $HOME/.bashrc
ln -sf $dotfiles_dir/nvim $HOME/.config/nvim
ln -sf $dotfiles_dir/git/.gitconfig $HOME/.gitconfig
ln -sf $dotfiles_dir/i3 $HOME/.config/i3
ln -sf $dotfiles_dir/i3status $HOME/.config/i3status
ln -sf $dotfiles_dir/compton/compton.conf $HOME/.config/compton.conf
ln -sf $dotfiles_dir/tmux/.tmux.conf $HOME/.tmux.conf
ln -sf $dotfiles_dir/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
ln -sf $dotfiles_dir/inputrc $HOME/.inputrc
