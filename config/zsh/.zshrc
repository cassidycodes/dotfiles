[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
fpath+=("/usr/local/share/zsh/site-functions")

# auto-complete and syntax
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-history-substring-search"
plug "zsh-users/zsh-syntax-highlighting"
# help info on tab
plug "zap-zsh/supercharge"

# ls
plug "zap-zsh/exa"


# prompt
plug "mafredri/zsh-async"
plug "sindresorhus/pure"

# git
plug "so-fancy/diff-so-fancy"
plug "chivalryq/git-alias"

fpath=($HOME/.config/zsh/functions $fpath)
autoload -Uz $fpath[1]/*(.:t)

source $ZDOTDIR/.zaliases

# Load and initialise completion system
autoload -Uz compinit
compinit
