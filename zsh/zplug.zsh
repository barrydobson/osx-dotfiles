zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "~/.zsh", from:local, use:"<->_*.zsh"

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "b4b4r07/enhancd", use:"init.sh"
if zplug check "b4b4r07/enhancd"; then
  export ENHANCD_FILTER="fzf --no-multi"
  export ENHANCD_DOT_SHOW_FULLPATH=1
fi

zplug "momo-lab/zsh-abbrev-alias"
zplug "paulirish/git-open"

zplug "mafredri/zsh-async", use:"async.zsh"
zplug "sindresorhus/pure", use:"pure.zsh", as:theme

zplug "plugins/docker", from:oh-my-zsh, if:"(( $+commands[docker] ))"

zplug "mgoodness/600f9c9da8679cca98732dbf8a6c4411", from:gist, use:"find-replace.sh"
zplug "mgoodness/3998eb4aab8ca01a6b5468f76586f48f", from:gist, use:"k8s-api.sh"
zplug "mgoodness/3f99876a9422525b23725061ba83c517", from:gist, \
  if:"(( $+commands[git] ))", use:"git-rebase-preserve-author.sh"
