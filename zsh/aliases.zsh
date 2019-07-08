#!/usr/bin/env zsh

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias dev='cd ~/dev'

autoload -Uz run-help
alias help=run-help

if (( $+commands[git] )); then
  alias ga='git add'
  alias gaa='git add --all'
  alias gap='git add --patch'
  alias gb='git branch'
  alias gba='git branch --all'
  alias gbd='git branch --delete'
  alias gbdf='git branch --delete --force'
  alias gbr='git branch --remote'
  alias gbu='git branch --unset-upstream'
  alias gc='git commit --gpg-sign --signoff --verbose'
  alias gc!='git commit --amend --gpg-sign --signoff --verbose'
  alias gca='git commit --all --gpg-sign --signoff --verbose'
  alias gca!='git commit --all --gpg-sign --amend --signoff --verbose'
  alias gcm='git checkout master'
  alias gco='git checkout'
  alias gcp='git cherry-pick'
  alias gd='git diff'
  alias gdm='git diff master'
  alias gfa='git fetch --all --tags --prune'
  alias gl='git pull'
  alias glog='git log --color --decorate --graph --oneline'
  alias glstat='git log --color --decorate --stat'
  alias gm='git merge'
  alias gp='git push'
  alias gpdo='git push --delete origin'
  alias gpf='git push --force'
  alias gpsu='git push --set-upstream'
  alias gpsuo='git push --set-upstream origin'
  alias gradd='git remote add'
  alias grba='git rebase --abort'
  alias grbc='git rebase --continue'
  alias grbi='git rebase --interactive'
  alias grh='git reset HEAD'
  alias grhh='git reset HEAD --hard'
  alias grp=git-rebase-preserve-author
  alias grpm='git-rebase-preserve-author master'
  alias grrm='git remote remove'
  alias grset='git remote set-url'
  alias glum='git pull upstream master'
  alias grum='git rebase upstream/master'
  alias grup='git remote update'
  alias gshow='git show --decorate'
  alias gst='git status --short --branch'
  alias gsta='git stash'
  alias gstp='git stash pop'

  if (( $+commands[git-fresh] )); then
    alias gff='git-fresh -f'
  fi

  if (( $+commands[hub] )); then
    alias git=hub
    alias gpr='git pull-request'
  fi
fi

if [[ "$(uname)" == "Darwin" ]]; then
  alias brewski='brew bundle --global && brew cleanup && brew doctor'
  alias fixbt='sudo killall coreaudiod'
  alias flushdns='sudo killall -HUP mDNSResponder'
  alias sed=gsed
  alias tar=gtar
fi

if (( $+commands[kubectl] )); then
  alias -g k=kubectl
  alias -g k214='kubectl --namespace=prd214'
  alias -g k354='kubectl --namespace=prd354'
  alias kbuild='kustomize build'
  alias kc=kube-context
  alias kkrew='kubectl krew'
  alias klogs='kubectl logs'
  alias kn='kubectl -n'
  alias kport='kubectl port-forward'
  alias kssh=kube-ssh.sh
  alias -g ksys='kubectl --namespace=kube-system'
  alias -g ktec='kubectl --namespace=tectonic-system'
  alias kwatch='watch kubectl'
fi

if (( $+commands[stern] )); then
  alias stern354='stern --namespace=prd354'
  alias sternsys='stern --namespace=kube-system'
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

alias curl-trace='curl -w "@/.curl-format.txt" -o /dev/null -s'
alias dockerclean='docker system prune --all'
alias dotfiles='code ${DOTFILES}'
alias helm354='helm --tiller-namespace=prd354'
alias less='less --force --no-init --hilite-search --ignore-case --SILENT --status-column --underline-special'
alias plugins='antibody bundle < ${DOTFILES}/zsh/plugins.txt > ~/.zsh_plugins.sh && antibody update'
alias tfgp='terraform get --update && terraform plan'
