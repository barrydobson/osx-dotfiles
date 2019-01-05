typeset -gx -U path
path=( \
  /usr/local/bin(N-/) \
  ~/bin(N-/) \
  ~/.zplug/bin(N-/) \
  "$path[@]" \
)

# NOTE: set fpath before compinit
typeset -gx -U fpath
fpath=( \
  ~/.zsh/Completion(N-/) \
  ~/.zsh/functions(N-/) \
  ~/.zsh/plugins/zsh-completions(N-/) \
  /usr/local/share/zsh/site-functions(N-/) \
  $fpath \
)

# Autoload
autoload -Uz run-help
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz compinit && compinit -u
autoload -Uz is-at-least

# LANGUAGE must be set by en_US
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

# Editor
if (( $+commands[code] )); then
  export EDITOR="$(whence code) --wait"
else
  export EDITOR=vim
fi
export GIT_EDITOR="${EDITOR}"

# Pager
export PAGER=less
export LESS="--RAW-CONTROL-CHARS --long-prompt"
export LESSCHARSET="utf-8"
if (( $+commands[highlight] )); then
  export LESSOPEN="| $(whence highlight) %s --out-format=ansi --quiet"
else
  unset LESSOPEN
fi

# Manpage colors
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;35m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS_TERMCAP_ue=$'\E[0m'

# ls command colors
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

setopt no_global_rcs
export PATH=~/bin:"${PATH}"

export GOPATH="${HOME}/dev/go"
export GOBIN="${GOPATH}/bin"
export PATH="${GOBIN}:${PATH}"

export CORRECT_IGNORE='_*'
export CORRECT_IGNORE_FILE='.*'

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export FZF_DEFAULT_OPTS="--ansi --color=16 --height=40% --reverse"

# History file
export HISTFILE=~/.zsh_history
# History size in memory
export HISTSIZE=10000
# The number of histsize
export SAVEHIST=1000000
# The size of asking history
export LISTMAX=50
# Do not add in root
if [[ ${UID} == 0 ]]; then
  unset HISTFILE
  export SAVEHIST=0
fi

export KUBECONFIG="${HOME}/.kube/config:${HOME}/Downloads/admin.conf"

# export DOTPATH=${0:A:h}
