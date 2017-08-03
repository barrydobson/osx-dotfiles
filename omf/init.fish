# Base16 shell colors
if status --is-interactive
  eval sh $HOME/.config/base16-shell/scripts/base16-summerfruit-dark.sh
end

# Git aliases
alias gaa 'git add --all'
alias gba 'git branch --all'
alias gbr 'git branch --remote'
alias gca 'git commit --all --gpg-sign --verbose'
alias gca! 'git commit --all --gpg-sign --amend --verbose'
alias gcm 'git checkout master'
alias gfa 'git fetch --all --prune'
alias glog 'git log --color --decorate --graph --oneline'
alias glstat 'git log --color --decorate --stat'
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
alias gsta 'git stash'
alias gstp 'git stash pop'

# Misc aliases
alias brewski 'brew update; and brew upgrade; brew cleanup; brew cask cleanup; brew doctor'
alias curl-trace 'curl -w "@/.curl-format.txt" -o /dev/null -s'
alias dockerclean 'docker system prune --all'
alias fixbt 'sudo killall coreaudiod'
alias flushdns 'sudo killall -HUP mDNSResponder'
alias vfish 'vim $HOME/.config/omf/init.fish; and omf reload'
alias vinstall 'vim $HOME/dotfiles/install.conf.yaml'
alias vrc 'vim $HOME/.vimrc'
alias vtm 'vim $HOME/tmux.conf'

# Kubernetes aliases
alias kube-drain 'kubectl drain --timeout=5m --delete-local-data --force --ignore-daemonsets'
alias kube-logs 'kubectl logs'
alias kube-port 'kubectl port-forward'
alias kube-354 'kubectl --namespace=prd354'
alias kube-sys 'kubectl --namespace=kube-system'
alias kube-tec 'kubectl --namespace=tectonic-system'
alias kubewatch 'watch kubectl'

# Terraform aliases
alias tfgp 'terraform get --update; and terraform plan'

# Editor settings
set -gx EDITOR vim
set -gx VISUAL vim

# Paths
set -gx GOPATH $HOME/dev/go
set -gx PATH $HOME/bin $GOPATH/bin $PATH
set -gx PYTHONPATH /usr/local/lib/python2.7/site-packages $PYTHONPATH

# FZF settings
set -gx FZF_COMPLETION_TRIGGER ""
set -gx FZF_TMUX 1
set -gx FZF_TMUX_HEIGHT "20%"

# Man page colors
set -g man_blink red
set -g man_bold blue
set -g man_standout -b white magenta
set -g man_underline -u green

# Less syntax highlighting
set hilite (which highlight)
set -gx LESSOPEN "| $hilite %s --out-format xterm256 --quiet --force "
set -gx LESS " -R"
