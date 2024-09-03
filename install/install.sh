#!/bin/bash

## Variables
dotfiles_dir=~/.dotfiles

## Delete existing dotfiles
echo "Deleting existing dotfiles..."
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.bash_profile > /dev/null 2>&1
sudo rm -rf ~/.bash_aliases > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.config/nvim > /dev/null 2>&1
sudo rm -rf ~/.config/i3 > /dev/null 2>&1
sudo rm -rf ~/.config/i3status > /dev/null 2>&1
sudo rm -f ~/.config/compton.conf > /dev/null 2>&1
sudo rm -f ~/.tmux.conf > /dev/null 2>&1
sudo rm -f ~/.config/kitty/kitty.conf > /dev/null 2>&1

## Create symlinks
echo "Creating symlinks..."
ln -sf $dotfiles_dir/.bashrc ~/.bashrc
ln -sf $dotfiles_dir/nvim ~/.config/nvim
ln -sf $dotfiles_dir/git/.gitconfig ~/.gitconfig
ln -sf $dotfiles_dir/i3 ~/.config/i3
ln -sf $dotfiles_dir/i3status ~/.config/i3status
ln -sf $dotfiles_dir/compton/compton.conf ~/.config/compton.conf
ln -sf $dotfiles_dir/tmux/.tmux.conf ~/.tmux.conf
ln -sf $dotfiles_dir/kitty/kitty.conf ~/.config/kitty/kitty.conf
