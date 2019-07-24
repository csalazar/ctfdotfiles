ZSH_CACHE_DIR=$HOME/.zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# history
HISTSIZE=1000
SAVEHIST=1000
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

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  golang        # Go section
  docker        # Docker section
  aws           # Amazon Web Services section
  conda         # conda virtualenv section
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  exit_code     # Exit code section
  char          # Prompt character
)

typeset -U path
path=("/usr/local/bin" $path)
path=("/usr/local/sbin" $path)
path=("/usr/bin" $path)
path=("/usr/sbin" $path)
path=("/sbin" $path)
path=("/bin" $path)
path=("$HOME/.fzf/bin" $path)
path=("$HOME/miniconda3/bin" $path)
path=("$HOME/go/bin" $path)
path=("$HOME/.rbenv/bin" $path)
path=("$HOME/.yarn/bin" $path)
path=("$HOME/.local/bin" $path)
path=($^path(N-/))

# antibody setup
if _has antibody; then
  if [[ ! -e "$HOME/.zsh_plugins.sh" ]]; then
    antibody bundle < "$HOME/.antibody_bundle" > "$HOME/.zsh_plugins.sh"
  fi

  source "$HOME/.zsh_plugins.sh"
fi

# autoexecute suggestion with ctrl+space
bindkey '^ ' autosuggest-execute

# set languages directories
export GOPATH=$HOME/go
export NVM_DIR="$HOME/.nvm"

# init ruby environment if available
if _has rbenv; then
  eval "$(rbenv init -)"
fi

files_to_source=(
  $NVM_DIR/nvm.sh
  $HOME/.fzf.zsh
  $HOME/.aliases
  $HOME/miniconda3/etc/profile.d/conda.sh
)

for file in $files_to_source; do
  [ -f $file ] && source $file
done

# exa setup
if _has exa; then
  alias ls="exa"
fi

# vte setup
if [[ $TILIX_ID ]]; then
  source /etc/profile.d/vte-2.91.sh
fi

# some aliases
ca() {
  conda activate $1
  export PYTHONPATH=`python -c "import sys; print(':'.join(p for p in sys.path if p))"`
}
