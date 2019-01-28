#!/usr/bin/env zsh

if (( $+commands[code] )); then
  export EDITOR=code
  export GIT_EDITOR="code --wait"
else
  export EDITOR=vim
  export GIT_EDITOR=vim
fi
