#!/bin/bash

## Variables
dotfiles_dir=~/.dotfiles

## Delete existing dotfiles
echo "Deleting existing dotfiles..."
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.bash_profile > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.config/nvim > /dev/null 2>&1

## Create symlinks
echo "Creating symlinks..."
ln -sf $dotfiles_dir/bashrc ~/.bashrc
ln -sf $dotfiles_dir/nvim ~/.config/nvim
