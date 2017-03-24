# Tmux
alias vtm="vim ~/.tmux.conf"

# Vim
alias vrc="vim ~/.vimrc"

# Zsh
alias zrc="vim ~/.zshrc"
alias reload="source ~/.zshrc"

# Git
eval "$(hub alias -s)"
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gba="git branch --all"
alias gbd="git branch -d"
alias gbdf="git branch -D"
alias gbr="git branch --remote"
alias gc="git commit --gpg-sign --verbose"
alias gc!="git commit --amend --gpg-sign --verbose"
alias gca="git commit --all --gpg-sign --verbose"
alias gca!="git commit --all --gpg-sign --amend --verbose"
alias gcm="git checkout master"
alias gco="git checkout"
alias gd="git diff"
alias gfa="git fetch --all --prune"
alias gl="git pull"
alias glog="git log --color --decorate --graph --oneline"
alias glstat="git log --color --decorate --stat"
alias gp="git push"
alias gpdo="git push --delete origin"
alias gpf="git push --force"
alias gpr="git pull-request"
alias gpsu="git push --set-upstream"
alias gradd="git remote add"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grbi="git rebase --interactive"
alias grh="git reset HEAD"
alias grhh="git reset HEAD --hard"
alias grpm="git rebase --preserve-merges master"
alias grset="git remote set-url"
alias glum="git pull upstream master"
alias grum="git rebase upstream/master"
alias grup="git remote update"
alias gshow="git show --decorate"
alias gst="git status --short --branch"

# Misc
alias brewski="brew update && brew upgrade; brew cleanup; brew cask cleanup; brew doctor"
alias dockerclean="docker system prune --all"
alias fixbt="sudo killall coreaudiod"
alias flushdns="sudo killall -HUP mDNSResponder"

# Kubernetes
alias kube-drain="kubectl drain --force --ignore-daemonsets --delete-local-data"
alias kube-log="kubectl logs"
alias kube-sys="kubectl --namespace=kube-system"
alias kubewatch="watch kubectl"

# Terraform
alias tfgp="terraform get --update && terraform plan"
