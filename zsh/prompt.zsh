COLOR_DIR="%F{blue}"
COLOR_GIT_CLEAN="%F{green}"
COLOR_GIT_DIRTY="%F{yellow}"
COLOR_NORMAL="%F{white}"

ICO_AHEAD="+"
ICO_BEHIND="-"
ICO_DIVERGED="±"

setopt PROMPT_SUBST
autoload -Uz colors && colors

git_prompt() {
  if [ $(git rev-parse --is-inside-work-tree 2> /dev/null) ]; then
    git_branch_name=$(git name-rev --name-only HEAD | sed 's!remotes/!!' 2> /dev/null)
    git_color="${COLOR_GIT_CLEAN}" && \
      [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && \
      git_color="${COLOR_GIT_DIRTY}"

    git_status=$(git status | sed -n 2p)
    case "$git_status" in
      *ahead*)
        git_status=$ICO_AHEAD
      ;;
      *behind*)
        git_status=$ICO_BEHIND
      ;;
      *diverged*)
        git_status=$ICO_DIVERGED
      ;;
      *)
        git_status=""
      ;;
    esac

    echo "${COLOR_NORMAL} · ($git_color$git_branch_name$git_status${COLOR_NORMAL})"
  fi
}

precmd() { print "" }
PROMPT='${COLOR_DIR}%~$(git_prompt)$prompt_newline%{$(iterm2_prompt_mark)%}%# '
