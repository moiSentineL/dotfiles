function fonts --wraps='fc-list : family | sort | uniq' --description 'alias fonts=fc-list : family | sort | uniq'
  fc-list : family | sort | uniq $argv
        
end
