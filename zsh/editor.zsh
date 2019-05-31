#!/usr/bin/env zsh

export EDITOR=vim
export GIT_EDITOR=vim

if (( $+commands[code] )); then
  # export EDITOR=code
  export GIT_EDITOR="code --wait"
fi
