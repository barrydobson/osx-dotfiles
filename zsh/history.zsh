# https://github.com/xero/dotfiles/blob/master/zsh/.zsh/history.zsh

HISTFILE=~/.zhistory
HISTSIZE=1200
SAVEHIST=1000

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
