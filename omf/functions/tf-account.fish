function tf-account -d "Runs Terraformer against the given account" -a account region action
  set -l terraformer_version v0.10.0-aws012

  asp kubernauts-$account-Admin-Techops

  terraformer $terraformer_version kubernauts-$account/$account.$region \
    get --update

  terraformer $terraformer_version kubernauts-$account/$account.$region $action
end
