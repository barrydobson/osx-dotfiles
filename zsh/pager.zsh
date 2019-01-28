#!/usr/bin/env zsh

export PAGER=less
export LESS="--RAW-CONTROL-CHARS --long-prompt"
export LESSCHARSET="utf-8"
if (( $+commands[highlight] )); then
  export LESSOPEN="| $(whence highlight) %s --out-format=ansi --quiet"
else
  unset LESSOPEN
fi
