function asp --description 'Switch AWS profile' --argument 'AWS_PROFILE'
  if test -z "$AWS_PROFILE"
    echo "$AWS_DEFAULT_PROFILE"
  else
    set -gx AWS_ACCESS_KEY_ID (crudini --get ~/.aws/credentials "$AWS_PROFILE" aws_access_key_id)
    set -gx AWS_DEFAULT_PROFILE "$AWS_PROFILE"
    set -gx AWS_DEFAULT_REGION (crudini --get ~/.aws/config "profile $AWS_PROFILE" region)
    set -gx AWS_SECRET_ACCESS_KEY (crudini --get ~/.aws/credentials "$AWS_PROFILE" aws_secret_access_key)
  end
end
