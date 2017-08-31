function shipit -d 'Indexes & uploads Helm packages to opsgoodness repo'
  set -l chart_repo_bucket "charts.opsgoodness.com"

  gsutil cp "gs://$chart_repo_bucket/index.yaml" .
  helm repo index . --url "http://$chart_repo_bucket" --merge index.yaml
  gsutil -h Cache-Control:private cp -a public-read \
    "*.tgz" "gs://$chart_repo_bucket"
  gsutil -h Cache-Control:private cp -a public-read \
    index.yaml "gs://$chart_repo_bucket"

  rm index.yaml
end
