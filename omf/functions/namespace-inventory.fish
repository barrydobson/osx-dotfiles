function namespace-inventory
  for namespace in (kubectl get ns -o name | cut -d/ -f2)
    switch $namespace
      case kube-system tectonic-system prd354 prd396
        continue
    end

    if test (kubectl -n $namespace get po --no-headers --ignore-not-found | wc -l | tr -d ' ') -gt 1
      set -l product_name (kubectl get ns $namespace -o json | jq -r '.metadata.annotations."ticketmaster.com/name"')
      set -l tech_owners (kubectl get ns $namespace -o json | jq -r '.metadata.annotations."ticketmaster.com/tech-owner"')
      set -l support_email (kubectl get ns $namespace -o json | jq -r '.metadata.annotations."ticketmaster.com/support-email"')
      echo "$namespace, $product_name, $tech_owners, $support_email"
    end
  end
end
