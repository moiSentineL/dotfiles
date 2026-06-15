function kattis --wraps='python submit.py ' --description 'alias kattis=python submit.py '
  set kattisdir "/home/nibir/docs/coding/kattis/"
  python "$kattisdir/submit.py"  $argv
        
end
