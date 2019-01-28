#!/usr/bin/env zsh

# Ref: https://github.com/caarlos0/dotfiles

umask 022

typeset -U config_files
config_files=(${DOTFILES}/zsh/*.zsh)

[[ -f ~/.zsh_plugins.sh ]] && source ~/.zsh_plugins.sh

for file in ${${config_files}:#*/completion.zsh}; do
  source "$file"
done

typeset -gx -U fpath
fpath=( \
  /usr/local/share/zsh/site-functions(N-/) \
  ${DOTFILES}/zsh/functions \
  $fpath \
)

autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [[ $(date +'%j') != ${updated_at} ]]; then
  compinit -i
else
  compinit -C -i
fi

for file in ${(M)config_files:#*/completion.zsh}; do
  source "$file"
done

unset config_files updated_at

autoload -U "${DOTFILES}"/zsh/functions/*(:t)

# Number of matches to list without asking first
export LISTMAX=50

# Treat these characters as part of a word
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

if (( $+commands[fasd] )); then
  fasd_cache="${HOME}/.fasd-init-cache"
  if [[ "$(whence fasd)" -nt "${fasd_cache}" ]] || [[ ! -s "${fasd_cache}" ]]; then
    fasd --init auto >| "${fasd_cache}"
  fi

  source "${fasd_cache}"
  unset fasd_cache
fi
