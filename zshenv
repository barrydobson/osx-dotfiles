# Don't source config from /etc
setopt no_global_rcs

export DOTFILES="${HOME}/dotfiles"

typeset -gx -U path
path=( \
  /usr/local/bin(N-/) \
  ~/bin(N-/) \
  "$path[@]" \
)

export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

export GOPATH="${HOME}/dev/go"
export GOBIN="${GOPATH}/bin"
export PATH="~/bin:${GOBIN}:${PATH}"

export KUBECONFIG="${HOME}/.kube/config:${HOME}/Downloads/admin.conf"
