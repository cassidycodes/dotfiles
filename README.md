# dotfiles

Mostly borrowed from https://github.com/mathiasbynens/dotfiles

## Usage

```
git clone git@github.com:cassidycodes/dotfiles.git
cd dotfiles
source bootstrap.sh
```

This copies the dotfiles into your root directory. The `.bash_profile` also loads a file called `.extras`, which is not included in this repo. You'll want to add private configs to the `.extras` file.

```
# Git credentials
GIT_AUTHOR_NAME="Cassidy Kobewka"
GIT_COMMITER_NAME="$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="hello@cassidy.codes"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
GIT_CONFIG_USER_SIGNINGKEY="yourkeyid"

git config --global user.signingkey "$GIT_CONFIG_USER_SIGNINGKEY"
git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

## tmux.conf

https://github.com/tony/tmux-config
