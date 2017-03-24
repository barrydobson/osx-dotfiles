# https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/key-bindings.zsh

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

bindkey -v

source /usr/local/opt/fzf/shell/key-bindings.zsh

# bindkey '^T' fzf-completion
# bindkey '^I' $fzf_default_completion
