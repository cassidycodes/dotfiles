#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

function bootstrap() {
  ln -sfi dotfiles/.aliases ~/.aliases
  ln -sfi dotfiles/.zshrc ~/.zshrc
  ln -sfi dotfiles/.functions ~/.functions
  ln -sfi dotfiles/.gitconfig ~/.gitconfig
  ln -sfi dotfiles/.gitignore ~/.gitignore
  ln -sfi dotfiles/.path ~/.path
  ln -sfi dotfiles/.tmux.conf ~/.tmux.conf
  mkdir -p ~/.tmux/plugins
  cp -r tpm ~/.tmux/plugins/tpm
  mkdir -p ~/.zsh
  cd ~/.zsh
  git clone git@github.com:reobin/typewritten.git
  cd
  defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
  defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
  source ~/.zshrc;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  bootstrap;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    bootstrap;
  fi;
fi;
unset bootstrap;
