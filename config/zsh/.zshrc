# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
fpath+=("/usr/local/share/zsh/site-functions")

# auto-complete and syntax
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-history-substring-search"
plug "zsh-users/zsh-syntax-highlighting"
# help info on tab
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
plug "Aloxaf/fzf-tab"

# ls
plug "zap-zsh/exa"


# prompt
plug "mafredri/zsh-async"
# plug "sindresorhus/pure"
plug "romkatv/powerlevel10k"

# git
plug "chivalryq/git-alias"
plug "so-fancy/diff-so-fancy"
plug "chivalryq/git-alias"

# functions
fpath=($HOME/.config/zsh/functions $fpath)
autoload -Uz $fpath[1]/*(.:t)

source $ZDOTDIR/.zaliases

# Load and initialise completion system
autoload -Uz compinit
compinit

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
