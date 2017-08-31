function helm-clean -d 'Deletes failed Helm releases'
  set -l helm_command "helm --tiller-namespace=prd354"

  for r in (eval $helm_command list --failed -q)
    eval $helm_command delete --purge $r
  end
end
