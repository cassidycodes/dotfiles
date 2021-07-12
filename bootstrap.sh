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

  # Homebrew
  # TODO some initialization stuff
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Oh My Zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  brew install exa
  brew install bat
  brew install ag
  brew install rg
  brew install tmux
  brew install vim
  brew install rbenv
  sudo easy_install nodeenv
  brew install tmux-mem-cpu-load
  brew install --cask rectangle
  brew install tldr

  rbenv init
  nodeenv init

  # Vim
  git clone git@github.com:amix/vimrc.git ~/.vim_runtime
  sh ~/.vim_runtime/install_awesome_vimrc.sh
  mkdir -p ~/.vim/pack/themes/start
  git clone git@github.com:dracula/vim.git ~-/vim/pack/themes/start/dracula
  ln -sfi dotfiles/my_configs.vim ~/.vim_runtime/my_configs.vim

  # tmux
  mkdir -p ~/.tmux/plugins
  cp -r tpm ~/.tmux/plugins/tpm
  mkdir -p ~/.zsh
  cd ~/.zsh
  git clone git@github.com:reobin/typewritten.git
  cd

  # MacOS configs
  # Must log out and back in for this to take effect
  defaults write -g KeyRepeat -int 1
  defaults write -g  InitialKeyRepeat -int 10

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
