# Default Vim-like keybindings
bindkey -v

# Emacs-like keybinds for vicmd mode
bindkey -M vicmd '^A'  beginning-of-line
bindkey -M vicmd '^E'  end-of-line

# Emacs-like keybinds for viins mode
bindkey -M viins '^A'  beginning-of-line
bindkey -M viins '^E'  end-of-line

bindkey -M vicmd 'gg' beginning-of-line
bindkey -M vicmd 'G'  end-of-line

if is-at-least 5.0.8; then
  autoload -Uz surround
  zle -N delete-surround surround
  zle -N change-surround surround
  zle -N add-surround surround
  bindkey -a 'cs' change-surround
  bindkey -a 'ds' delete-surround
  bindkey -a 'ys' add-surround
  bindkey -M visual S add-surround
fi
