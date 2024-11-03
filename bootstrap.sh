#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

function bootstrap() {
  # Homebrew
  # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  brew install --cask kitty
  brew install --cask rectangle
  brew install --cask zed
  brew install bat
  brew install eza
  brew install neovim
  brew install rbenv
  brew install rg
  brew install tldr
  brew install zoxide

  rbenv init

  # NVim
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  # LazyVim
  git clone https://github.com/LazyVim/starter ~/.config/nvim

  # MacOS configs
  # Must log out and back in for this to take effect
  defaults write -g KeyRepeat -int 1
  defaults write -g InitialKeyRepeat -int 10

  ln -sfi dotfiles/.gitconfig $HOME/.config/git/.gitconfig
  ln -sfi dotfiles/.gitignore $HOME/.config/git/.gitignore

  # zap zsh plugin manager
  zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep

  mkdir -p ~/.config
  # TODO
  # ln -sfn dotfiles/config/nvim/init.vim $HOME/.config/nvim/init.vim
  # ln -sfn dotfiles/config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
  # ln -sfn dotfiles/config/zsh/.zailiases $HOME/.config/zsh/.zaliases
  # ln -sfn dotfiles/config/zsh/.zshrc $HOME/.config/zsh/.zshrc
  # ln -sfn dotfiles/config/zsh/functions $HOME/.config/zsh/functions
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  bootstrap
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    bootstrap
  fi
fi
unset bootstrap
