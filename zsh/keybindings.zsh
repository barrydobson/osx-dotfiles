#!/usr/bin/env zsh

# bindkey -d
bindkey -v

bindkey -M vicmd '^A' beginning-of-line
bindkey -M vicmd 'gg' beginning-of-line
bindkey -M vicmd '^E' end-of-line
bindkey -M vicmd 'G'  end-of-line

bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line

autoload -Uz surround
zle -N delete-surround surround
zle -N change-surround surround
zle -N add-surround surround
bindkey -a 'cs' change-surround
bindkey -a 'ds' delete-surround
bindkey -a 'ys' add-surround
bindkey -M visual S add-surround

source /usr/local/opt/fzf/shell/key-bindings.zsh
