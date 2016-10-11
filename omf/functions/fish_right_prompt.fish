function fish_right_prompt
  set -l aws_color (set_color magenta)
  set -l k8s_color (set_color blue)
  set -l k8s_context (kubectl config current-context)

  if test -n "$aws_profile"
    echo -e -n -s $aws_color "[$aws_profile]"
  end
  echo -e -n -s $k8s_color "($k8s_context)"
end
