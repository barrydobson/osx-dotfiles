docker-rmi() {
  docker images \
    | fzf --header-lines=1 --multi \
    | awk '{print $3}' \
    | xargs docker rmi ${1+"$@"}
}

source <($(whence kubectl) completion zsh)
source <($(whence helm) completion zsh)

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
