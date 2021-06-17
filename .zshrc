ZSH_CACHE_DIR=$HOME/.zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt histignorealldups sharehistory

# navigation
setopt auto_cd
setopt correct_all

# completion
autoload -Uz compinit
compinit

setopt auto_list
setopt auto_menu
setopt always_to_end
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:::::' completer _expand _complete _ignored _approximate

PS1="%B%n@%m %1~ %#%b "

_has() {
  which $1>/dev/null 2>&1
}

# fasd setup
if _has fasd; then
  fasd_cache="$ZSH_CACHE_DIR/fasd-init-cache"
  if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
      fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install >| "$fasd_cache"
  fi
  source "$fasd_cache"
  unset fasd_cache
fi


typeset -U path
path=("/usr/local/bin" $path)
path=("/usr/local/sbin" $path)
path=("/usr/bin" $path)
path=("/usr/sbin" $path)
path=("/sbin" $path)
path=("/bin" $path)
path=("/snap/bin" $path)
path=("$HOME/.local/bin" $path)
path=("$HOME/.fzf/bin" $path)
path=("$HOME/miniconda3/bin" $path)
path=($^path(N-/))

# important variables
alias vim=nvim
export EDITOR="nvim"

files_to_source=(
  $HOME/.antigen.zsh
  $HOME/.fzf.zsh
  $HOME/.zsh_functions
  $HOME/.zshrc_local
  $HOME/miniconda3/etc/profile.d/conda.sh
)

for file in $files_to_source; do
  [ -f $file ] && source $file
done

# antigensetup
if _has antigen; then
  antigen use oh-my-zsh
  antigen bundle common-aliases
  antigen bundle git-prompt

  antigen bundle zdharma/fast-syntax-highlighting
  antigen bundle zsh-users/zsh-autosuggestions
  antigen bundle zsh-users/zsh-completions
  antigen bundle zdharma/history-search-multi-word
  antigen apply

  # autoexecute suggestion with ctrl+space
  bindkey '^ ' autosuggest-execute
fi

# utils setup
if _has ag; then
  export FZF_DEFAULT_COMMAND='ag -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
else
  echo "[-] Install the silver searcher package"
fi

if _has exa; then
  alias ls="exa"
else
  alias ls="ls --color=auto"
fi

if _has direnv; then
  eval "$(direnv hook zsh)"
fi

if _has rbenv; then
  export RBENV_VERSION="2.7.2"
  eval "$(rbenv init -)"
fi

if _has bat; then
  export MANPAGER="sh -c 'col -bx |bat -l man -p'"
fi
