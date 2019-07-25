#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

function doIt() {
  ln -sfi dotfiles/.aliases ~/.aliases
  ln -sfi dotfiles/.bash_profile ~/.bash_profile
  ln -sfi dotfiles/.bashrc ~/.bashrc
  ln -sfi dotfiles/.functions ~/.functions
  ln -sfi dotfiles/.gitconfig ~/.gitconfig
  ln -sfi dotfiles/.gitignore ~/.gitignore
  ln -sfi dotfiles/.path ~/.path
  ln -sfi dotfiles/.tmux.conf ~/.tmux.conf
  mkdir -p ~/.tmux/plugins
  cp -r tpm ~/.tmux/plugins/tpm
  source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;
