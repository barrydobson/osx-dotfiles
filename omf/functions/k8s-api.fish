function k8s-api -d 'Opens Kubernetes API reference' -a version
  set -l host (echo $version | sed 's/\./-/')
  open https://v$host.docs.kubernetes.io/docs/api-reference/v$version/
end
