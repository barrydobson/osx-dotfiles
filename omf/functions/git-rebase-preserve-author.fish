function git-rebase-preserve-author -d 'Rebase preserving original author' -a branch
  git rebase --preserve-merges $branch

  set -l root_dir (git rev-parse --show-toplevel)
  while test -f $root_dir/.git/rebase-merge/stopped-sha
    set -l stopped_sha (cat $root_dir/.git/rebase-merge/stopped-sha)
    set -l git_author_string (git show -s --format='%an <%ae>' $stopped_sha)

    for c in (git diff --name-only --diff-filter=U)
      nvim $root_dir/$c
    end

    eval $EDITOR --author=$git_author_string
    grbc
  end
end
