# Git aliases
alias gaa 'git add --all'
alias gba 'git branch --all'
alias gbr 'git branch --remote'
alias gc 'git commit --gpg-sign --verbose'
alias gc! 'git commit --amend --gpg-sign --verbose'
alias gca 'git commit --all --gpg-sign --verbose'
alias gca! 'git commit --all --gpg-sign --amend --verbose'
alias gcm 'git checkout master'
alias gfa 'git fetch --all --prune'
alias glog 'git log --color --decorate --graph --oneline'
alias glstat 'git log --color --decorate --stat'
alias gpdo 'git push --delete origin'
alias gpf 'git push --force'
alias gradd 'git remote add'
alias grba 'git rebase --abort'
alias grbc 'git rebase --continue'
alias grbi 'git rebase --interactive'
alias grh 'git reset HEAD'
alias grhh 'git reset HEAD --hard'
alias grpm 'git rebase --preserve-merges master'
alias grset 'git remote set-url'
alias glum 'git pull upstream master'
alias grum 'git rebase upstream/master'
alias grup 'git remote update'
alias gshow 'git show --decorate'
alias gst 'git status --short --branch'

# Misc aliases
alias brewski 'brew update; and brew upgrade; brew cleanup; brew cask cleanup; brew doctor'
alias curl-trace 'curl -w "@$HOME/.dotfiles/curl-format" -o /dev/null -s'
alias dockerclean 'docker system prune --all'
alias fixbt 'sudo killall coreaudiod'
alias flushdns 'sudo killall -HUP mDNSResponder'

# Kubernetes aliases
alias kube-coll 'kubectl --namespace=collective'
alias kube-dam 'kubectl --namespace=dam'
alias kube-drain 'kubectl drain --force --ignore-daemonsets --delete-local-data'
alias kube-edge 'kubectl --namespace=edge'
alias kube-juice 'kubectl --namespace=polyjuice'
alias kube-lens 'kubectl --namespace=lens'
alias kube-mon 'kubectl --namespace=monitoring'
alias kube-plat 'kubectl --namespace=platform'
alias kube-print 'kubectl --namespace=printui-connector'
alias kube-sys 'kubectl --namespace=kube-system'
alias kube-wip 'kubectl --namespace=wip'
alias kube-wolf 'kubectl --namespace=graywolf'

# Terraform aliases
alias tfgp 'terraform get --update; and terraform plan'

# Set variables
set -gx EDITOR "vim"
set -gx GOPATH "$HOME/dev/golang"
set -gx GRADLE_OPTS "-Xmx512m"
set -gx HELM_HOME "$HOME/.helm"
set -gx JAVA_HOME (/usr/libexec/java_home -v "1.8*")

# GPG
gpg-init

# test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
