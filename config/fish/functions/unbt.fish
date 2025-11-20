function unbt --wraps='sudo rfkill unblock bluetooth' --description 'alias unbt=sudo rfkill unblock bluetooth'
  sudo rfkill unblock bluetooth $argv
        
end
