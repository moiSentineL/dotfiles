function ggpush --wraps='git push origin main' --description 'alias ggpush=git push origin main'
  git push origin main $argv
        
end
