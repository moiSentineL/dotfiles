function reopentablet --wraps='systemctl --user restart opentabletdriver.service' --description 'alias reopentablet=systemctl --user restart opentabletdriver.service'
  systemctl --user restart opentabletdriver.service $argv
        
end
