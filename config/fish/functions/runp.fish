function runp
  set file (ls *.py | fzf)
  python $file
end
