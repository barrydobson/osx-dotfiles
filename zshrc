umask 022
limit coredumpsize 0
bindkey -d

if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

if [[ -f ~/.zplug/init.zsh ]]; then
  export ZPLUG_LOADFILE=~/.zsh/zplug.zsh
  source ~/.zplug/init.zsh

  zplug check || zplug install
  zplug load
fi

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
