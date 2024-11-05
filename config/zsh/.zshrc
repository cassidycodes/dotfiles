# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#
# This gives you a new prompt before nvm has initialized.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# profiling
# zmodload zsh/zprof

[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
fpath+=("/usr/local/share/zsh/site-functions")

# tools
# has to go at the top because some plugins depend on brew
plug "wintermi/zsh-brew"
# slows down new prompt p10k makes this async but spits out a message
# plug "zap-zsh/nvm"
eval "$(direnv hook zsh)"
eval "$(rbenv init -)"
export PATH="${HOME}/.rbenv/bin:${PATH}"

# auto-complete and syntax
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-history-substring-search"
plug "zsh-users/zsh-syntax-highlighting"
# help info on tab
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
# plug "Aloxaf/fzf-tab"

# ls
plug "zap-zsh/exa"

# prompt
plug "mafredri/zsh-async"
plug "sindresorhus/pure"
# plug "romkatv/powerlevel10k"

# git
plug "so-fancy/diff-so-fancy"
plug "chivalryq/git-alias"

# functions
fpath=($HOME/.config/zsh/functions $fpath)
autoload -Uz $fpath[1]/*(.:t)

# aliases
source $ZDOTDIR/.zaliases

# Load and initialise completion system
autoload -Uz compinit
compinit

#To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
# [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# profiling
# zprof
