#!/bin/bash

## Variables
dotfiles_dir=~/.dotfiles-win

## Delte old dotfiles
echo "Deleting old dotfiles..."
rm -rf ~/.bashrc
rm -rf ~/.bash_profile
rm -rf ~/.gitconfig

## Create symlinks
echo "Creating symlinks..."
ln -sf $dotfiles_dir/bash/.bashrc ~/.bashrc
ln -sf $dotfiles_dir/bash/.bash_profile ~/.bash_profile
ln -sf $dotfiles_dir/git/.gitconfig ~/.gitconfig
