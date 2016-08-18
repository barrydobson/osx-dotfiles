function fish_right_prompt
  set -l asp_color (set_color magenta)
  set -l k8s_color (set_color blue)
  set -l k8s_context (kubectl config current-context)

  if test -n "$AWS_DEFAULT_PROFILE"
    echo -e -n -s $asp_color "[$AWS_DEFAULT_PROFILE]"
  end
  echo -e -n -s $k8s_color "($k8s_context)"
end
