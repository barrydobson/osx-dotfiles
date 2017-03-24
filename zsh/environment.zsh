# https://github.com/xero/dotfiles/blob/master/zsh/.zsh/environment.zsh

export GOPATH=$(go env GOPATH)
export PATH=~/bin:$(go env GOPATH)/bin:/usr/local/opt/fzf/bin:${PATH}
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:${PYTHONPATH}

export EDITOR=vim
export VISUAL=vim

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LESSCHARSET=utf-8

export CLICOLOR=1

export FZF_COMPLETION_TRIGGER=''
export FZF_TMUX=1
export FZF_TMUX_HEIGHT="20%"
