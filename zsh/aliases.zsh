#!/usr/bin/env zsh

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

autoload -Uz run-help
alias help=run-help

if (( $+commands[git] )); then
  alias finishpr='git pull upstream master && git push && git-fresh -f'
  alias gaa='git add --all'
  alias gba='git branch --all'
  alias gbr='git branch --remote'
  alias gca='git commit --all --gpg-sign --verbose'
  alias gca!='git commit --all --gpg-sign --amend --verbose'
  alias gcm='git checkout master'
  alias gcp='git cherry-pick'
  alias gdm='git diff master'
  alias gfa='git fetch --all --tags --prune'
  alias glog='git log --color --decorate --graph --oneline'
  alias glstat='git log --color --decorate --stat'
  alias gpf='git push --force'
  alias gradd='git remote add'
  alias grba='git rebase --abort'
  alias grbc='git rebase --continue'
  alias grbi='git rebase --interactive'
  alias grh='git reset HEAD'
  alias grhh='git reset HEAD --hard'
  alias grpm='git-rebase-preserve-author master'
  alias grset='git remote set-url'
  alias glum='git pull upstream master'
  alias grum='git rebase upstream/master'
  alias grup='git remote update'
  alias gshow='git show --decorate'
  alias gst='git status --short --branch'
  alias gsta='git stash'
  alias gstp='git stash pop'

  abbrev-alias -g ga='git add'
  abbrev-alias -g gap='git add --patch'
  abbrev-alias -g gb='git branch'
  abbrev-alias -g gbd='git branch --delete'
  abbrev-alias -g gbdf='git branch --delete --force'
  abbrev-alias -g gbsu='git branch --set-upstream-to'
  abbrev-alias -g gc='git commit --gpg-sign --verbose'
  abbrev-alias -g gc!='git commit --amend --gpg-sign --verbose'
  abbrev-alias -g gco='git checkout'
  abbrev-alias -g gd='git diff'
  abbrev-alias -g gl='git pull'
  abbrev-alias -g gm='git merge'
  abbrev-alias -g gp='git push'
  abbrev-alias -g gpdo='git push --delete origin'
  abbrev-alias -g gpsu='git push --set-upstream'
  abbrev-alias -g gpsuo='git push --set-upstream origin'
  abbrev-alias -g grp=git-rebase-preserve-author
  abbrev-alias -g grrm='git remote remove'

  if (( $+commands[hub] )); then
    alias git=hub

    abbrev-alias -g gpr='git pull-request'
  fi
fi

if [[ "$(uname)" == "Darwin" ]]; then
  alias brewski='brew update && brew upgrade && brew cleanup && brew doctor'
  alias fixbt='sudo killall coreaudiod'
  alias flushdns='sudo killall -HUP mDNSResponder'
fi

if (( $+commands[kubectl] )); then
  alias k214='kubectl --namespace=prd214'
  alias k354='kubectl --namespace=prd354'
  alias kc=kube-context
  alias klogs='kubectl logs'
  alias kport='kubectl port-forward'
  alias kssh=kube-ssh
  alias ksys='kubectl --namespace=kube-system'
  alias ktec='kubectl --namespace=tectonic-system'
  alias kwatch='watch kubectl'

  abbrev-alias -g k=kubectl
  abbrev-alias -g kn='kubectl -n'
fi

if (( $+commands[exa] )); then
  alias ls='exa'
  alias tree='exa --tree'
elif (( $+commands[ls] )); then
  if is_osx; then
    alias ls='ls -GF'
  else
    alias ls='ls -F --color'
  fi
fi

alias cdgo='cd $GOPATH'
alias curl-trace='curl -w "@/.curl-format.txt" -o /dev/null -s'
alias dockerclean='docker system prune --all'
alias less='less --force --no-init --hilite-search --ignore-case --SILENT --status-column --underline-special'
alias plugins='antibody bundle < ${DOTFILES}/zsh/plugins.txt > ~/.zsh_plugins.sh && antibody update'
alias tfgp='terraform get --update && terraform plan'

abbrev-alias -g helm354='helm --tiller-namespace=prd354'
