function fish_right_prompt
  set -l right_prompt (set_color purple)

  if test -n "$AWS_DEFAULT_PROFILE"
    echo -e -n -s $right_prompt "[$AWS_DEFAULT_PROFILE]"
  end
end
