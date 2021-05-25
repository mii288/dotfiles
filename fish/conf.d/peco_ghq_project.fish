function peco_ghq_project
  set path (ghq list -p | peco)
  if test -n "$path"
    cd $path
  end
end
