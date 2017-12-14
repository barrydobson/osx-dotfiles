function update-tectonic-license -d 'Updates the Tectonic license secret' -a license_file contexts
  set -l license_secrets tectonic-license tectonic-license-secret
  set -l current_context (kubectl config current-context)

  if test -z "$license_file"
    echo "usage: update-tectonic-license <path/to/license_file> [<contexts>]"
  end

  if test -z "$contexts"
    set contexts (kubectl config view -o go-template="{{ range .contexts }}{{ .name | println }}{{ end }}")
  end

  for context in $contexts
    kubectl config use-context $context

    for secret in (kubectl -n tectonic-system get secrets \
      -o go-template="{{ range .items }}{{ .metadata.name | println }}{{ end }}")
      if contains $secret $license_secrets
        kubectl -n tectonic-system delete secret $secret
        kubectl -n tectonic-system create secret generic $secret \
          --from-file license=$license_file
      end
    end
    echo
  end

  kubectl config use-context $current_context
end

