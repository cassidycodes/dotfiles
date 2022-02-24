#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

function bootstrap() {
  # Homebrew
  # TODO some initialization stuff
  # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Oh My Zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  brew install --cask kitty
  brew install --cask rectangle
  brew install ag
  brew install bat
  brew install exa
  brew install neovim
  brew install rbenv
  brew install tldr

  rbenv init

  # NVim
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  # tmux
  # mkdir -p ~/.tmux/plugins
  # cp -r tpm ~/.tmux/plugins/tpm

  # ZSH
  mkdir -p ~/.zsh
  cd ~/.zsh
  git clone git@github.com:reobin/typewritten.git
  cd

  # MacOS configs
  # Must log out and back in for this to take effect
  defaults write -g KeyRepeat -int 1
  defaults write -g  InitialKeyRepeat -int 10

  ln -sfi dotfiles/.aliases ~/.aliases
  ln -sfi dotfiles/.zshrc ~/.zshrc
  ln -sfi dotfiles/.functions ~/.functions
  ln -sfi dotfiles/.gitconfig ~/.gitconfig
  ln -sfi dotfiles/.gitignore ~/.gitignore
  ln -sfi dotfiles/.path ~/.path
  ln -sfi dotfiles/.tmux.conf ~/.tmux.conf
  ln -sfi dotfiles/.vimrc ~/.vimrc
  mkdir -p ~/.config
  ln -sfi dotfiles/config/nvim/init.vim ~/.config/nvim/init.vim
  ln -sfi dotfiles/config/kitty/kitty.conf ~/.config/kitty/kitty.conf

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
