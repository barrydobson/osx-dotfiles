umask 022

autoload -Uz run-help

## ZPlug
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

if [[ -f ~/.zplug/init.zsh ]]; then
  source ~/.zplug/init.zsh
fi

zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "~/.zsh", from:local, use:"<->_*.zsh"

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "momo-lab/zsh-abbrev-alias"
zplug "paulirish/git-open"

zplug "mafredri/zsh-async", use:"async.zsh"
zplug "sindresorhus/pure", use:"pure.zsh", as:theme

zplug "plugins/docker", from:oh-my-zsh, if:"(( $+commands[docker] ))"

zplug "mgoodness/02bd0e0543daef8f81a4411c4394ab28", from:gist, use:"docker-rmi.sh"
zplug "mgoodness/600f9c9da8679cca98732dbf8a6c4411", from:gist, use:"find-replace.sh"
zplug "mgoodness/3998eb4aab8ca01a6b5468f76586f48f", from:gist, use:"k8s-api.sh"
zplug "mgoodness/c0b0f887c962ef050d5411efb3befc9a", from:gist, use:"kube-context.sh"
zplug "mgoodness/9e1c90d7b8fe14f04422bd0f44da9aed", from:gist, use:"kube-ssh.sh"
zplug "mgoodness/3f99876a9422525b23725061ba83c517", from:gist, \
  if:"(( $+commands[git] ))", use:"git-rebase-preserve-author.sh"

zplug check || zplug install
zplug load

## Aliases
source ~/.zsh/aliases.zsh

## Keybindings
bindkey -d
bindkey -v

bindkey -M vicmd '^A'  beginning-of-line
bindkey -M vicmd 'gg' beginning-of-line
bindkey -M vicmd '^E'  end-of-line
bindkey -M vicmd 'G'  end-of-line

bindkey -M viins '^A'  beginning-of-line
bindkey -M viins '^E'  end-of-line

autoload -Uz is-at-least
if is-at-least 5.0.8; then
  autoload -Uz surround
  zle -N delete-surround surround
  zle -N change-surround surround
  zle -N add-surround surround
  bindkey -a 'cs' change-surround
  bindkey -a 'ds' delete-surround
  bindkey -a 'ys' add-surround
  bindkey -M visual S add-surround
fi

## Colors
# Manpage
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;35m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS_TERMCAP_ue=$'\E[0m'

# ls
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

## Completion
# autoload -Uz compinit && compinit -u
# _comp_files=(${ZDOTDIR:-$HOME}/.zcompdump(Nm-20))
# if (( $#_comp_files )); then
#   compinit -i -C
# else
#   compinit -i
# fi
# unset _comp_files

zmodload -i zsh/complist

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' cache-path ~/.zsh/cache

# Use completion menu when two or more options
zstyle ':completion:*:default' menu select=2

# Completion grouping
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'
zstyle ':completion:*' group-name ''

# Misc completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
zstyle ':completion:*' use-cache true
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

# Directory completion
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

source <($(whence kubectl) completion zsh)

## History
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
if [[ ${UID} == 0 ]]; then
  unset HISTFILE
  export SAVEHIST=0
fi

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_no_functions
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt share_history

## Editor
if (( $+commands[code] )); then
  export EDITOR="$(whence code) --wait"
else
  export EDITOR=vim
fi
export GIT_EDITOR="${EDITOR}"

## Pager
export PAGER=less
export LESS="--RAW-CONTROL-CHARS --long-prompt"
export LESSCHARSET="utf-8"
if (( $+commands[highlight] )); then
  export LESSOPEN="| $(whence highlight) %s --out-format=ansi --quiet"
else
  unset LESSOPEN
fi

## FASD & FZF
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
eval "$(fasd --init auto)"
