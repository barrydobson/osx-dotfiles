function find-replace -d 'Finds & replaces text in all subdirectories' -a find replace
  for m in (ag --files-with-matches -- $find)
    sed -i '' -e "s/$find/$replace/g" $m
  end
end
