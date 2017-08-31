function find-replace -d 'Finds & replaces text in all subdirectories' -a find replace
  for m in (ag $find --files-with-matches)
    sed -i '' -e "s/$find/$replace/g" $m
  end
end
