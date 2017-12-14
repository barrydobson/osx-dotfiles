function count-ingress
  for namespace in (kubectl get ns -o name | cut -d/ -f2)
    set -l product_name (kubectl get ns $namespace -o json | jq -r '.metadata.annotations."ticketmaster.com/name"')
    set -l tech_owners (kubectl get ns $namespace -o json | jq -r '.metadata.annotations."ticketmaster.com/tech-owner"')
    set -l count (kubectl -n $namespace get ing --no-headers --ignore-not-found | wc -l | tr -d ' ')
    if test $count -ge 5; echo $namespace \($product_name - $tech_owners\): $count; end
  end
end
