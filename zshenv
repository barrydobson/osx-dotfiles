typeset -gx -U path
path=( \
  /usr/local/bin(N-/) \
  ~/bin(N-/) \
  ~/.zplug/bin(N-/) \
  "$path[@]" \
)

# NOTE: set fpath before compinit
typeset -gx -U fpath
fpath=( \
  /usr/local/share/zsh/site-functions(N-/) \
  $fpath \
)

setopt no_global_rcs

export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

export GOPATH="${HOME}/dev/go"
export GOBIN="${GOPATH}/bin"
export PATH="~/bin:${GOBIN}:${PATH}"

export CORRECT_IGNORE='_*'
export CORRECT_IGNORE_FILE='.*'

# Treat these characters as part of a word
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export FZF_DEFAULT_OPTS="--ansi --color=16 --height=40% --reverse"

export KUBECONFIG="${HOME}/.kube/config:${HOME}/Downloads/admin.conf"

export LISTMAX=50
