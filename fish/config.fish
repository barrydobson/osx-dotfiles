# Git aliases
alias ga 'git add'
alias gaa 'git add --all'
alias gb 'git branch'
alias gba 'git branch -a'
alias gbr 'git branch --remote'
alias gc 'git commit -v'
alias gc! 'git commit --amend -v'
alias gca 'git commit -a -v'
alias gca! 'git commit -a --amend -v'
alias gcm 'git checkout master'
alias gco 'git checkout'
alias gd 'git diff'
alias gfa 'git fetch --all --prune'
alias gl 'git pull'
alias glog 'git log --color --decorate --graph --oneline'
alias glstat 'git log --color --decorate --stat'
alias gm 'git merge'
alias gp 'git push'
alias gr 'git remote'
alias grba 'git rebase --abort'
alias grbc 'git rebase --continue'
alias grbi 'git rebase -i'
alias grh 'git reset HEAD'
alias grhh 'git reset HEAD --hard'
alias grmv 'git remote rename'
alias grrm 'git remote remove'
alias grset 'git remote set-url'
alias grup 'git remote update'
alias gshow 'git show --decorate'
alias gst 'git status --short --branch'
alias gsta 'git stash'
alias gstp 'git stash pop'

# Misc aliases
alias curl-trace 'curl -w "@$HOME/.dotfiles/curl-format" -o /dev/null -s'
alias dockerclean 'docker rm (docker ps -a -q); docker rmi (docker images -q --filter "dangling=true")'
alias fixbt 'sudo killall coreaudiod'
alias flushdns 'sudo killall -HUP mDNSResponder'
alias grep 'ack -i'
alias kubesys 'kubectl --namespace=kube-system'
alias which 'type -a'

# Terraform aliases
alias tfgp 'terraform get --update; and terraform plan'

# Set variables
set -gx EDITOR "vim"
set -gx GOPATH "$HOME/dev/golang"
set -gx GRADLE_OPTS "-Xmx512m"
set -gx JAVA_HOME (/usr/libexec/java_home -v "1.8*")
set -gx PATH $PATH "$GOPATH/bin" "$HOME/dev/william/bin"
